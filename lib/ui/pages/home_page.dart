import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/home_controller.dart';
import 'package:symphony/ui/widgets/buttons/primary_button.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Home"),
            PrimaryButton(title: "Sair", onPressed: () => controller.logOut())
          ],
        ),
      ),
    );
  }
}
