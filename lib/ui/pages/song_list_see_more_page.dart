import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/player_controller.dart';
import 'package:symphony/data/model/song_model.dart';
import 'package:symphony/ui/widgets/lists/songs_see_more_list.dart';

class SongListSeeMorePage extends StatelessWidget {
  final PlayerController playerController = Get.find<PlayerController>();

  final String? _title = Get.arguments["title"];
  final List<SongModel>? _data = Get.arguments["data"];

  SongListSeeMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title ?? ""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SongsSeeMoreList(title: _title ?? "", data: _data ?? []),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          onPressed: () => playerController.getCurrentSong != null
              ? playerController.playPause()
              : playerController.play(_data ?? [], 0, _title ?? ""),
          tooltip: "Play/Pause",
          child: playerController.getIsPlaying
              ? const Icon(FeatherIcons.pause)
              : const Icon(FeatherIcons.play),
        ),
      ),
    );
  }
}
