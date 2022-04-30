import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;
  final Color? backgroundColor;
  final Color? onPrimary;
  final Color? borderColor;
  final Color? textColor;
  final IconData? icon;

  const GoogleButton({
    Key? key,
    required this.onPressed,
    this.title,
    this.backgroundColor,
    this.onPrimary,
    this.borderColor,
    this.textColor,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: backgroundColor ?? Colors.white,
        minimumSize: const Size.fromHeight(50),
        fixedSize: Size.infinite,
        onPrimary: onPrimary ?? Colors.grey,
        side: BorderSide(color: borderColor ?? Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon != null
              ? Icon(
                  icon,
                  size: 28,
                )
              : const Image(
                  image: AssetImage("assets/google.png"),
                  width: 20,
                  height: 20,
                ),
          const SizedBox(width: 16),
          Text(
            title ?? "Fazer login com o Google",
            style: TextStyle(color: textColor ?? Colors.black),
          )
        ],
      ),
    );
  }
}