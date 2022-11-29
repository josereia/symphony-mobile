import 'package:get/get.dart';
import 'package:symphony/binding/album_page_binding.dart';
import 'package:symphony/binding/home_page_binding.dart';
import 'package:symphony/binding/library_page_binding.dart';
import 'package:symphony/binding/login_page_binding.dart';
import 'package:symphony/binding/profile_page_binding.dart';
import 'package:symphony/binding/register_page_binding.dart';
import 'package:symphony/binding/root_page_binding.dart';
import 'package:symphony/binding/search_page_binding.dart';
import 'package:symphony/routes/app_routes.dart';

//pages
import 'package:symphony/ui/pages/album_page.dart';
import 'package:symphony/ui/pages/home_page.dart';
import 'package:symphony/ui/pages/library_page.dart';
import 'package:symphony/ui/pages/login_page.dart';
import 'package:symphony/ui/pages/profile_page.dart';
import 'package:symphony/ui/pages/register_page.dart';
import 'package:symphony/ui/pages/root_page.dart';
import 'package:symphony/ui/pages/search_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => RootPage(),
      bindings: [
        RootBinding(),
        HomeBinding(),
        SearchBinding(),
        LibraryBinding(),
      ],
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
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
      binding: SearchBinding(),
    ),
    GetPage(
      name: AppRoutes.library,
      page: () => const LibraryPage(),
      binding: LibraryBinding(),
    ),
    GetPage(
      name: AppRoutes.albumPage,
      page: () => AlbumPage(),
      binding: AlbumPageBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
  ];
}
