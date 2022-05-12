import 'package:get/get.dart';

class RootController extends GetxController {
  final RxInt tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
