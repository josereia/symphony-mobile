import 'package:symphony/data/model/playlist_model.dart';
import 'package:symphony/data/model/song_model.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class SongsProvider {
  static final instance = YoutubeExplode();

  Future<PlaylistModel?> getPlaylist({required String id}) async {
    final playlist = await instance.playlists.get(id);
    final videos = await instance.playlists.getVideos(id).take(5).toList();
    final List<SongModel> songs = [];

    for (Video video in videos) {
      final manifest = await instance.videos.streamsClient.getManifest(
        video.id,
      );
      final Uri videoUrl = manifest.videoOnly.withHighestBitrate().url;
      final Uri audioUrl = manifest.audioOnly.withHighestBitrate().url;

      final title = video.title.split(" - ").last;

      songs.add(
        SongModel(
          id: video.id.toString(),
          audio: audioUrl,
          video: videoUrl,
          author: video.author,
          title: title,
          duration: video.duration ?? const Duration(milliseconds: 0),
          thumbnail: Uri.parse(video.thumbnails.maxResUrl),
        ),
      );
    }

    return PlaylistModel(
      title: playlist.title.toString(),
      songs: songs,
    );
  }

  Future<List<SongModel>> getAlbumSongs(String album) async {
    return Future.value([]);
  }
}
