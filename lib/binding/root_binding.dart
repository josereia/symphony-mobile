import 'package:get/get.dart';
import 'package:symphony/controller/pages/root_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootController());
  }
}
