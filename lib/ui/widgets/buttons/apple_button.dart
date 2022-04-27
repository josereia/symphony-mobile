import 'package:flutter/material.dart';

import 'google_button.dart';

class AppleButton extends GoogleButton {
  const AppleButton({Key? key, required VoidCallback onPressed})
      : super(
          key: key,
          onPressed: onPressed,
          title: "Fazer login com a Apple   ",
          backgroundColor: Colors.black,
          onPrimary: Colors.white,
          borderColor: Colors.black,
          textColor: Colors.white,
          icon: Icons.apple,
        );
}
