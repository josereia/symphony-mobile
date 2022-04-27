import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class TextInput extends StatelessWidget {
  final TextInputType? inputType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Callback? suffixIconOnPressed;
  final String hintText;

  const TextInput({
    Key? key,
    this.inputType,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconOnPressed,
    required this.hintText,
  }) : super(key: key);

  IconButton? getSuffixIcon() {
    return suffixIcon != null
        ? IconButton(
            icon: Icon(suffixIcon),
            onPressed: suffixIconOnPressed,
          )
        : null;
  }

  Icon? getPrefixIcon() {
    return prefixIcon != null ? Icon(prefixIcon) : null;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType ?? TextInputType.text,
      style: Theme.of(context).textTheme.bodyText1?.copyWith(),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: getPrefixIcon(),
        suffixIcon: getSuffixIcon(),
      ),
    );
  }
}
