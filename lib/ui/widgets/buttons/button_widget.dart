import 'package:flutter/material.dart';

enum ButtonColors {
  primary,
  secondary,
}

class ButtonWidget extends StatelessWidget {
  final String title;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onPressed;
  final ButtonColors? color;

  const ButtonWidget({
    super.key,
    this.color,
    this.prefixIcon,
    this.suffixIcon,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    Color getColor() {
      switch (color) {
        case ButtonColors.primary:
          return theme.colorScheme.primary;
        case ButtonColors.secondary:
          return theme.colorScheme.secondary;
        default:
          return theme.colorScheme.primary;
      }
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size.infinite,
        minimumSize: const Size.fromHeight(50),
        backgroundColor: getColor(),
      ),
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
