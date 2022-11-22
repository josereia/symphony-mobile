import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/player_controller.dart';
import 'package:symphony/data/model/song_model.dart';
import 'package:symphony/data/provider/api_provider.dart';

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
  final String title;
  final bool? active;

  const _TitleWidget({required this.title, this.active});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: active == true
          ? TextStyle(color: theme.colorScheme.primary)
          : TextStyle(color: theme.textTheme.bodySmall?.color),
    );
  }
}

class _SubtitleWidget extends StatelessWidget {
  final String album;
  final String artists;
  final bool? active;

  const _SubtitleWidget({
    required this.album,
    required this.artists,
    this.active,
  });

  Widget getTextWidget(BuildContext context, String text) {
    final ThemeData theme = Theme.of(context);

    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: active == true
          ? TextStyle(color: theme.colorScheme.primary)
          : TextStyle(color: theme.textTheme.bodySmall?.color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getTextWidget(context, album),
        getTextWidget(context, artists),
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
  final bool? isPlaying;

  _TrailingWidget({
    required this.data,
    required this.index,
    required this.title,
    this.active,
    this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return IconButton(
      color: active == true ? theme.colorScheme.primary : theme.iconTheme.color,
      onPressed: () => active == true
          ? playerController.playPause()
          : playerController.play(
              data,
              index,
              title,
            ),
      icon: active == true
          ? isPlaying == true
              ? const Icon(FeatherIcons.pause)
              : const Icon(FeatherIcons.play)
          : const Icon(FeatherIcons.play),
    );
  }
}

class SongsSeeMoreList extends StatelessWidget {
  final playerController = Get.find<PlayerController>();
  final cloudinaryApi = Get.put<ApiProvider>(ApiProvider());

  final String title;
  final List<SongModel> data;

  SongsSeeMoreList({
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
        isThreeLine: true,
        onTap: () => playerController.play(data, index, title),
        leading: _LeadingWidget(
          album: data[index].album,
          albumPicUrl: cloudinaryApi.getAlbumPicURL(data[index].album),
        ),
        title: Obx(
          () => _TitleWidget(
            title: data[index].title,
            active: playerController.getCurrentSong?.title == data[index].title,
          ),
        ),
        subtitle: Obx(
          () => _SubtitleWidget(
            album: data[index].album,
            artists: data[index].artists.join(", "),
            active: playerController.getCurrentSong?.title == data[index].title,
          ),
        ),
        trailing: Obx(
          () => _TrailingWidget(
            data: data,
            index: index,
            title: title,
            active: playerController.getCurrentSong?.title == data[index].title,
            isPlaying: playerController.getIsPlaying,
          ),
        ),
      ),
    );
  }
}
