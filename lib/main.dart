import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:home_widget/home_widget.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:symphony/controller/auth_controller.dart';
import 'package:symphony/controller/player_controller.dart';
import 'package:symphony/data/repository/auth_repository.dart';
import 'package:symphony/routes/app_pages.dart';
import 'package:symphony/routes/app_routes.dart';
import 'package:symphony/ui/theme/app_theme.dart';
import 'data/provider/auth_provider.dart';
import 'firebase_options.dart';

final playerController = PlayerController();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    log(e.toString());
  }

  Get.put(playerController);
  Get.put(
    AuthController(
      AuthRepository(provider: AuthProvider()),
    ),
  );

  HomeWidget.registerBackgroundCallback(_backgroundCallback);

  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'symphony',
    androidNotificationOngoing: true,
    androidNotificationIcon: 'mipmap/ic_launcher',
    preloadArtwork: true,
  );

  runApp(const MyApp());
}

void _backgroundCallback(Uri? uri) {
  if (uri?.host == 'skipforward') {
    log("skip");
    playerController.previous();
  } else if (uri?.host == "skipback") {
    playerController.next();
  } else if (uri?.host == "playpause") {
    playerController.playPause();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.pages,
      initialRoute: AppRoutes.login,
      theme: LightTheme().getThemeData(),
      //darkTheme: DarkTheme().getThemeData(),
      locale: const Locale("pt", "BR"),
      debugShowCheckedModeBanner: false,
    );
  }
}
