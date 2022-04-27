import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/ui/widgets/buttons/apple_button.dart';
import 'package:symphony/ui/widgets/buttons/google_button.dart';
import 'package:symphony/ui/widgets/pass_input.dart';
import 'package:symphony/ui/widgets/primary_button.dart';
import 'package:symphony/ui/widgets/text_input.dart';

class LoginPage extends GetView {
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
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GoogleButton(onPressed: () => null),
                      const SizedBox(height: 16),
                      AppleButton(onPressed: () => null),
                      const SizedBox(height: 16),
                      const Text("OU"),
                      const SizedBox(height: 16),
                      const TextInput(
                        hintText: "E-mail",
                        prefixIcon: FeatherIcons.mail,
                        inputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      const PassInput(hintText: "Senha"),
                      const SizedBox(height: 16),
                      PrimaryButton(
                        title: "Entrar",
                        prefixIcon: FeatherIcons.logIn,
                        onPressed: () => null,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
