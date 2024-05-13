import 'package:fitness_tracker_app/features/nav/diary/di/diary_binding.dart';
import 'package:fitness_tracker_app/features/nav/diary/presentation/page/diary_page.dart';
import 'package:fitness_tracker_app/features/nav/exercise/di/type_exercise_binding.dart';
import 'package:fitness_tracker_app/features/nav/exercise/presentation/page/type_exercise_page.dart';
import 'package:fitness_tracker_app/features/nav/profile/di/profile_binding.dart';
import 'package:fitness_tracker_app/features/nav/profile/presentation/page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final pages = <String>['/diary', '/exercise', '/result', '/profile'];
  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/diary') {
      return GetPageRoute(
        settings: settings,
        page: () => const DiaryPage(),
        binding: DiaryBindding(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/exercise') {
      return GetPageRoute(
        settings: settings,
        page: () => const TypeExercisePage(),
        binding: TypeExerciseBindding(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/result') {
      return GetPageRoute(
        settings: settings,
        page: () => Container(),
        // binding: MyLibraryBinding(),
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
    Get.offAndToNamed(pages[index], id: 1);
  }
}
