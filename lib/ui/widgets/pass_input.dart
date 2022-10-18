import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PassInput extends StatefulWidget {
  final Function? onChanged;
  final Function? validator;
  final String hintText;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;

  const PassInput({
    super.key,
    this.onChanged,
    this.textInputAction,
    this.validator,
    this.controller,
    required this.hintText,
  });

  @override
  State<StatefulWidget> createState() => _PassInputState();
}

class _PassInputState extends State<PassInput> {
  bool isObscure = true;

  void changeObscure() {
    setState(() => isObscure = !isObscure);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
      obscureText: isObscure,
      onChanged:
          widget.onChanged != null ? (value) => widget.onChanged!(value) : null,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Icon(FeatherIcons.lock),
        suffixIcon: IconButton(
          icon: isObscure
              ? const Icon(FeatherIcons.eye)
              : const Icon(FeatherIcons.eyeOff),
          onPressed: () => changeObscure(),
        ),
      ),
      validator:
          widget.validator != null ? (value) => widget.validator!() : null,
    );
  }
}
