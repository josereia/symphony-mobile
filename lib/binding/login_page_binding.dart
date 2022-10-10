import 'package:get/get.dart';
import 'package:symphony/controller/pages/login_page_controller.dart';
import 'package:symphony/data/provider/auth_provider.dart';
import 'package:symphony/data/repository/user_repository.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        LoginController(repository: UserRepository(provider: AuthProvider())));
  }
}
