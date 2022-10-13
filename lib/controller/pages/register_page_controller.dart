import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony/data/repository/auth_repository.dart';

class RegisterController extends GetxController {
  final AuthRepository repository;
  final GlobalKey formKey = GlobalKey<FormState>();
  final RxString email = "".obs;
  final RxString password = "".obs;
  final RxString passwordConfirmation = "".obs;
  final RxString b64ProfilePic = "".obs;

  RegisterController({required this.repository});

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Este campo não pode estar vazio!";
    }

    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Este campo não pode estar vazio!";
    }

    if (password.length < 8) {
      return "A senha deve conter no mínimo 8 caracteres.";
    }

    // if (password != passwordConfirmation) {
    //   return "Senha e confirmação de senha não conferem";
    // }

    return null;
  }

  void loginWithEmailAndPass() {
    repository.loginWithEmailAndPass(email.value, password.value);
  }

  void submit() {
    repository.registerWithEmailAndPassword(
        email.value, password.value, b64ProfilePic.value);
  }

  void goBack() {
    Get.offNamed("/login");
  }
}
