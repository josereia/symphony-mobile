import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class LibraryPage extends GetView {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Biblioteca",
          style: Theme.of(context).appBarTheme.toolbarTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FeatherIcons.search),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    "https://preview.redd.it/rnqa7yhv4il71.jpg?width=640&crop=smart&auto=webp&s=819eb2bda1b35c7729065035a16e81824132e2f1",
                    width: 140,
                    height: 140,
                  ),
                ),
                const SizedBox(height: 6),
                const Text("Músicas Curtidas"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
