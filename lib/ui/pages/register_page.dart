import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/ui/widgets/buttons/button_widget.dart';
import 'package:symphony/ui/widgets/buttons/google_button.dart';
import 'package:symphony/ui/widgets/imagepick_widget.dart';
import 'package:symphony/ui/widgets/pass_input.dart';
import 'package:symphony/ui/widgets/text_input.dart';

import '../../controller/pages/register_page_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ColoredBox(
            color: theme.colorScheme.background,
            child: const Image(
              width: double.infinity,
              image: AssetImage("assets/login2.png"),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GoogleButton(
                      text: "Cadastre-se com o Google",
                      onPressed: () => controller.registerWithGoogle(),
                    ),
                    const SizedBox(height: 12),
                    const Text("OU"),
                    const SizedBox(height: 12),
                    Form(
                      key: controller.getFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ImagePick(
                            controller: controller,
                          ),
                          const SizedBox(height: 12),
                          TextInput(
                            controller: controller.getUsernameController,
                            hintText: "Digite seu nome",
                            prefixIcon: FeatherIcons.user,
                            inputType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            validator: () => controller.validateUsername(),
                          ),
                          const SizedBox(height: 12),
                          TextInput(
                            controller: controller.getEmailController,
                            hintText: "Digite seu email",
                            prefixIcon: FeatherIcons.mail,
                            inputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: () => controller.validateEmail(),
                          ),
                          const SizedBox(height: 12),
                          PassInput(
                            controller: controller.getPasswordController,
                            hintText: "Digite uma senha",
                            textInputAction: TextInputAction.next,
                            validator: () => controller.validatePassword(),
                          ),
                          const SizedBox(height: 12),
                          PassInput(
                            controller: controller.getConfirmPasswordController,
                            hintText: "Digite a senha novamente",
                            textInputAction: TextInputAction.done,
                            validator: () =>
                                controller.validateConfirmPassword(),
                          ),
                          const SizedBox(height: 12),
                          ButtonWidget(
                            title: "Criar conta",
                            prefixIcon: FeatherIcons.logIn,
                            onPressed: () {
                              if (controller.getFormKey.currentState!
                                  .validate()) {
                                controller.registerWithEmailAndPassword();
                              }
                            },
                          ),
                          const SizedBox(height: 12),
                          ButtonWidget(
                            title: "Voltar",
                            color: ButtonColors.secondary,
                            prefixIcon: Icons.arrow_back,
                            onPressed: () => Get.back(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
