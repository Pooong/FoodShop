import 'package:find_food/features/nav/home/home/presentation/page/home_page.dart';
import 'package:find_food/features/nav/post/upload/presentation/page/upload_page.dart';
import 'package:find_food/features/nav/profile/presentation/page/profile_page.dart';
import 'package:find_food/views/pages/Maps.dart';
import 'package:find_food/views/pages/Notify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final pages = <String>['/home', '/map', '/upload_post', '/notify', '/profile' ];

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/home') {
      return GetPageRoute(
        settings: settings,
        page: () => const HomePage(),
        // binding: DiaryBindding(),
        transition: Transition.fadeIn,
      );
    }
    
    if (settings.name == '/map') {
      return GetPageRoute(
        settings: settings,
        page: () => const Maps(),
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
        page: () => const Notify(),
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

  void onChangeItemBottomBar(int index) {
    if (currentIndex.value == index) return;
    currentIndex.value = index;
    Get.offAndToNamed(pages[index], id: 1);
  }

}
