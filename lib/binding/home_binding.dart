import 'package:get/get.dart';
import 'package:symphony/controller/home_controller.dart';
import 'package:symphony/data/provider/auth_provider.dart';
import 'package:symphony/data/repository/user_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        HomeController(repository: UserRepository(provider: AuthProvider())));
  }
}
