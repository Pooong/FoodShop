import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/features/main/presentation/controller/main_controller.dart';
import 'package:fitness_tracker_app/features/main/presentation/widgets/item_bottom_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: "/diary",
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
            border: Border.all(
              width: 6,
              color: AppColors.white,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              "assets/icons/ic_clock.svg",
              height: 32.0,
              width: 32.0,
              color: AppColors.white,
            ),
          )),
    );
  }

  _bottomNavigationBar() {
    return Obx(() => Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: BottomAppBar(
              child: Container(
                  height: 60.0,
                  width: double.infinity,
                  color: AppColors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemBottomBarWidget(
                        icon: 'assets/icons/ic_diary.svg',
                        title: 'diary',
                        index: 0,
                        currentIndex: controller.currentIndex.value,
                        onTap: () {
                          controller.onChangeItemBottomBar(0);
                        },
                      ),
                      ItemBottomBarWidget(
                        icon: 'assets/icons/ic_exercise.svg',
                        title: 'exercise',
                        index: 1,
                        currentIndex: controller.currentIndex.value,
                        onTap: () {
                          controller.onChangeItemBottomBar(1);
                        },
                      ),
                      const SizedBox(
                        width: 64.0,
                      ),
                      ItemBottomBarWidget(
                        icon: 'assets/icons/ic_diary.svg',
                        title: 'Trang chủ',
                        index: 2,
                        currentIndex: controller.currentIndex.value,
                        onTap: () {
                          controller.onChangeItemBottomBar(2);
                        },
                      ),
                      ItemBottomBarWidget(
                        icon: 'assets/icons/ic_profile.svg',
                        title: 'profile',
                        index: 3,
                        currentIndex: controller.currentIndex.value,
                        onTap: () {
                          controller.onChangeItemBottomBar(3);
                        },
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }
}
