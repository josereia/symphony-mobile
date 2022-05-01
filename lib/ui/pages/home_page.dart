import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/home_controller.dart';
import 'package:symphony/ui/widgets/buttons/primary_button.dart';
import 'package:symphony/ui/widgets/header_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        title: "Home",
        actions: [
          SizedBox(
            width: 50,
            height: 50,
            child: CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: const Image(
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://c.tenor.com/ir2nX96xSJUAAAAC/ghosts-my-profile.gif"),
                ),
              ),
            ),
          ),
        ],
      ),
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
