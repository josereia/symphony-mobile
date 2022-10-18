import 'package:get/get.dart';
import 'package:symphony/controller/pages/register_page_controller.dart';
import 'package:symphony/data/provider/auth_provider.dart';
import 'package:symphony/data/repository/auth_repository.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RegisterController(
        repository: AuthRepository(provider: AuthProvider()),
      ),
    );
  }
}
