import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:symphony/controller/pages/root_controller.dart';
import 'package:symphony/ui/pages/home_page.dart';
import 'package:symphony/ui/pages/library_page.dart';
import 'package:symphony/ui/pages/search_page.dart';
import 'package:symphony/ui/widgets/float_player_widget.dart';
import 'package:symphony/ui/widgets/modal_player_widget.dart';
import '../../controller/player_controller.dart';

class RootPage extends GetView<RootController> {
  final playerController = Get.find<PlayerController>();

  RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => IndexedStack(
              index: controller.tabIndex.value,
              children: [
                HomePage(),
                const SearchPage(),
                const LibraryPage(),
              ],
            ),
          ),
          Obx(
            () => Visibility(
              visible: playerController.getCurrentSong.album.isNotEmpty,
              child: Positioned(
                bottom: 4,
                left: 4,
                right: 4,
                child: InkWell(
                  onTap: () => showCupertinoModalBottomSheet(
                      expand: true,
                      topRadius: const Radius.circular(20),
                      context: context,
                      builder: (context) => ModalPlayer()),
                  child: FloatPlayer(),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.tabIndex.value,
          onTap: (index) => controller.changeTabIndex(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.search),
              label: "Buscar",
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.bookOpen),
              label: "Biblioteca",
            ),
          ],
        ),
      ),
    );
  }
}
