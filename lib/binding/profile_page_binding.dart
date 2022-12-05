import 'package:get/get.dart';
import 'package:symphony/controller/pages/profile_page_controller.dart';
import 'package:symphony/data/provider/user_provider.dart';
import 'package:symphony/data/repository/profile_page_repository.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(
        repository: ProfilePageRepository(
          userProvider: UserProvider(),
        ),
      ),
    );
  }
}
