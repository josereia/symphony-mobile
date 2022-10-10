import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextInputType? inputType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixIconOnPressed;
  final Function onChanged;
  final Function? validator;
  final TextInputAction? textInputAction;
  final String hintText;

  const TextInput({
    super.key,
    this.inputType,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconOnPressed,
    this.validator,
    this.textInputAction,
    required this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType ?? TextInputType.text,
      textInputAction: textInputAction,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
      onChanged: (value) => onChanged(value),
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
      validator: validator != null ? (value) => validator!(value) : null,
    );
  }
}
