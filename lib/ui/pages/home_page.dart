import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/pages/home_page_controller.dart';
import 'package:symphony/ui/widgets/appbar_widget.dart';
import 'package:symphony/ui/widgets/lists/song_list.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Bem vindo!"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 100,
        ),
        child: Column(
          children: [
            Obx(
              () => Visibility(
                visible: controller.songs != null,
                replacement: const CircularProgressIndicator(),
                child: controller.songs != null
                    ? SongList(playlist: controller.songs![0])
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
