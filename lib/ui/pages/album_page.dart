import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/data/model/song_data.dart';
import 'package:symphony/data/provider/api_provider.dart';

class AlbumPage extends GetView {
  final SongData data = Get.arguments as SongData;
  final cloudinaryApi = Get.put(ApiProvider());

  AlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                          child: Image(
                            width: 140,
                            height: 140,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              cloudinaryApi.getAlbumPicURL(data.album),
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
                                  data.album,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  data.artists[0],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  child: Icon(
                                    FeatherIcons.play,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                  ),
                                ),
                                IconButton(
                                  color: Theme.of(context).iconTheme.color,
                                  onPressed: () {},
                                  icon: const Icon(FeatherIcons.heart),
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
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  onTap: () {},
                  leading: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      (index + 1).toString(),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Theme.of(context).iconTheme.color),
                    ),
                  ),
                  title: Text(data.title),
                  subtitle: Text(data.artists.join(", ")),
                  trailing: IconButton(
                    color: Theme.of(context).iconTheme.color,
                    onPressed: () {},
                    icon: const Icon(FeatherIcons.play),
                  ),
                );
              },
              childCount: 14,
            ),
          ),
        ],
      ),
    );
  }
}
