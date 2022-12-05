import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/player_controller.dart';
import 'package:symphony/data/model/song_model.dart';
import 'package:symphony/data/provider/api_provider.dart';

class _LeadingWidget extends StatelessWidget {
  final String artist;
  final String artistPicUrl;

  const _LeadingWidget({required this.artist, required this.artistPicUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          useOldImageOnUrlChange: true,
          cacheKey: artist,
          imageUrl: artistPicUrl,
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  final String artist;
  final bool? active;

  const _TitleWidget({required this.artist, this.active});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Text(
      artist,
      overflow: TextOverflow.ellipsis,
      style: active == true
          ? TextStyle(color: theme.colorScheme.primary)
          : TextStyle(color: theme.textTheme.bodySmall?.color),
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

class ArtistsSeeMoreList extends StatelessWidget {
  final playerController = Get.find<PlayerController>();
  final cloudinaryApi = Get.put<ApiProvider>(ApiProvider());

  final String title;
  final List<SongModel> data;

  ArtistsSeeMoreList({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: data.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) => ListTile(
        contentPadding: const EdgeInsets.all(0),
        onTap: () => {},
        leading: _LeadingWidget(
          artist: data[index].artists[0],
          artistPicUrl: cloudinaryApi.getArtistPicURL(data[index].artists[0]),
        ),
        title: _TitleWidget(
          artist: data[index].artists[0],
          active: false,
        ),
        trailing: _TrailingWidget(
          data: data,
          index: index,
          title: title,
          active: false,
        ),
      ),
    );
  }
}
