import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_images_string.dart';
import 'package:find_food/core/ui/widgets/appbar/profile_appbar.dart';
import 'package:find_food/features/nav/profile/presentation/controller/profile_controller.dart';
import 'package:find_food/features/nav/profile/presentation/widgets/nav_controll_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppbar(),
      body: buildProfileBodyPage(),
    );
  }

  Widget buildProfileBodyPage() {
    return SingleChildScrollView(
      child: GetBuilder<ProfileController>(
        id: "fetchDataProfilePage",
        builder: (_) {
          return Column(
            children: <Widget>[
              _buildUserInfo(),
              const SizedBox(
                height: 10.0,
              ),
              Obx(() => NavControllList(
                    currentIndex: controller.currentIndex.value,
                    onPageChanged: (index) {
                      controller.onChangeNavList(index);
                    },
                  )),
              SizedBox(
                height: Get.height * 0.6,
                width: double.infinity,
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: (index) {
                    controller.onChangePage(index);
                  },
                  children: controller.getPages(),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildUserInfo() {
    return SizedBox(
      height: Get.height * 0.36,
      child: Stack(
        children: [
          _buildBackground(),
          _buildAvatarAndName(),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return GestureDetector(
      onTap: () {
        controller.selectImageBackground();
      },
      child: GetBuilder<ProfileController>(
        id: "updateBackground",
        builder: (_) {
          return Container(
            height: Get.height * 0.24,
            width: double.infinity,
            foregroundDecoration: BoxDecoration(
              color: AppColors.white,
              image: DecorationImage(
                image: controller.imgBackground == null
                    ? const AssetImage(AppImagesString.iBackgroundUserDefault)
                    : FileImage(controller.imgBackground!) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAvatarAndName() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              controller.selectImageAvatar();
            },
            child: GetBuilder<ProfileController>(
              id: "updateAvatar",
              builder: (_) {
                return PhysicalModel(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  elevation: 10.0,
                  shadowColor: Colors.black54,
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    radius: 55,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: controller.imgAvatar == null
                          ? const AssetImage(AppImagesString.iUserDefault)
                          : FileImage(controller.imgAvatar!) as ImageProvider,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            controller.user?.displayName ??
                controller.user?.email ??
                "Unknown user",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }
}
