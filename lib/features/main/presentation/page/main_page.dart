import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/features/main/presentation/controller/main_controller.dart';
import 'package:find_food/widgets/BottomNavigationBarWidget.dart';
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
    return Obx(
      () => BottomNavigationBarWidget(
        currentIndex: controller.currentIndex.value,
        onPageChanged: (index) {
          controller.currentIndex.value = index;
        },
      ),
    );
  }
}
