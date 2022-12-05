import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/pages/home_page_controller.dart';
import 'package:symphony/routes/app_routes.dart';
import 'package:symphony/ui/widgets/appbar_widget.dart';
import 'package:symphony/ui/widgets/lists/album_list.dart';
import 'package:symphony/ui/widgets/lists/artist_list.dart';
import 'package:symphony/ui/widgets/lists/song_list.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Bem vindo!",
        subtitle: controller.getUser?.name ?? "",
        actions: [
          SizedBox(
            width: 50,
            height: 50,
            child: InkWell(
              onTap: () => Get.toNamed(AppRoutes.profile),
              child: Ink(
                child: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: controller.getUser?.photoURL != null
                        ? CachedNetworkImage(
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            useOldImageOnUrlChange: true,
                            cacheKey: "profile_pic",
                            imageUrl: controller.getUser!.photoURL!,
                          )
                        : const CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
              () => ArtistList(
                title: "Alguns artistas",
                artists: controller.songs,
                length: 5,
              ),
            ),
            const SizedBox(height: 16 * 2),
            Obx(
              () => SongList(
                title: "Recomendados",
                songs: controller.songs,
                length: 5,
              ),
            ),
            const SizedBox(height: 16 * 2),
            Obx(
              () => AlbumList(
                title: "Alguns álbuns",
                albums: controller.songs,
                length: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
