import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const LinkButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
