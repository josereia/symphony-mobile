import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../controller/pages/register_page_controller.dart';

Future<String> encodeXFile(XFile image) async {
  var bytes = await image.readAsBytes();
  return base64.encode(bytes);
}

Uint8List decodeBase64Image(String imagem) => base64.decode(imagem);

class ImagePick extends StatefulWidget {
  final RegisterController controller;
  const ImagePick({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  ImagePicker imagePicker = ImagePicker();
  Uint8List? bytes;
  String? encoded;

  void _setImage(Uint8List image) {
    setState(() {
      bytes = image;
    });
  }

  void _addImage() async {
    try {
      XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var bytes = await image.readAsBytes();
        _setImage(bytes);
        encoded = await encodeXFile(image);
        if (encoded != null) {
          widget.controller.b64ProfilePic.value = encoded!;
        }
      }
    } catch (e) {
      log('Falha ao adicionar a imagem');
    }
  }

  Widget renderComponent(Uint8List? bytes) {
    final ThemeData theme = Theme.of(context);

    if (bytes != null) {
      return InkWell(
        onTap: () => _addImage(),
        borderRadius: BorderRadius.circular(100),
        child: Ink(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 2, color: theme.colorScheme.primary),
            color: theme.colorScheme.primary,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: MemoryImage(bytes),
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () => _addImage(),
        borderRadius: BorderRadius.circular(100),
        child: Ink(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: theme.colorScheme.primary,
          ),
          child: Icon(
            Icons.add_a_photo,
            color: theme.colorScheme.onPrimary,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [renderComponent(bytes)],
    );
  }
}
