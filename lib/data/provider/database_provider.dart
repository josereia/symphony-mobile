import 'package:symphony/data/model/playlist_model.dart';
import 'package:symphony/data/model/song_model.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class DatabaseProvider {
  static final instance = YoutubeExplode();

  Future<PlaylistModel?> getPlaylists() async {
    final List<SongModel> songs = [];

    final info = await instance.playlists
        .get("RDCLAK5uy_lBNUteBRencHzKelu5iDHwLF6mYqjL-JU");

    final videos = await instance.playlists
        .getVideos("RDCLAK5uy_lBNUteBRencHzKelu5iDHwLF6mYqjL-JU")
        .toList();

    for (Video video in videos) {
      final manifest =
          await instance.videos.streamsClient.getManifest(video.id);
      final url = manifest.audioOnly.withHighestBitrate().url;

      songs.add(
        SongModel(
          id: video.id.toString(),
          url: url,
          author: video.author,
          title: video.title,
          duration: video.duration ?? const Duration(milliseconds: 0),
          thumbnail: Uri.parse(video.thumbnails.maxResUrl),
        ),
      );
    }

    return PlaylistModel(
      title: info.title.toString(),
      songs: songs,
    );
  }

  Future<List<SongModel>> getAlbumSongs(String album) async {
    return Future.value([]);
  }
}
