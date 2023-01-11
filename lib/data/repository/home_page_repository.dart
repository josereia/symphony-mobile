import 'package:symphony/data/model/playlist_model.dart';

import '../provider/database_provider.dart';

class HomePageRepository {
  final DatabaseProvider databaseProvider;

  HomePageRepository({
    required this.databaseProvider,
  });

  Future<PlaylistModel?> getPlaylists() async {
    return await databaseProvider.getPlaylists();
  }
}
