import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony/data/repository/auth_repository.dart';

void _showAlert(String message) {
  Get.defaultDialog(title: "Ops! Algo deu errado.", middleText: message);
}

class RegisterController extends GetxController {
  final AuthRepository repository;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxString b64ProfilePic = "".obs;
  final TextEditingController _usernameTextFieldController =
      TextEditingController();
  final TextEditingController _emailTextFieldController =
      TextEditingController();
  final TextEditingController _passwordTextFieldController =
      TextEditingController();
  final TextEditingController _confirmPasswordTextFieldController =
      TextEditingController();

  GlobalKey<FormState> get getFormKey => _formKey;
  TextEditingController get getUsernameController =>
      _usernameTextFieldController;
  TextEditingController get getEmailController => _emailTextFieldController;
  TextEditingController get getPasswordController =>
      _passwordTextFieldController;
  TextEditingController get getConfirmPasswordController =>
      _confirmPasswordTextFieldController;

  RegisterController({required this.repository});

  String? validateUsername() {
    if (getEmailController.text.isEmpty) {
      return "Este campo não pode estar vazio!";
    }

    return null;
  }

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

  String? validateConfirmPassword() {
    if (getConfirmPasswordController.text.isEmpty) {
      return "Este campo não pode estar vazio!";
    }

    if (getPasswordController.text != getConfirmPasswordController.text) {
      return "As senhas digitadas não conferem.";
    }

    return null;
  }

  Future<void> registerWithGoogle() async {
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

  Future<void> registerWithEmailAndPassword() async {
    try {
      await repository.registerWithEmailAndPassword(
        getUsernameController.text,
        getEmailController.text,
        getPasswordController.text,
        b64ProfilePic.value,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          _showAlert(
            "Usuário já existente com o mesmo endereço de email. Use outro email ou faça login.",
          );
          break;
        case "operation-not-allowed":
          _showAlert(
            "Operação não permitida. Tente novamente mais tarde.",
          );
          break;
        case "invalid-email":
          _showAlert(
            "Email inválido. Verifique e tente novamente.",
          );
          break;
        case "weak-password":
          _showAlert("A senha deve conter no mínimo 08 caracteres.");
          break;
        default:
          _showAlert("${e.code} - ${e.message}");
          break;
      }
    }
  }
}
