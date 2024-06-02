import 'package:find_food/features/nav/explore/search/presentation/page/search_page.dart';
import 'package:find_food/features/nav/home/home/di/home_binding.dart';
import 'package:find_food/features/nav/home/home/presentation/page/home_page.dart';
import 'package:find_food/features/nav/notify/presentation/page/notify_page.dart';
import 'package:find_food/features/nav/post/upload/di/upload_binding.dart';
import 'package:find_food/features/nav/post/upload/presentation/page/upload_page.dart';
import 'package:find_food/features/nav/profile/di/profile_binding.dart';
import 'package:find_food/features/nav/profile/presentation/page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final pages = <String>[
    '/home',
    '/explore',
    '/upload_post',
    '/notify',
    '/profile'
  ];

  var isLoading=false.obs;
  
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/home') {
      return GetPageRoute(
        settings: settings,
        page: () => const HomePage(),
        binding: HomeBinding(),
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
        binding: UploadBinding(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/notify') {
      return GetPageRoute(
        settings: settings,
        page: () => const NotifyPage(),
        // binding: ProfileBindding(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/profile') {
      return GetPageRoute(
        settings: settings,
        page: () => const ProfilePage(),
        binding: ProfileBindding(),
        transition: Transition.fadeIn,
      );
    }

    return null;
  }

  void onChangeItemBottomBar(int index) {
    if (currentIndex.value == index) return;
    currentIndex.value = index;
    Get.offAndToNamed(pages[index], id: 10);
  }
}
