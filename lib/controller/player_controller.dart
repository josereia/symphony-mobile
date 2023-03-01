import 'dart:io';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:symphony/data/model/playlist_model.dart';
//import 'package:just_audio_background/just_audio_background.dart';
import 'package:symphony/data/model/song_model.dart';
import 'package:video_player/video_player.dart';
//import 'package:home_widget/home_widget.dart';

class PlayerController extends GetxController {
  final _audioPlayer = AudioPlayer();
  final Rx<Duration?> _duration = const Duration(milliseconds: 0).obs;
  final Rx<Duration> _position = const Duration(milliseconds: 0).obs;
  final Rx<Duration> _bufferedPosition = const Duration(milliseconds: 0).obs;
  final RxBool _isPlaying = false.obs;
  final RxBool _isShuffle = false.obs;
  final RxBool _isLoop = false.obs;
  final RxString _playlistTitle = "".obs;
  final Rx<SongModel?> _currentSong = Rx(null);
  final Rx<FlickManager?> _videoPlayerController = Rx(null);
  final VideoPlayerOptions _videoPlayerOptions = VideoPlayerOptions(
    mixWithOthers: true,
    allowBackgroundPlayback: true,
  );

  final Rx<List<SongModel>> _data = Rx([
    SongModel(
      id: "",
      title: "",
      duration: const Duration(milliseconds: 0),
      audio: Uri(),
      video: Uri(),
      author: "",
      thumbnail: Uri(),
    )
  ]);

  //getters
  SongModel? get getCurrentSong => _currentSong.value;
  Duration? get getDuration => _duration.value;
  Duration get getPosition => _position.value;
  Duration get getBufferedPosition => _bufferedPosition.value;
  bool get getIsPlaying => _isPlaying.value;
  bool get getIsShuffle => _isShuffle.value;
  bool get getIsLoop => _isLoop.value;
  String get getPlaylistTitle => _playlistTitle.value;
  FlickManager? get getVideoPlayerController => _videoPlayerController.value;

  /*Future<void> _updateAppWidget() async {
    await HomeWidget.saveWidgetData<String>(
      "_songTitle",
      _currentSong.value?.title ?? "",
    );
    await HomeWidget.saveWidgetData<String>(
      "_songArtists",
      _currentSong.value?.artists.join(", ") ?? "",
    );
    await HomeWidget.saveWidgetData<String>(
      "_songAlbumPic",
      _cloudinaryApi.getAlbumPicURL(_currentSong.value?.album ?? ""),
    );
    await HomeWidget.updateWidget(
      name: "PlayerWidgetProvider",
      iOSName: "PlayerWidgetProvider",
    );
  }*/

  Future<void> _loadVideo() async {
    await _videoPlayerController.value?.handleChangeVideo(
      VideoPlayerController.network(
        _currentSong.value!.video.toString(),
        videoPlayerOptions: _videoPlayerOptions,
      ),
    );
    _videoPlayerController.value?.flickControlManager?.play();
  }

  @override
  void onInit() {
    super.onInit();

    _videoPlayerController.value = FlickManager(
      videoPlayerController: VideoPlayerController.network(
        "",
        videoPlayerOptions: _videoPlayerOptions,
      ),
    );

    _audioPlayer.currentIndexStream.listen((event) async {
      if (event != null) {
        _currentSong.value = _data.value[event];

        // _updateAppWidget();
        await _loadVideo().then((value) => _audioPlayer.play());
      }
    });
    _audioPlayer.durationStream.listen((event) {
      _duration.value = event ?? Duration.zero;
    });
    _audioPlayer.bufferedPositionStream.listen((event) {
      _bufferedPosition.value = event;
    });
    _audioPlayer.positionStream.listen((event) async {
      _position.value = event;
    });
    _audioPlayer.shuffleModeEnabledStream.listen((event) {
      _isShuffle.value = event;
    });
    _audioPlayer.playerStateStream.listen((event) {
      _isPlaying.value = event.playing;
    });
    _audioPlayer.loopModeStream.listen((event) {
      _isLoop.value = (event == LoopMode.one ? true : false);
    });
  }

  @override
  void onClose() {
    super.onClose();
    _audioPlayer.dispose();
    _videoPlayerController.value?.dispose();
  }

  void play({required PlaylistModel playlist, required int index}) async {
    _data.value = playlist.songs;
    _playlistTitle.value = playlist.title;
    _currentSong.value = _data.value[index];

    final songs = _data.value
        .map(
          (e) => AudioSource.uri(
            e.audio,
            tag: MediaItem(
              id: e.id,
              title: e.title,
              artist: e.author,
              duration: e.duration,
              artUri: e.thumbnail,
            ),
          ),
        )
        .toList();

    await _audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        useLazyPreparation: true,
        children: songs,
      ),
      initialIndex: index,
      initialPosition: const Duration(milliseconds: 0),
    );
  }

  Future<void> next() async {
    await _audioPlayer.pause();
    await _audioPlayer.seekToNext();
  }

  Future<void> previous() async {
    await _audioPlayer.pause();
    await _audioPlayer.seekToPrevious();
  }

  void repeat() {
    if (getIsLoop) {
      _audioPlayer.setLoopMode(LoopMode.off);
    } else {
      _audioPlayer.setLoopMode(LoopMode.one);
    }
  }

  void shuffle() {
    if (getIsShuffle) {
      _audioPlayer.setShuffleModeEnabled(false);
    } else {
      _audioPlayer.setShuffleModeEnabled(true);
    }
  }

  void playPause() {
    if (getIsPlaying) {
      _audioPlayer.pause();
      _videoPlayerController.value?.flickControlManager?.pause();
    } else {
      _audioPlayer.play();
      _videoPlayerController.value?.flickControlManager?.play();
    }
  }

  void stop() {
    _audioPlayer.stop();
  }

  Future<void> _seekVideo() async {
    await _videoPlayerController.value?.flickControlManager?.seekTo(
      _audioPlayer.position,
    );
  }

  void seekTo(position) async {
    _audioPlayer.pause();
    _videoPlayerController.value?.flickControlManager?.pause();
    _audioPlayer.seek(position);
    _seekVideo().then((value) {
      sleep(const Duration(milliseconds: 500));
      _videoPlayerController.value?.flickControlManager?.play();
      _audioPlayer.play();
    });
  }
}
