import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/data/model/song_model.dart';

import '../../../data/provider/api_provider.dart';

class ArtistList extends StatelessWidget {
  final cloudinaryApi = Get.put(ApiProvider());
  final String title;
  final List<SongModel> data;

  ArtistList({super.key, required this.title, required this.data});

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
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            IconButton(
              alignment: Alignment.centerRight,
              onPressed: () {},
              icon: const Icon(FeatherIcons.chevronRight),
            )
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 140,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(16),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        useOldImageOnUrlChange: true,
                        cacheKey: data[index].artists[0],
                        imageUrl: cloudinaryApi.getArtistPicURL(
                          data[index].artists[0],
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      width: 100,
                      child: Center(
                        child: Text(
                          data[index].artists[0],
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
