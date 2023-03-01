import 'package:symphony/data/model/playlist_model.dart';
import 'package:symphony/data/provider/songs_provider.dart';

class HomePageRepository {
  final SongsProvider databaseProvider;

  HomePageRepository({
    required this.databaseProvider,
  });

  Future<PlaylistModel?> getPlaylist({required String id}) async {
    return await databaseProvider.getPlaylist(id: id);
  }
}
