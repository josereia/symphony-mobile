import 'package:get/get.dart';

class PassInputController extends GetxController {
  RxBool isObscure = true.obs;

  void changeObscure() {
    isObscure.value = !isObscure.value;
  }
}
