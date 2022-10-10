import 'package:get/get.dart';
import 'package:symphony/controller/pages/library_page_controller.dart';

class LibraryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LibraryController());
  }
}
