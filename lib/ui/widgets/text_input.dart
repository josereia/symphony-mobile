import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextInputType? inputType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixIconOnPressed;
  final Function? onChanged;
  final Function? validator;
  final TextInputAction? textInputAction;
  final String hintText;
  final TextEditingController? controller;
  final bool? readOnly;

  const TextInput({
    super.key,
    this.inputType,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconOnPressed,
    this.validator,
    this.textInputAction,
    this.onChanged,
    this.controller,
    this.readOnly,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly ?? false,
      keyboardType: inputType ?? TextInputType.text,
      textInputAction: textInputAction,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
      onChanged: onChanged != null ? (value) => onChanged!(value) : null,
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
      validator: validator != null ? (value) => validator!() : null,
    );
  }
}
