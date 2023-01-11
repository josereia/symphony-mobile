import 'package:get/get.dart';
import 'package:symphony/binding/home_page_binding.dart';
import 'package:symphony/binding/library_page_binding.dart';

import 'package:symphony/binding/root_page_binding.dart';
import 'package:symphony/binding/search_page_binding.dart';
import 'package:symphony/routes/app_routes.dart';

//pages
import 'package:symphony/ui/pages/song_list_see_more_page.dart';
import 'package:symphony/ui/pages/home_page.dart';
import 'package:symphony/ui/pages/library_page.dart';
import 'package:symphony/ui/pages/root_page.dart';
import 'package:symphony/ui/pages/search_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => RootPage(),
      maintainState: true,
      bindings: [
        RootBinding(),
        HomeBinding(),
        SearchBinding(),
        LibraryBinding(),
      ],
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
      name: AppRoutes.songListSeeMorePage,
      page: () => SongListSeeMorePage(),
    ),
  ];
}
