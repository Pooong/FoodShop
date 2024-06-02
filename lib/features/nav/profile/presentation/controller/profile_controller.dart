import 'package:find_food/features/nav/profile/nav/profile_bookmark/presentation/page/profile_bookmark_page.dart';
import 'package:find_food/features/nav/profile/nav/profile_favorite/presentation/page/profile_favorite_page.dart';
import 'package:find_food/features/nav/profile/nav/profile_list/presentation/page/profile_list_page.dart';
import 'package:find_food/features/nav/profile/nav/profile_locked/presentation/page/profile_locked_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxInt currentIndex = 0.obs;
  final pages = <String>[
    '/profile_list',
    '/profile_favorite',
    '/profile_bookmark',
    '/profile_locked'
  ];
  PageController pageController = PageController(initialPage: 0);
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/profile_list':
        return GetPageRoute(
          settings: settings,
          page: () => ProfileListPage(),
          transition: Transition.fadeIn,
        );
      case '/profile_favorite':
        return GetPageRoute(
          settings: settings,
          page: () => ProfileFavoritePage(),
          transition: Transition.fadeIn,
        );
      case '/profile_bookmark':
        return GetPageRoute(
          settings: settings,
          page: () => ProfileBookmarkPage(),
          transition: Transition.fadeIn,
        );
      case '/profile_locked':
        return GetPageRoute(
          settings: settings,
          page: () => ProfileLockedPage(),
          transition: Transition.fadeIn,
        );
      default:
        return null;
    }
  }

  void onChangeNavList(int index) {
    if (currentIndex.value == index) return;
    currentIndex.value = index;
    pageController.jumpToPage(index);
    // Get.offAndToNamed(pages[index], id: 3);
  }

  void onChangePage(int index) {
    currentIndex.value = index;
  }

  
  List<Widget> getPages() {
    return [
      ProfileListPage(),
      ProfileFavoritePage(),
      ProfileBookmarkPage(),
      ProfileLockedPage()
    ];
  }
}
