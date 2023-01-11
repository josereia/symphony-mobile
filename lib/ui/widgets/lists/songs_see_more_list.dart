import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/player_controller.dart';
import 'package:symphony/data/model/playlist_model.dart';

class _LeadingWidget extends StatelessWidget {
  final String cacheKey;
  final Uri thumbnail;

  const _LeadingWidget({
    required this.cacheKey,
    required this.thumbnail,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          useOldImageOnUrlChange: true,
          cacheKey: cacheKey,
          imageUrl: thumbnail.toString(),
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  final String title;
  final bool? isActive;

  const _TitleWidget({required this.title, this.isActive});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: isActive == true
          ? TextStyle(color: theme.colorScheme.primary)
          : TextStyle(color: theme.textTheme.bodySmall?.color),
    );
  }
}

class _SubtitleWidget extends StatelessWidget {
  final String author;
  final bool? isActive;

  const _SubtitleWidget({
    required this.author,
    this.isActive,
  });

  Widget getTextWidget(BuildContext context, String text) {
    final ThemeData theme = Theme.of(context);

    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: isActive == true
          ? TextStyle(color: theme.colorScheme.primary)
          : TextStyle(color: theme.textTheme.bodySmall?.color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getTextWidget(context, author),
      ],
    );
  }
}

class _TrailingWidget extends StatelessWidget {
  final playerController = Get.find<PlayerController>();

  final PlaylistModel playlist;
  final int index;
  final bool? isActive;
  final bool? isPlaying;

  _TrailingWidget({
    required this.playlist,
    required this.index,
    this.isActive,
    this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return IconButton(
      color:
          isActive == true ? theme.colorScheme.primary : theme.iconTheme.color,
      onPressed: () => isActive == true
          ? playerController.playPause()
          : playerController.play(playlist: playlist, index: index),
      icon: isActive == true
          ? isPlaying == true
              ? const Icon(FeatherIcons.pause)
              : const Icon(FeatherIcons.play)
          : const Icon(FeatherIcons.play),
    );
  }
}

class SongsSeeMoreList extends StatelessWidget {
  final playerController = Get.find<PlayerController>();

  final PlaylistModel playlist;

  SongsSeeMoreList({
    super.key,
    required this.playlist,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: playlist.songs.length,
      itemBuilder: (context, index) => Obx(
        () {
          final bool isActive = playerController.getCurrentSong?.title ==
              playlist.songs[index].title;

          return ListTile(
            contentPadding: const EdgeInsets.all(0),
            isThreeLine: true,
            onTap: () => playerController.play(
              playlist: playlist,
              index: index,
            ),
            leading: _LeadingWidget(
              cacheKey: playlist.songs[index].author,
              thumbnail: playlist.songs[index].thumbnail,
            ),
            title: _TitleWidget(
              title: playlist.songs[index].title,
              isActive: isActive,
            ),
            subtitle: _SubtitleWidget(
              author: playlist.songs[index].author,
              isActive: isActive,
            ),
            trailing: _TrailingWidget(
              playlist: playlist,
              index: index,
              isActive: isActive,
              isPlaying: playerController.getIsPlaying,
            ),
          );
        },
      ),
    );
  }
}
