import 'package:get/get.dart';
import 'package:symphony/controller/pages/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
