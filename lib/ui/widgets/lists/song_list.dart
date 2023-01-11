import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/player_controller.dart';
import 'package:symphony/data/model/playlist_model.dart';
import 'package:symphony/routes/app_routes.dart';

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
      borderRadius: BorderRadius.circular(16),
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

    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: isActive == true
            ? theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.primary,
              )
            : theme.textTheme.titleMedium?.copyWith(
                color: theme.textTheme.bodySmall?.color,
              ),
      ),
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

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        author,
        overflow: TextOverflow.ellipsis,
        style: isActive == true
            ? TextStyle(color: theme.colorScheme.primary)
            : TextStyle(color: theme.textTheme.bodySmall?.color),
      ),
    );
  }
}

class SongList extends StatelessWidget {
  final playerController = Get.find<PlayerController>();

  final PlaylistModel playlist;
  final int? length;

  SongList({
    super.key,
    required this.playlist,
    this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              playlist.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            IconButton(
              alignment: Alignment.centerRight,
              icon: const Icon(FeatherIcons.chevronRight),
              onPressed: () => Get.toNamed(
                AppRoutes.songListSeeMorePage,
                arguments: playlist,
              ),
            )
          ],
        ),
        SizedBox(
          height: 208,
          child: ListView.builder(
            itemCount: playlist.songs.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Obx(
              () {
                final bool isActive = playerController.getCurrentSong?.title ==
                    playlist.songs[index].title;

                return InkWell(
                  onTap: () => playerController.play(
                    playlist: playlist,
                    index: index,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  child: Ink(
                    width: 150,
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _LeadingWidget(
                          cacheKey: playlist.songs[index].title,
                          thumbnail: playlist.songs[index].thumbnail,
                        ),
                        const SizedBox(height: 6),
                        _TitleWidget(
                          title: playlist.songs[index].title,
                          isActive: isActive,
                        ),
                        _SubtitleWidget(
                          author: playlist.songs[index].author,
                          isActive: isActive,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
