import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/pages/login_page_controller.dart';
import 'package:symphony/ui/widgets/buttons/apple_button.dart';
import 'package:symphony/ui/widgets/buttons/google_button.dart';
import 'package:symphony/ui/widgets/buttons/link_button.dart';
import 'package:symphony/ui/widgets/pass_input.dart';
import 'package:symphony/ui/widgets/buttons/primary_button.dart';
import 'package:symphony/ui/widgets/text_input.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(image: AssetImage("assets/login2.png")),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GoogleButton(
                      onPressed: () => controller.loginWithGoogle(),
                    ),
                    const SizedBox(height: 12),
                    AppleButton(
                      onPressed: () => controller.loginWithApple(),
                    ),
                    const SizedBox(height: 12),
                    const Text("OU"),
                    const SizedBox(height: 12),
                    Form(
                      key: controller.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          TextInput(
                            hintText: "E-mail",
                            prefixIcon: FeatherIcons.mail,
                            inputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) =>
                                controller.email.value = value,
                            validator: (value) =>
                                controller.validateEmail(value),
                          ),
                          const SizedBox(height: 12),
                          PassInput(
                            hintText: "Senha",
                            textInputAction: TextInputAction.done,
                            onChanged: (value) =>
                                controller.password.value = value,
                            validator: (value) =>
                                controller.validatePassword(value),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              LinkButton(
                                title: "Esqueceu sua senha?",
                                onPressed: () => controller.resetPass(),
                              ),
                            ],
                          ),
                          PrimaryButton(
                            title: "Registrar-se",
                            prefixIcon: Icons.person_add,
                            onPressed: () => controller.register(),
                          ),
                          const SizedBox(height: 12),
                          PrimaryButton(
                            title: "Entrar",
                            prefixIcon: FeatherIcons.logIn,
                            onPressed: () => controller.loginWithEmailAndPass(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
