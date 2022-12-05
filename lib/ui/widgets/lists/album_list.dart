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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          const BoxShadow(
            color: Colors.grey,
            offset: Offset(
              0.0,
              3.0,
            ),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
          BoxShadow(
            color: Colors.grey.withAlpha(80),
            offset: const Offset(
              0.0,
              6.0,
            ),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
          BoxShadow(
            color: Colors.grey.withAlpha(60),
            offset: const Offset(
              0.0,
              9.0,
            ),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: ClipRRect(
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

class AlbumList extends StatelessWidget {
  final playerController = Get.find<PlayerController>();
  final cloudinaryApi = Get.put(ApiProvider());

  final String title;
  final List<SongModel> albums;
  final List<SongModel> data = [];
  final int? length;

  AlbumList({
    super.key,
    required this.title,
    required this.albums,
    this.length,
  }) {
    data.addAll(albums);
    data.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                AppRoutes.albumListSeeMorePage,
                arguments: <String, dynamic>{"title": title, "data": data},
              ),
            )
          ],
        ),
        SizedBox(
          height: 215,
          child: ListView.builder(
            itemCount: data.isNotEmpty && length != null ? length : data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Get.toNamed(
                  AppRoutes.albumPage,
                  arguments: <String, dynamic>{"album": data[index]},
                ),
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
                      const SizedBox(height: 9 + 6),
                      Obx(
                        () => _TitleWidget(
                          title: data[index].album,
                          active: playerController.getCurrentSong?.album ==
                              data[index].album,
                        ),
                      ),
                      Obx(
                        () => _SubtitleWidget(
                          artists: data[index].artists[0],
                          active: playerController.getCurrentSong?.album ==
                              data[index].album,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
