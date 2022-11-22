import 'dart:ui';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import '../../controller/player_controller.dart';
import '../../data/provider/api_provider.dart';

class FloatPlayer extends StatelessWidget {
  final playerController = Get.find<PlayerController>();
  final cloudinaryApi = Get.put(ApiProvider());

  FloatPlayer({super.key});

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
                      progress: playerController.getPosition,
                      buffered: playerController.getBufferedPosition,
                      timeLabelLocation: TimeLabelLocation.none,
                      barCapShape: BarCapShape.round,
                      barHeight: 1,
                      thumbRadius: 0,
                      progressBarColor: Colors.white,
                      thumbColor: Colors.white,
                      baseBarColor: Colors.grey.withAlpha(200),
                      total: playerController.getDuration ??
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
                            () => playerController.getCurrentSong?.album != null
                                ? CachedNetworkImage(
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                    useOldImageOnUrlChange: true,
                                    imageUrl: cloudinaryApi.getAlbumPicURL(
                                      playerController.getCurrentSong!.album,
                                    ),
                                  )
                                : const CircularProgressIndicator(),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Obx(
                          () => Flexible(
                            child: playerController.getCurrentSong?.title !=
                                    null
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        playerController.getCurrentSong!.title,
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
                                        playerController
                                            .getCurrentSong!.artists[0],
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
