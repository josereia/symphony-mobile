import 'package:get/get.dart';
import 'package:symphony/controller/pages/home_controller.dart';
import 'package:symphony/controller/song_controller.dart';
import 'package:symphony/data/provider/auth_provider.dart';
import 'package:symphony/data/provider/database_provider.dart';
import 'package:symphony/data/repository/song_repository.dart';

import 'package:symphony/data/repository/user_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() =>
        HomeController(repository: UserRepository(provider: AuthProvider())));
    Get.put<SongController>(SongController(
        repository: SongRepository(provider: DatabaseProvider())));
  }
}
