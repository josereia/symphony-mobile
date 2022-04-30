import 'package:get/get.dart';
import 'package:symphony/data/provider/auth_provider.dart';

class FirebaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());
  }
}
