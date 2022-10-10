import 'package:symphony/data/provider/auth_provider.dart';

import '../model/song_model.dart';
import '../provider/database_provider.dart';

class HomePageRepository {
  final DatabaseProvider databaseProvider;
  final AuthProvider authProvider;

  HomePageRepository({required this.databaseProvider, required this.authProvider});

  Stream<List<SongModel>> songsStream() {
    return databaseProvider.songsStream();
  }

  void logOut() {
    authProvider.logOut();
  }
}
