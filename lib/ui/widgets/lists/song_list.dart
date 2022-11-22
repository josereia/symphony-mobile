import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/player_controller.dart';
import 'package:symphony/data/model/song_model.dart';
import 'package:symphony/data/provider/api_provider.dart';
import 'package:symphony/routes/app_routes.dart';

class _LeadingWidget extends StatelessWidget {
  final String album;
  final String albumPicUrl;

  const _LeadingWidget({required this.album, required this.albumPicUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          useOldImageOnUrlChange: true,
          cacheKey: album,
          imageUrl: albumPicUrl,
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  final String title;
  final bool? active;

  const _TitleWidget({required this.title, this.active});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: active == true
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
  final String artists;
  final bool? active;

  const _SubtitleWidget({
    required this.artists,
    this.active,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        artists,
        overflow: TextOverflow.ellipsis,
        style: active == true
            ? TextStyle(color: theme.colorScheme.primary)
            : TextStyle(color: theme.textTheme.bodySmall?.color),
      ),
    );
  }
}

class SongList extends StatelessWidget {
  final cloudinaryApi = Get.put(ApiProvider());
  final playerController = Get.find<PlayerController>();

  final String title;
  final List<SongModel> songs;
  final List<SongModel> data = [];
  final int? length;

  SongList({
    super.key,
    required this.title,
    required this.songs,
    this.length,
  }) {
    data.addAll(songs);
    data.shuffle();
  }

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
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            IconButton(
              alignment: Alignment.centerRight,
              icon: const Icon(FeatherIcons.chevronRight),
              onPressed: () => Get.toNamed(
                AppRoutes.songListSeeMorePage,
                arguments: <String, dynamic>{"title": title, "data": data},
              ),
            )
          ],
        ),
        SizedBox(
          height: 206,
          child: ListView.builder(
            itemCount: data.isNotEmpty && length != null ? length : data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              onTap: () => playerController.play(data, index, title),
              borderRadius: BorderRadius.circular(16),
              child: Ink(
                width: 140 + 16,
                padding: const EdgeInsets.all(6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _LeadingWidget(
                      album: data[index].album,
                      albumPicUrl: cloudinaryApi.getAlbumPicURL(
                        data[index].album,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Obx(
                      () => _TitleWidget(
                        title: data[index].title,
                        active: playerController.getCurrentSong?.title ==
                            data[index].title,
                      ),
                    ),
                    Obx(
                      () => _SubtitleWidget(
                        artists: data[index].artists.join(", "),
                        active: playerController.getCurrentSong?.title ==
                            data[index].title,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
