import 'package:get/get.dart';
import 'package:symphony/binding/home_binding.dart';
import 'package:symphony/binding/library_binding.dart';
import 'package:symphony/binding/login_binding.dart';
import 'package:symphony/binding/search_binding.dart';
import 'package:symphony/ui/pages/home_page.dart';
import 'package:symphony/ui/pages/library_page.dart';
import 'package:symphony/ui/pages/login_page.dart';
import 'package:symphony/ui/pages/search_page.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: AppRoutes.search,
        page: () => const SearchPage(),
        binding: SearchBinding()),
    GetPage(
        name: AppRoutes.library,
        page: () => const LibraryPage(),
        binding: LibraryBinding()),
  ];
}
