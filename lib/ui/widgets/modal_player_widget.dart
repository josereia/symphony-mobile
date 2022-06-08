import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:symphony/data/provider/api_provider.dart';

import '../../controller/player_controller.dart';

class ModalPlayer extends StatelessWidget {
  final playerController = Get.find<PlayerController>();
  final cloudinaryApi = Get.put<ApiProvider>(ApiProvider());

  ModalPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Reproduzindo de:"),
              ],
            ),
            Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40,
                          offset: const Offset(0, 20),
                          color: Colors.black.withAlpha(60),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        cloudinaryApi.getAlbumPicURL(
                            playerController.getCurrentSong.album),
                        width: 260,
                        height: 260,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 260,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              playerController.getCurrentSong.title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              playerController.getCurrentSong.artists
                                  .join(", "),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(FeatherIcons.heart))
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(
                    () => ProgressBar(
                      progress: playerController.getPosition,
                      total: playerController.getDuration ??
                          const Duration(milliseconds: 0),
                      buffered: playerController.getBufferedPosition,
                      barHeight: 4,
                      thumbRadius: 8,
                      baseBarColor: Colors.grey.withAlpha(60),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => IconButton(
                          onPressed: () => playerController.shuffle(),
                          icon: Icon(
                            FeatherIcons.shuffle,
                            size: 20,
                            color: playerController.getIsShuffle
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).iconTheme.color,
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => playerController.previous(),
                            icon: const Icon(FeatherIcons.skipBack),
                          ),
                          CupertinoButton.filled(
                            onPressed: () => playerController.playPause(),
                            borderRadius: BorderRadius.circular(50),
                            padding: const EdgeInsets.all(0),
                            alignment: Alignment.center,
                            minSize: 60,
                            child: Obx(
                              () => Icon(playerController.getIsPlaying
                                  ? FeatherIcons.pause
                                  : FeatherIcons.play),
                            ),
                          ),
                          IconButton(
                            onPressed: () => playerController.next(),
                            icon: const Icon(FeatherIcons.skipForward),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FeatherIcons.repeat,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
