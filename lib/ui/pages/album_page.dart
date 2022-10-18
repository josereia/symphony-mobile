import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/pages/album_page_controller.dart';
import 'package:symphony/controller/player_controller.dart';
import 'package:symphony/data/model/song_model.dart';
import 'package:symphony/data/provider/api_provider.dart';

class _AppBar extends StatelessWidget {
  final playerController = Get.find<PlayerController>();
  final cloudinaryApi = Get.put(ApiProvider());
  final SongModel albumData;
  final List<SongModel> songs;

  _AppBar({
    required this.albumData,
    required this.songs,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SliverAppBar(
      expandedHeight: 220,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        background: Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 140,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
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
                    child: CachedNetworkImage(
                      width: 140,
                      height: 140,
                      fit: BoxFit.cover,
                      useOldImageOnUrlChange: true,
                      cacheKey: albumData.album,
                      imageUrl: cloudinaryApi.getArtistPicURL(
                        albumData.album,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            albumData.album,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: theme.textTheme.titleLarge,
                          ),
                          Text(
                            albumData.artists[0],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () =>
                                playerController.getCurrentSong?.album ==
                                        albumData.album
                                    ? playerController.playPause()
                                    : playerController.play(
                                        songs,
                                        0,
                                        albumData.album,
                                      ),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: theme.colorScheme.primary,
                              ),
                              child: Obx(
                                () => playerController.getCurrentSong?.album ==
                                        albumData.album
                                    ? playerController.getIsPlaying
                                        ? Icon(
                                            FeatherIcons.pause,
                                            color: theme
                                                .colorScheme.inversePrimary,
                                          )
                                        : Icon(
                                            FeatherIcons.play,
                                            color: theme
                                                .colorScheme.inversePrimary,
                                          )
                                    : Icon(
                                        FeatherIcons.play,
                                        color: theme.colorScheme.inversePrimary,
                                      ),
                              ),
                            ),
                          ),
                          IconButton(
                            color: theme.iconTheme.color,
                            onPressed: () {},
                            icon: const Icon(
                              FeatherIcons.heart,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _List extends StatelessWidget {
  final playerController = Get.find<PlayerController>();

  final SongModel albumData;
  final List<SongModel> songs;

  _List({
    required this.albumData,
    required this.songs,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListTile(
            onTap: () => playerController.play(
              songs,
              index,
              albumData.album,
            ),
            leading: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              child: Obx(
                () => Text(
                  (index + 1).toString(),
                  style: playerController.getCurrentSong?.title ==
                          songs[index].title
                      ? theme.textTheme.titleLarge?.copyWith(
                          color: theme.colorScheme.primary,
                        )
                      : theme.textTheme.titleLarge?.copyWith(
                          color: theme.iconTheme.color,
                        ),
                ),
              ),
            ),
            title: Obx(
              () => Text(
                songs[index].title,
                overflow: TextOverflow.ellipsis,
                style:
                    playerController.getCurrentSong?.title == songs[index].title
                        ? TextStyle(
                            color: theme.colorScheme.primary,
                          )
                        : TextStyle(
                            color: theme.textTheme.bodySmall!.color,
                          ),
              ),
            ),
            subtitle: Obx(
              () => Text(
                albumData.artists.join(", "),
                overflow: TextOverflow.ellipsis,
                style:
                    playerController.getCurrentSong?.title == songs[index].title
                        ? TextStyle(
                            color: theme.colorScheme.primary,
                          )
                        : TextStyle(
                            color: theme.textTheme.bodySmall!.color,
                          ),
              ),
            ),
            trailing: Obx(
              () => IconButton(
                color:
                    playerController.getCurrentSong?.title == songs[index].title
                        ? theme.colorScheme.primary
                        : theme.iconTheme.color,
                onPressed: () =>
                    playerController.getCurrentSong?.title == songs[index].title
                        ? playerController.playPause()
                        : playerController.play(
                            songs,
                            index,
                            albumData.album,
                          ),
                icon:
                    playerController.getCurrentSong?.title == songs[index].title
                        ? playerController.getIsPlaying
                            ? const Icon(FeatherIcons.pause)
                            : const Icon(FeatherIcons.play)
                        : const Icon(FeatherIcons.play),
              ),
            ),
          );
        },
        childCount: songs.length,
      ),
    );
  }
}

class AlbumPage extends GetView<AlbumPageController> {
  final SongModel albumData = Get.arguments as SongModel;

  AlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.getAlbumSongs(albumData.album),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<SongModel>> snapshot,
        ) =>
            snapshot.data != null && snapshot.data!.isNotEmpty
                ? CustomScrollView(
                    slivers: [
                      _AppBar(
                        albumData: albumData,
                        songs: snapshot.data!,
                      ),
                      _List(
                        albumData: albumData,
                        songs: snapshot.data!,
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
      ),
    );
  }
}
