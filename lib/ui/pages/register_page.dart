import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/ui/widgets/buttons/primary_button.dart';
import 'package:symphony/ui/widgets/imagepick_widget.dart';
import 'package:symphony/ui/widgets/pass_input.dart';
import 'package:symphony/ui/widgets/text_input.dart';

import '../../controller/pages/register_page_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const Image(image: AssetImage("assets/login2.png")),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text("CADASTRO"),
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
                                {controller.password.value = value},
                            validator: (value) =>
                                controller.validatePassword(value),
                          ),
                          const SizedBox(height: 12),
                          ImagePick(
                            controller: controller,
                          ),
                          const SizedBox(height: 12),
                          PrimaryButton(
                            title: "Registrar-se",
                            prefixIcon: Icons.person_add,
                            onPressed: () => controller.submit(),
                          ),
                          const SizedBox(height: 12),
                          PrimaryButton(
                            title: "Voltar",
                            prefixIcon: Icons.arrow_back,
                            onPressed: () => controller.goBack(),
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
