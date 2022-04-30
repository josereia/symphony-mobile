import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextInputType? inputType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixIconOnPressed;
  final String hintText;

  const TextInput({
    Key? key,
    this.inputType,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconOnPressed,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType ?? TextInputType.text,
      style: Theme.of(context).textTheme.bodyText1?.copyWith(),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: suffixIconOnPressed,
              )
            : null,
      ),
    );
  }
}
