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
      borderRadius: BorderRadius.circular(6),
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
  final String album;
  final bool? active;

  const _TitleWidget({required this.album, this.active});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Text(
      album,
      overflow: TextOverflow.ellipsis,
      style: active == true
          ? TextStyle(color: theme.colorScheme.primary)
          : TextStyle(color: theme.textTheme.bodySmall?.color),
    );
  }
}

class _SubtitleWidget extends StatelessWidget {
  final String artist;
  final bool? active;

  const _SubtitleWidget({
    required this.artist,
    this.active,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          artist,
          overflow: TextOverflow.ellipsis,
          style: active == true
              ? TextStyle(color: theme.colorScheme.primary)
              : TextStyle(color: theme.textTheme.bodySmall?.color),
        ),
      ],
    );
  }
}

class _TrailingWidget extends StatelessWidget {
  final playerController = Get.find<PlayerController>();

  final List<SongModel> data;
  final int index;
  final String title;
  final bool? active;

  _TrailingWidget({
    required this.data,
    required this.index,
    required this.title,
    this.active,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Icon(
      FeatherIcons.chevronRight,
      color: active == true ? theme.colorScheme.primary : theme.iconTheme.color,
    );
  }
}

class AlbumsSeeMoreList extends StatelessWidget {
  final playerController = Get.find<PlayerController>();
  final cloudinaryApi = Get.put<ApiProvider>(ApiProvider());

  final String title;
  final List<SongModel> data;

  AlbumsSeeMoreList({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => ListTile(
        contentPadding: const EdgeInsets.all(0),
        onTap: () => Get.toNamed(
          AppRoutes.albumPage,
          arguments: <String, dynamic>{"album": data[index]},
        ),
        leading: _LeadingWidget(
          album: data[index].album,
          albumPicUrl: cloudinaryApi.getAlbumPicURL(data[index].album),
        ),
        title: Obx(
          () => _TitleWidget(
            album: data[index].album,
            active: playerController.getCurrentSong?.album == data[index].album,
          ),
        ),
        subtitle: Obx(
          () => _SubtitleWidget(
            artist: data[index].artists[0],
            active: playerController.getCurrentSong?.album == data[index].album,
          ),
        ),
        trailing: Obx(
          () => _TrailingWidget(
            data: data,
            index: index,
            title: title,
            active: playerController.getCurrentSong?.album == data[index].album,
          ),
        ),
      ),
    );
  }
}
