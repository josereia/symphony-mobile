import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PassInput extends StatefulWidget {
  final Function onChanged;
  final Function validator;
  final String hintText;
  final TextInputAction? textInputAction;

  const PassInput({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.validator,
    this.textInputAction,
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
      keyboardType: TextInputType.visiblePassword,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
      obscureText: isObscure,
      onChanged: (value) => widget.onChanged(value),
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
      validator: (value) => widget.validator(value),
    );
  }
}
