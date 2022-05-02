import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class AlbumList extends StatelessWidget {
  final String title;

  const AlbumList({Key? key, required this.title}) : super(key: key);

  Future<Color> _getImagePalette(ImageProvider imageProvider) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    return paletteGenerator.dominantColor!.color;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return FutureBuilder<Color>(
                future: _getImagePalette(
                  const NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/pt/7/71/Sour_-_Olivia_Rodrigo.png"),
                ),
                builder: (context, snapshot) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: const Image(
                            width: 140,
                            height: 140,
                            image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/pt/7/71/Sour_-_Olivia_Rodrigo.png"),
                          ),
                        ),
                      ),
                      const SizedBox(height: 9),
                      Text(
                        "SOUR",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Text("Olivia Rodrigo"),
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
