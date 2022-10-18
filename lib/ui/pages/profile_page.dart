import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/auth_controller.dart';
import 'package:symphony/ui/widgets/buttons/button_widget.dart';

class ProfilePage extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ButtonWidget(
            title: "Sair",
            onPressed: () => _authController.logOut(),
          ),
        ),
      ),
    );
  }
}
