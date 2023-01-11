import 'dart:ui';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/player_controller.dart';

class FloatPlayer extends GetView<PlayerController> {
  const FloatPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: Container(
          height: 62,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          color: context.theme.colorScheme.primary.withAlpha(200),
          child: Stack(
            children: [
              Obx(
                () => Positioned(
                  top: 2,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: ProgressBar(
                      progress: controller.getPosition,
                      buffered: controller.getBufferedPosition,
                      timeLabelLocation: TimeLabelLocation.none,
                      barCapShape: BarCapShape.round,
                      barHeight: 1,
                      thumbRadius: 0,
                      progressBarColor: Colors.white,
                      thumbColor: Colors.white,
                      baseBarColor: Colors.grey.withAlpha(200),
                      total: controller.getDuration ??
                          const Duration(
                            milliseconds: 0,
                          ),
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Obx(
                            () => controller.getCurrentSong?.author != null
                                ? CachedNetworkImage(
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                    useOldImageOnUrlChange: true,
                                    cacheKey: controller.getCurrentSong!.title,
                                    imageUrl: controller
                                        .getCurrentSong!.thumbnail
                                        .toString(),
                                  )
                                : const CircularProgressIndicator(),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Obx(
                          () => Flexible(
                            child: controller.getCurrentSong?.title != null
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.getCurrentSong!.title,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: context.theme.colorScheme
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                      ),
                                      Text(
                                        controller.getCurrentSong!.author,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: context.theme.colorScheme
                                                      .brightness ==
                                                  Brightness.dark
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                : const CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Obx(
                        () => IconButton(
                          onPressed: () => controller.playPause(),
                          icon: Icon(
                            controller.getIsPlaying
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
                        onPressed: () => controller.next(),
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
