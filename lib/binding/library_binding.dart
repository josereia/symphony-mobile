import 'package:get/get.dart';
import 'package:symphony/controller/library_controller.dart';

class LibraryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LibraryController());
  }
}
