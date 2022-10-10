import 'package:symphony/data/model/song_model.dart';
import 'package:symphony/data/provider/database_provider.dart';

class AlbumPageRepository {
  final DatabaseProvider provider;

  AlbumPageRepository({required this.provider});

  Future<List<SongModel>> getAlbumSongs(String album) async {
    return await provider.getAlbumSongs(album);
  }
}
