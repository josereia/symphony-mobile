import 'package:get/get.dart';
import 'package:symphony/controller/pages/album_page_controller.dart';
import 'package:symphony/data/provider/database_provider.dart';
import 'package:symphony/data/repository/album_page_repository.dart';

class AlbumPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AlbumPageController(
        repository: AlbumPageRepository(provider: DatabaseProvider()),
      ),
    );
  }
}
