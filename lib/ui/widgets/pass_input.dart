import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/widgets/pass_input_controller.dart';

class PassInput extends StatelessWidget {
  final controller = Get.put(PassInputController());
  final Function onChanged;
  final Function validator;
  final String hintText;
  final TextInputAction? textInputAction;

  PassInput({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.validator,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        keyboardType: TextInputType.visiblePassword,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(),
        obscureText: controller.isObscure.value,
        onChanged: (value) => onChanged(value),
        textInputAction: textInputAction,
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
        validator: (value) => validator(value),
      ),
    );
  }
}
