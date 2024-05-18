import 'package:find_food/core/ui/widgets/appbar/explore_appbar.dart';
import 'package:find_food/core/ui/widgets/appbar/home_appbar.dart';
import 'package:find_food/core/ui/widgets/appbar/upload_post_appbar.dart';
import 'package:find_food/features/nav/explore/search/presentation/page/search_page.dart';
import 'package:find_food/features/nav/home/home/presentation/page/home_page.dart';
import 'package:find_food/features/nav/post/upload/presentation/page/upload_page.dart';
import 'package:find_food/features/nav/profile/presentation/page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final List appbars = <Widget>[
    const HomeAppbar(),
    const ExploreAppbar(),
    const UploadPostAppbar(),
  ];

  final pages = <String>[
    '/home',
    '/explore',
    '/upload_post',
    '/notify',
    '/profile'
  ];

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/home') {
      return GetPageRoute(
        settings: settings,
        page: () => const HomePage(),
        // binding: DiaryBindding(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/explore') {
      return GetPageRoute(
        settings: settings,
        page: () => const SearchPage(),
        // binding: TypeExerciseBindding(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/upload_post') {
      return GetPageRoute(
        settings: settings,
        page: () => const UploadPage(),
        // binding: MyLibraryBinding(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/notify') {
      return GetPageRoute(
        settings: settings,
        page: () => const UploadPage(),
        // binding: ProfileBindding(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/profile') {
      return GetPageRoute(
        settings: settings,
        page: () => const ProfilePage(),
        // binding: ProfileBindding(),
        transition: Transition.fadeIn,
      );
    }

    return null;
  }

 PreferredSizeWidget changeAppBar(int index) {
    if (index >= 0 && index < appbars.length) {
      return appbars[index];
    }
    return  PreferredSize(
      preferredSize: Size.fromHeight(56.0), // Typical height for an AppBar
      child: AppBar(
        title: const Text("Default AppBar"),
        backgroundColor: Colors.red,
      ),
    );
  }




  void onChangeItemBottomBar(int index) {
    if (currentIndex.value == index) return;
    currentIndex.value = index;
    Get.offAndToNamed(pages[index], id: 1);
  }
}
