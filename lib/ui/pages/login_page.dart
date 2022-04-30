import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/login_controller.dart';
import 'package:symphony/ui/widgets/buttons/apple_button.dart';
import 'package:symphony/ui/widgets/buttons/google_button.dart';
import 'package:symphony/ui/widgets/buttons/link_button.dart';
import 'package:symphony/ui/widgets/pass_input.dart';
import 'package:symphony/ui/widgets/buttons/primary_button.dart';
import 'package:symphony/ui/widgets/text_input.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

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
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GoogleButton(
                      onPressed: () => controller.loginWithGoogle(),
                    ),
                    const SizedBox(height: 16),
                    AppleButton(
                      onPressed: () => controller.loginWithApple(),
                    ),
                    const SizedBox(height: 16),
                    const Text("OU"),
                    const SizedBox(height: 16),
                    Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        children: [
                          const TextInput(
                            hintText: "E-mail",
                            prefixIcon: FeatherIcons.mail,
                            inputType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 16),
                          PassInput(hintText: "Senha"),
                          Container(
                            alignment: Alignment.centerRight,
                            child: LinkButton(
                                title: "Esqueceu sua senha?",
                                onPressed: () => controller.resetPass()),
                          ),
                          const SizedBox(height: 16),
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