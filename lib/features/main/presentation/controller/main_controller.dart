import 'package:find_food/views/pages/HomePage.dart';
import 'package:find_food/views/pages/Maps.dart';
import 'package:find_food/views/pages/Notify.dart';
import 'package:find_food/views/pages/Post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final pages = <String>['/diary', '/exercise', '/result', '/profile'];
  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/diary') {
      return GetPageRoute(
        settings: settings,
        page: () => const HomePage(),
        // binding: DiaryBindding(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/exercise') {
      return GetPageRoute(
        settings: settings,
        page: () => const Maps(),
        // binding: TypeExerciseBindding(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/result') {
      return GetPageRoute(
        settings: settings,
        page: () => Post(),
        // binding: MyLibraryBinding(),
        transition: Transition.fadeIn,
      );
    }
    if (settings.name == '/profile') {
      return GetPageRoute(
        settings: settings,
        page: () => const Notify(),
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
