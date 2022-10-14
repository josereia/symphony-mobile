import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// ignore: library_prefixes
import 'package:symphony/ui/widgets/buttons/icon_button.dart' as Symphony;
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
  _ImagePickState createState() => _ImagePickState();
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
      print('Falha ao adicionar a imagem');
    }
  }

  Widget renderComponent(Uint8List? bytes) {
    if (bytes != null) {
      return SizedBox(
        width: 150,
        height: 150,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(75),
            border: Border.all(width: 5, color: const Color(0xff4D3FC6)),
            color: const Color(0xff4D3FC6),
            image: DecorationImage(
              image: MemoryImage(bytes),
            ),
          ),
        ),
      );
    } else {
      return Symphony.IconButton(
        icon: Icons.add_photo_alternate,
        onPressed: _addImage,
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
