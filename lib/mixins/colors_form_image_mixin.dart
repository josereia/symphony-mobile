import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

mixin ColorsFromImage {
  Future<Color?> getDominantColor(ImageProvider image) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(image);

    return paletteGenerator.dominantColor?.color ??
        paletteGenerator.vibrantColor?.color ??
        paletteGenerator.mutedColor?.color;
  }
}
