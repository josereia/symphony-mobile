import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/player_controller.dart';
import 'package:symphony/data/model/playlist_model.dart';
import 'package:symphony/data/model/song_model.dart';
import 'package:video_player/video_player.dart';

class _TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final bool? bold;

  const _TextWidget(
    this.text, {
    this.style,
    this.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: style?.copyWith(
            fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
          ) ??
          TextStyle(
            fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
          ),
    );
  }
}

class _IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final void Function()? onPressed;

  const _IconButtonWidget({
    required this.icon,
    this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
        size: 20,
      ),
    );
  }
}

class _HeaderWidget extends GetView<PlayerController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _IconButtonWidget(
            icon: FeatherIcons.chevronDown,
            onPressed: () => Get.back(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const _TextWidget(
                "Reproduzindo de:",
              ),
              Obx(
                () => _TextWidget(
                  controller.getPlaylistTitle,
                  bold: true,
                ),
              ),
            ],
          ),
          const _IconButtonWidget(icon: FeatherIcons.settings),
        ],
      ),
    );
  }
}

class _FooterWidget extends GetView<PlayerController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => _TextWidget(
                        controller.getCurrentSong?.title ?? "",
                        style: Theme.of(context).textTheme.titleLarge,
                        bold: true,
                      ),
                    ),
                    Obx(
                      () => _TextWidget(
                        controller.getCurrentSong?.author ?? "",
                      ),
                    ),
                  ],
                ),
              ),
              const _IconButtonWidget(
                icon: FeatherIcons.heart,
              ),
            ],
          ),
          Obx(
            () => ProgressBar(
              progress: controller.getPosition,
              total: controller.getDuration ?? const Duration(milliseconds: 0),
              buffered: controller.getBufferedPosition,
              barHeight: 4,
              thumbRadius: 8,
              baseBarColor:
                  Theme.of(context).colorScheme.primary.withOpacity(0.2),
              bufferedBarColor:
                  Theme.of(context).colorScheme.primary.withOpacity(0.2),
              progressBarColor: Theme.of(context).colorScheme.primary,
              thumbColor: Theme.of(context).colorScheme.primary,
              onSeek: (position) => controller.seekTo(position),
              timeLabelTextStyle: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => _IconButtonWidget(
                  onPressed: () => controller.shuffle(),
                  icon: FeatherIcons.shuffle,
                  color: controller.getIsShuffle
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _IconButtonWidget(
                    onPressed: () => controller.previous(),
                    icon: FeatherIcons.skipBack,
                  ),
                  Material(
                    type: MaterialType.transparency,
                    borderRadius: BorderRadius.circular(60),
                    child: InkWell(
                      onTap: () => controller.playPause(),
                      borderRadius: BorderRadius.circular(60),
                      radius: 60,
                      child: Ink(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Obx(
                          () => Icon(
                            controller.getIsPlaying
                                ? FeatherIcons.pause
                                : FeatherIcons.play,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  _IconButtonWidget(
                    onPressed: () => controller.next(),
                    icon: FeatherIcons.skipForward,
                  ),
                ],
              ),
              Obx(
                () => _IconButtonWidget(
                  onPressed: () => controller.repeat(),
                  icon: FeatherIcons.repeat,
                  color: controller.getIsLoop
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VideoPlayerWidget extends StatelessWidget {
  final FlickManager? controller;

  const _VideoPlayerWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: controller != null
                  ? FlickVideoPlayer(
                      flickManager: controller!,
                      flickVideoWithControls: const FlickVideoWithControls(),
                    )
                  : Container(),
            ),
          ),
        ),
        Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: Container(),
          ),
        ),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: controller != null
                  ? FlickVideoPlayer(
                      flickManager: controller!,
                      flickVideoWithControls: const FlickVideoWithControls(),
                    )
                  : Container(),
            ),
          ),
        ),
      ],
    );
  }
}

class _CoverWidget extends StatelessWidget {
  final SongModel? song;

  const _CoverWidget({required this.song});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 40,
            offset: const Offset(0, 16),
            color: Colors.black.withAlpha(60),
          ),
        ],
      ),
      child: Center(
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAlias,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              useOldImageOnUrlChange: true,
              cacheKey: song?.title ?? "",
              imageUrl: song?.thumbnail.toString() ?? "",
            ),
          ),
        ),
      ),
    );
  }
}

class ModalPlayer extends StatelessWidget {
  final controller = Get.find<PlayerController>();

  ModalPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ).copyWith(
                top: 100 + 16,
                bottom: 280 + 16,
              ),
              child: Obx(
                () => Visibility(
                  visible: controller.getVideoPlayerController != null,
                  replacement: _CoverWidget(
                    song: controller.getCurrentSong,
                  ),
                  child: _VideoPlayerWidget(
                    controller: controller.getVideoPlayerController,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 1,
            child: _HeaderWidget(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _FooterWidget(),
          ),
        ],
      ),
    );
  }
}
