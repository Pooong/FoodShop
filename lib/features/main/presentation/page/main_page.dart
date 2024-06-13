import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/configs/app_images_string.dart';
import 'package:find_food/core/extensions/color.dart';
import 'package:find_food/core/ui/widgets/nav/BottomNavigationBarWidget.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/features/main/presentation/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Navigator(
            key: Get.nestedKey(10),
            initialRoute: "/home",
            onGenerateRoute: controller.onGenerateRoute,
          ),
          Obx(() {
            return controller.isLoading.value
                ? _buildLoadingLocation(context)
                : const SizedBox();
          }),
        ],
      ),
      bottomNavigationBar:
          Obx(() => _bottomNavigationBar(controller.isLoading.value)),
    );
  }

  Widget _bottomNavigationBar(bool hidden) {
    return Obx(() {
      return BottomNavigationBarWidget(
        currentIndex: controller.currentIndex.value,
        onPageChanged: (index) {
          if (!hidden) controller.onChangeItemBottomBar(index);
        },
        allowSelect: !hidden,
      );
    });
  }

  Widget _buildLoadingLocation(BuildContext context) {
    return Visibility(
      visible: true,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(.4),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: CustomShadow.cardShadow,
                borderRadius: BorderRadius.circular(AppDimens.radius2)),
            padding: const EdgeInsets.all(10),
            constraints: BoxConstraints(
                maxHeight: Get.width * 0.7, maxWidth: Get.width * 0.6),
            child: Column(
              children: [
                Image.asset(AppImagesString.iFindLocation),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: TextWidget(
                    text: "Bật vị trí để trãi nghiệm app được tốt nhất !",
                    size: AppDimens.textSize14,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppDimens
                              .radius2), // Round the corners of the button
                        ),
                      ),
                      onPressed: () async {
                        try {
                          await controller.initializeLocation();
                        } catch (e) {
                          print("truong");
                        }
                      },
                      child: const TextWidget(
                        color: AppColors.white,
                        text: "Cance",
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppDimens
                              .radius2), // Round the corners of the button
                        ),
                      ),
                      onPressed: () async {
                        try {
                          await controller.initializeLocation();
                        } catch (e) {
                          print("truong");
                        }
                      },
                      child: const TextWidget(
                        color: AppColors.white,
                        text: "Get",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
