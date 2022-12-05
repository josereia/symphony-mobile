import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:symphony/controller/auth_controller.dart';
import 'package:symphony/controller/pages/profile_page_controller.dart';
import 'package:symphony/ui/widgets/buttons/button_widget.dart';

class _HeaderWidget extends StatelessWidget {
  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(260),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CachedNetworkImage(
            height: 200,
            fit: BoxFit.cover,
            useOldImageOnUrlChange: true,
            cacheKey: "cover_pic",
            imageUrl:
                "https://static.vecteezy.com/system/resources/previews/006/464/063/large_2x/abstract-equalizer-wave-design-music-sound-wave-element-waveform-with-neon-color-gradient-wavy-line-background-free-photo.jpg",
          ),
          Positioned(
            left: 16,
            bottom: 60 - 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: InkWell(
                    //onTap: () => Get.toNamed(AppRoutes.profile),
                    child: Ink(
                      child: CircleAvatar(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: controller.getUser?.photoURL != null
                              ? CachedNetworkImage(
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  useOldImageOnUrlChange: true,
                                  cacheKey: "profile_pic",
                                  imageUrl: controller.getUser!.photoURL!,
                                )
                              : const CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Obx(
                  () => controller.getUser?.name != null
                      ? Text(
                          controller.getUser!.name!,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      : const CircularProgressIndicator(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends GetView<ProfileController> {
  final AuthController _authController = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          _HeaderWidget(),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidget(
                    title: "Sair",
                    prefixIcon: FeatherIcons.logOut,
                    color: ButtonColors.error,
                    onPressed: () => _authController.logOut(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
