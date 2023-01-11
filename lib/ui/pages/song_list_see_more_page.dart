import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/player_controller.dart';
import 'package:symphony/data/model/playlist_model.dart';
import 'package:symphony/ui/widgets/lists/songs_see_more_list.dart';

class SongListSeeMorePage extends GetView<PlayerController> {
  final PlaylistModel _playlist = Get.arguments as PlaylistModel;

  SongListSeeMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_playlist.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SongsSeeMoreList(playlist: _playlist),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          onPressed: () => controller.getCurrentSong != null
              ? controller.playPause()
              : controller.play(playlist: _playlist, index: 0),
          tooltip: "Play/Pause",
          child: controller.getIsPlaying
              ? const Icon(FeatherIcons.pause)
              : const Icon(FeatherIcons.play),
        ),
      ),
    );
  }
}
