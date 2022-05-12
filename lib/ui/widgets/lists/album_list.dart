import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:symphony/data/model/song_data.dart';
import 'package:symphony/data/provider/api_provider.dart';

class AlbumList extends StatelessWidget {
  final cloudinaryApi = Get.put(ApiProvider());
  final String title;
  final List<SongData> data;

  AlbumList({Key? key, required this.title, required this.data})
      : super(key: key);

  Future<Color> _getImagePalette(ImageProvider imageProvider) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    return paletteGenerator.dominantColor!.color;
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
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            IconButton(
              onPressed: () {},
              alignment: Alignment.centerRight,
              icon: const Icon(FeatherIcons.chevronRight),
            )
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 202,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return FutureBuilder<Color>(
                future: _getImagePalette(
                  NetworkImage(
                    cloudinaryApi.getAlbumPicURL(data[index].album),
                  ),
                ),
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: snapshot.data ?? Colors.grey,
                              offset: const Offset(
                                0.0,
                                3.0,
                              ),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ),
                            BoxShadow(
                              color: snapshot.data?.withAlpha(80) ??
                                  Colors.grey.withAlpha(80),
                              offset: const Offset(
                                0.0,
                                6.0,
                              ),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ),
                            BoxShadow(
                              color: snapshot.data?.withAlpha(60) ?? 
                                  Colors.grey.withAlpha(60),
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
                              cloudinaryApi.getAlbumPicURL(data[index].album),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 9 + 6),
                      SizedBox(
                        width: 140,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index].album,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              data[index].album,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
