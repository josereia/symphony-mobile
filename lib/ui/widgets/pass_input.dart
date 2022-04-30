import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/widgets/pass_input_controller.dart';

class PassInput extends StatelessWidget {
  final controller = Get.put(PassInputController());

  final String hintText;

  PassInput({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        keyboardType: TextInputType.visiblePassword,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(),
        obscureText: controller.isObscure.value,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(FeatherIcons.lock),
          suffixIcon: IconButton(
            icon: controller.isObscure.value
                ? const Icon(FeatherIcons.eye)
                : const Icon(FeatherIcons.eyeOff),
            onPressed: () => controller.changeObscure(),
          ),
        ),
      ),
    );
  }
}
