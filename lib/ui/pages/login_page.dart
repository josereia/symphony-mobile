import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/pages/login_page_controller.dart';
import 'package:symphony/routes/app_routes.dart';
import 'package:symphony/ui/widgets/buttons/google_button.dart';
import 'package:symphony/ui/widgets/buttons/link_button.dart';
import 'package:symphony/ui/widgets/pass_input.dart';
import 'package:symphony/ui/widgets/buttons/button_widget.dart';
import 'package:symphony/ui/widgets/text_input.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

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
                      onPressed: () => controller.loginWithGoogle(),
                    ),
                    const SizedBox(height: 12),
                    /*
                    AppleButton(
                      onPressed: () => controller.loginWithApple(),
                    ),
                    const SizedBox(height: 12),
                    */
                    const Text("OU"),
                    const SizedBox(height: 12),
                    Form(
                      key: controller.getFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                            hintText: "Digite sua senha",
                            textInputAction: TextInputAction.done,
                            validator: () => controller.validatePassword(),
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
                          const SizedBox(height: 12),
                          ButtonWidget(
                            title: "Entrar",
                            prefixIcon: FeatherIcons.logIn,
                            onPressed: () {
                              if (controller.getFormKey.currentState!
                                  .validate()) {
                                controller.loginWithEmailAndPass();
                              }
                            },
                          ),
                          LinkButton(
                            title: "Ainda não tem uma conta? Cadastre-se.",
                            onPressed: () => Get.toNamed(AppRoutes.register),
                          ),
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
