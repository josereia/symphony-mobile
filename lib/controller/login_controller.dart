import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

class LoginController extends GetxController {
  final GlobalKey formKey = GlobalKey<FormState>();
  final RxString email = "".obs;
  final RxString password = "".obs;

  String? validateEmail(String value) {
    if (GetUtils.isEmail(value)) {
      return "Este campo não pode estar vazio!";
    } else if (value.isEmail) {
      return "Email inválido!";
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
    log(email.toString());
  }

  void loginWithGoogle() {}
  void loginWithApple() {}
  void resetPass() {}
}
