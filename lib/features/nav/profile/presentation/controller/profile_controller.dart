
import 'package:find_food/features/nav/profile/nav/profile_bookmark/presentation/page/profile_bookmark_page.dart';
import 'package:find_food/features/nav/profile/nav/profile_favorite/presentation/page/profile_favorite_page.dart';
import 'package:find_food/features/nav/profile/nav/profile_list/presentation/page/profile_list_page.dart';
import 'package:find_food/features/nav/profile/nav/profile_locked/presentation/page/profile_locked_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxInt currentIndex = 0.obs;

  final pages = <String>['/profile_list', '/profile_favorite', '/profile_bookmark', '/profile_locked'];

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/user_list') {
      return GetPageRoute(
        settings: settings,
        page: () => const ProfileListPage(),
        // binding: DiaryBindding(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/user_favorite') {
      return GetPageRoute(
        settings: settings,
        page: () => const ProfileFavoritePage(),
        // binding: TypeExerciseBindding(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/user_bookmark') {
      return GetPageRoute(
        settings: settings,
        page: () => const ProfileBookmarkPage(),
        // binding: MyLibraryBinding(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/user_locked') {
      return GetPageRoute(
        settings: settings,
        page: () => const ProfileLockedPage(),
        // binding: ProfileBindding(),
        transition: Transition.fadeIn,
      );
    }

    return null;
  }

  void onChangeItemBottomBar(int index) {
    if (currentIndex.value == index) return;
    currentIndex.value = index;
    Get.offAndToNamed(pages[index], id: 1);
  }
}
