import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/auth_controller.dart';
import 'package:symphony/controller/pages/profile_page_controller.dart';
import 'package:symphony/ui/widgets/buttons/button_widget.dart';
import 'package:symphony/ui/widgets/text_input.dart';

class ProfilePage extends GetView<ProfileController> {
  final AuthController _authController = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    String? name = controller.getUser?.name;
    String email = controller.getUser?.email ?? '';
    emailController.text = email;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: InkWell(
                  child: Ink(
                    child: CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                        child: controller.getUser?.photoURL != null
                            ? Image(
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  controller.getUser!.photoURL!,
                                ),
                              )
                            : const CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                name ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              const Icon(
                FeatherIcons.check,
                color: Colors.green,
              ),
              TextInput(
                hintText: 'E-mail',
                controller: emailController,
                readOnly: true,
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                title: "Editar",
                onPressed: () => _authController.logOut(),
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                title: "Sair",
                onPressed: () => _authController.logOut(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
