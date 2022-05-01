import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:symphony/binding/firebase_binding.dart';
import 'package:symphony/routes/app_pages.dart';
import 'package:symphony/ui/theme/app_theme.dart';
import 'data/provider/auth_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthProvider()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.pages,
      initialRoute: AppRoutes.login,
      initialBinding: FirebaseBinding(),
      theme: LightTheme().getThemeData(),
      //darkTheme: DarkTheme().getThemeData(context),
      locale: const Locale("pt", "BR"),
      debugShowCheckedModeBanner: false,
    );
  }
}
