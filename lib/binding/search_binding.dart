import 'package:get/get.dart';
import 'package:symphony/controller/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    SearchController();
  }
}
