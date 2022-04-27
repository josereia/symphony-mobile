import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Login"),
      ),
    );
  }
}
