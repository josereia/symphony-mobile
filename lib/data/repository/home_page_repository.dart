import 'package:symphony/data/model/user_model.dart';
import 'package:symphony/data/provider/user_provider.dart';

import '../model/song_model.dart';
import '../provider/database_provider.dart';

class HomePageRepository {
  final DatabaseProvider databaseProvider;
  final UserProvider userProvider;

  HomePageRepository({
    required this.databaseProvider,
    required this.userProvider,
  });

  Stream<List<SongModel>> songsStream() {
    return databaseProvider.songsStream();
  }

  UserModel? getCurrentUser() {
    return userProvider.getCurrentUser();
  }
}
