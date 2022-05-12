import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/pages/home_controller.dart';
import 'package:symphony/controller/song_controller.dart';
import 'package:symphony/ui/widgets/buttons/primary_button.dart';
import 'package:symphony/ui/widgets/header_widget.dart';
import 'package:symphony/ui/widgets/lists/album_list.dart';
import 'package:symphony/ui/widgets/lists/artist_list.dart';
import 'package:symphony/ui/widgets/lists/song_list.dart';

class HomePage extends GetView<HomeController> {
  final songController = Get.find<SongController>();

  HomePage({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => ArtistList(
                  title: "Alguns artistas",
                  data: songController.songs,
                ),
              ),
              const SizedBox(height: 16 * 2),
              Obx(
                () => SongList(
                  title: "Recomendados",
                  data: songController.songs,
                ),
              ),
              const SizedBox(height: 16 * 2),
              Obx(
                () => AlbumList(
                  title: "Alguns álbuns",
                  data: songController.songs,
                ),
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                title: "Sair",
                onPressed: () => log(songController.songs.toString()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
