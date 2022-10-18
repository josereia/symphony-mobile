import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony/data/repository/auth_repository.dart';

void _showAlert(String message) {
  Get.defaultDialog(
    title: "Ops! Algo deu errado.",
    middleText: message,
    barrierDismissible: true,
    textConfirm: "Ok",
    onConfirm: () => Get.back(),
  );
}

class LoginController extends GetxController {
  final AuthRepository repository;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextFieldController =
      TextEditingController();
  final TextEditingController _passwordTextFieldController =
      TextEditingController();

  GlobalKey<FormState> get getFormKey => _formKey;
  TextEditingController get getEmailController => _emailTextFieldController;
  TextEditingController get getPasswordController =>
      _passwordTextFieldController;

  LoginController({required this.repository});

  String? validateEmail() {
    if (getEmailController.text.isEmpty) {
      return "Este campo não pode estar vazio!";
    } else if (!getEmailController.text.isEmail) {
      return "Digite o email corretamente.";
    }

    return null;
  }

  String? validatePassword() {
    if (getPasswordController.text.isEmpty) {
      return "Este campo não pode estar vazio!";
    } else if (getPasswordController.text.length < 8) {
      return "A senha deve conter no mínimo 08 caracteres.";
    }

    return null;
  }

  Future<void> loginWithEmailAndPass() async {
    try {
      await repository.loginWithEmailAndPass(
        getEmailController.text,
        getPasswordController.text,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          _showAlert("Email ou senha inválidos. Verifique e tente novamente.");
          break;
        case "user-disabled":
          _showAlert("Este usuário está desabilitado.");
          break;
        case "user-not-found":
          _showAlert(
              "Usuário não encontrado. Verifique se você já tem cadastro.");
          break;
        case "wrong-password":
          _showAlert("Email ou senha inválidos. Verifique e tente novamente.");
          break;
        default:
          _showAlert("${e.code} - ${e.message}");
          break;
      }
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      await repository.loginWithGoogle();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "account-exists-with-different-credential":
          _showAlert(
            "Usuário já existente porém com outra credencial. Verifique se você realmente se cadastrou com o Google.",
          );
          break;
        case "operation-not-allowed":
          _showAlert(
            "Operação não permitida. Tente novamente mais tarde.",
          );
          break;
        case "invalid-credential":
          _showAlert(
            "Credenciais inválidas. Tente novamente mais tarde.",
          );
          break;
        case "user-disabled":
          _showAlert("Este usuário está desabilitado.");
          break;
        case "user-not-found":
          _showAlert(
              "Usuário não encontrado. Verifique se você já tem cadastro.");
          break;
        case "wrong-password":
          _showAlert("Email ou senha inválidos. Verifique e tente novamente.");
          break;
        default:
          _showAlert("${e.code} - ${e.message}");
          break;
      }
    }
  }

  Future<void> loginWithApple() async {
    repository.loginWithApple();
  }

  Future<void> logOut() async {
    await repository.logOut();
  }

  void resetPass() {}
}
