import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:symphony/data/model/song_data.dart';
import 'package:symphony/data/provider/api_provider.dart';
import 'package:home_widget/home_widget.dart';

class PlayerController extends GetxController {
  final _audioPlayer = AudioPlayer();
  final _cloudinaryApi = Get.put(ApiProvider());
  final Rx<Duration?> _duration = const Duration(milliseconds: 0).obs;
  final Rx<Duration> _position = const Duration(milliseconds: 0).obs;
  final Rx<Duration> _bufferedPosition = const Duration(milliseconds: 0).obs;
  final RxBool _isPlaying = false.obs;
  final RxBool _isShuffle = false.obs;
  final RxBool _isLoop = false.obs;
  final RxString _playlistTitle = "".obs;
  final Rx<SongData> _currentSong = SongData(
    title: "",
    artists: [""],
    album: "",
    duration: 0,
  ).obs;
  final RxList<SongData> _data = [
    SongData(
      title: "",
      artists: [""],
      album: "",
      duration: 0,
    )
  ].obs;

  //getters
  SongData get getCurrentSong => _currentSong.value;
  Duration? get getDuration => _duration.value;
  Duration get getPosition => _position.value;
  Duration get getBufferedPosition => _bufferedPosition.value;
  bool get getIsPlaying => _isPlaying.value;
  bool get getIsShuffle => _isShuffle.value;
  bool get getIsLoop => _isLoop.value;
  String get getPlaylistTitle => _playlistTitle.value;

  Future<void> _updateAppWidget() async {
    await HomeWidget.saveWidgetData<String>(
        "_songTitle", _currentSong.value.title);
    await HomeWidget.saveWidgetData<String>(
        "_songArtists", _currentSong.value.artists.join(", "));
    await HomeWidget.saveWidgetData<String>("_songAlbumPic",
        _cloudinaryApi.getAlbumPicURL(_currentSong.value.album));
    await HomeWidget.updateWidget(
        name: "PlayerWidgetProvider", iOSName: "PlayerWidgetProvider");
  }

  @override
  void onInit() {
       _audioPlayer.currentIndexStream.listen((event) {
      if (event != null) {
        _currentSong.value = _data[event];
        _updateAppWidget();
      }
    });
    _audioPlayer.durationStream.listen((event) {
      _duration.value = event ?? Duration.zero;
    });
    _audioPlayer.bufferedPositionStream.listen((event) {
      _bufferedPosition.value = event;
    });
    _audioPlayer.positionStream.listen((event) {
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

    super.onInit();
  }

  void play(List<SongData> songs, int index, String playlistTitle) async {
    _data.value = songs;
    _playlistTitle.value = playlistTitle;

    await _audioPlayer
        .setAudioSource(
      ConcatenatingAudioSource(
        children: songs
            .map(
              (e) => AudioSource.uri(
                Uri.parse(_cloudinaryApi.getSongURL(e.title, e.artists[0])),
                tag: MediaItem(
                  id: e.title,
                  album: e.album,
                  title: e.title,
                  artist: e.artists.join(", "),
                  artUri: Uri.parse(
                    _cloudinaryApi.getAlbumPicURL(e.album),
                  ),
                ),
              ),
            )
            .toList(),
      ),
      initialIndex: index,
    )
        .then(
      (value) {
        _audioPlayer.stop();
        _audioPlayer.play();
      },
    );
  }

  void next() {
    _audioPlayer.seekToNext();
  }

  void previous() {
    _audioPlayer.seekToPrevious();
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
    } else {
      _audioPlayer.play();
    }
  }

  void seekTo(position) {
    _audioPlayer.seek(position);
  }
}
