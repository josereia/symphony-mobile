import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onPressed;

  const PrimaryButton(
      {Key? key, required this.title, this.prefixIcon, this.suffixIcon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: prefixIcon != null
            ? <Widget>[
                Icon(prefixIcon),
                const SizedBox(width: 16),
                Text(title),
              ]
            : suffixIcon != null
                ? <Widget>[
                    Text(title),
                    const SizedBox(width: 16),
                    Icon(suffixIcon),
                  ]
                : <Widget>[
                    Text(title),
                  ],
      ),
    );
  }
}
