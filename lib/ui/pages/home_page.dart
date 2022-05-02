import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/home_controller.dart';
import 'package:symphony/ui/widgets/buttons/primary_button.dart';
import 'package:symphony/ui/widgets/header_widget.dart';
import 'package:symphony/ui/widgets/lists/album_list.dart';
import 'package:symphony/ui/widgets/lists/song_list.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SongList(
                title: "Recomendados",
              ),
              const SizedBox(height: 16),
              const AlbumList(
                title: "Alguns álbuns",
              ),
              const SizedBox(height: 16),
              const SongList(
                title: "Você não para de ouvir",
              ),
              const SizedBox(height: 16),
              PrimaryButton(title: "Sair", onPressed: () => controller.logOut())
            ],
          ),
        ),
      ),
    );
  }
}
