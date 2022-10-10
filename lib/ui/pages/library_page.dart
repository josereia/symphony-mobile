import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/ui/widgets/appbar_widget.dart';

class LibraryPage extends GetView {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Biblioteca",
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
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
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
                    width: 120,
                    height: 120,
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
