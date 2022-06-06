import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:symphony/data/model/song_data.dart';
import 'package:symphony/data/provider/api_provider.dart';

class PlayerController extends GetxController {
  final _audioPlayer = AudioPlayer();
  final _cloudinaryApi = Get.put(ApiProvider());

  final Rx<Duration?> _duration = const Duration(milliseconds: 0).obs;
  final Rx<Duration> _position = const Duration(milliseconds: 0).obs;
  final Rx<Duration> _bufferedPosition = const Duration(milliseconds: 0).obs;
  final RxBool _isPlaying = false.obs;
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

  @override
  void onInit() {
    _audioPlayer.currentIndexStream.listen((event) {
      _currentSong.value = _data[event ?? 0];
    });
    _audioPlayer.durationStream.listen((event) {
      _duration.value = event;
    });
    _audioPlayer.bufferedPositionStream.listen((event) {
      _bufferedPosition.value = event;
    });
    _audioPlayer.positionStream.listen((event) {
      _position.value = event;
    });
    _audioPlayer.playerStateStream.listen((event) {
      _isPlaying.value = event.playing;
    });

    super.onInit();
  }

  void play(List<SongData> songs, int index) async {
    _data.value = songs;
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

  void playPause() {
    if (getIsPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
  }
}
