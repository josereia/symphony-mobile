import 'dart:ui';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import '../../controller/player_controller.dart';
import '../../data/provider/api_provider.dart';

class FloatPlayer extends StatelessWidget {
  final playerController = Get.find<PlayerController>();
  final cloudinaryApi = Get.put(ApiProvider());

  FloatPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: Container(
          height: 62,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: context.theme.colorScheme.primary.withAlpha(200),
          child: Stack(
            children: [
              Obx(
                () => Positioned(
                  top: 1,
                  left: 0,
                  right: 0,
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: ProgressBar(
                      total: playerController.getDuration ??
                          const Duration(
                            milliseconds: 0,
                          ),
                      progress: playerController.getPosition,
                      buffered: playerController.getBufferedPosition,
                      timeLabelLocation: TimeLabelLocation.none,
                      barCapShape: BarCapShape.round,
                      barHeight: 1,
                      thumbRadius: 0,
                      progressBarColor: Colors.white,
                      thumbColor: Colors.white,
                      baseBarColor: Colors.grey.withAlpha(200),
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Obx(
                          () => Image(
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            image: playerController
                                    .getCurrentSong.album.isNotEmpty
                                ? NetworkImage(
                                    cloudinaryApi.getAlbumPicURL(
                                        playerController.getCurrentSong.album),
                                  )
                                : const NetworkImage(
                                    "https://paulejorgensen.com/wp-content/uploads/2018/12/album-cover-placeholder-light.png",
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Text(
                              playerController.getCurrentSong.title,
                              style: TextStyle(
                                color: context.theme.colorScheme.brightness ==
                                        Brightness.dark
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                          Obx(
                            () => Text(
                              playerController.getCurrentSong.artists[0],
                              style: TextStyle(
                                color: context.theme.colorScheme.brightness ==
                                        Brightness.dark
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => IconButton(
                          onPressed: () => playerController.playPause(),
                          icon: Icon(
                            playerController.getIsPlaying
                                ? FeatherIcons.pauseCircle
                                : FeatherIcons.playCircle,
                            color: context.theme.colorScheme.brightness ==
                                    Brightness.dark
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => playerController.next(),
                        icon: Icon(
                          FeatherIcons.skipForward,
                          color: context.theme.colorScheme.brightness ==
                                  Brightness.dark
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
