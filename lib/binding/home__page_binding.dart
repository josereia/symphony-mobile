import 'package:get/get.dart';
import 'package:symphony/controller/pages/home_page_controller.dart';
import 'package:symphony/data/provider/auth_provider.dart';
import 'package:symphony/data/provider/database_provider.dart';
import 'package:symphony/data/repository/home_page_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        repository: HomePageRepository(
          databaseProvider: DatabaseProvider(),
          authProvider: AuthProvider(),
        ),
      ),
    );
  }
}
