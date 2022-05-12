import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony/data/repository/user_repository.dart';

class LoginController extends GetxController {
  final UserRepository repository;

  final GlobalKey formKey = GlobalKey<FormState>();
  final RxString email = "".obs;
  final RxString password = "".obs;

  LoginController({required this.repository});

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Este campo não pode estar vazio!";
    }

    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Este campo não pode estar vazio!";
    } else if (value.length < 8) {
      return "A senha deve conter no mínimo 8 caracteres.";
    }

    return null;
  }

  void loginWithEmailAndPass() {
    repository.loginWithEmailAndPass(email.value, password.value);
  }

  void loginWithGoogle() {
    repository.loginWithGoogle();
  }

  void loginWithApple() {
    repository.loginWithApple();
  }

  void logOut() {
    repository.logOut();
  }

  void resetPass() {}
}
