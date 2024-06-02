import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/ui/widgets/appbar/profile_appbar.dart';
import 'package:find_food/features/nav/profile/presentation/controller/profile_controller.dart';
import 'package:find_food/features/nav/profile/presentation/widgets/nav_controll_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppbar(),
      body: buildProfileBodyPage(),
    );
  }

  Widget buildProfileBodyPage() {
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
        Expanded(
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
  }

  Widget _buildUserInfo() {
    return SizedBox(
      height: Get.height * 0.36,
      child: Stack(
        children: [
          _buildBackground(),
          _buildAvatar_Name(),
        ],
      ),
    );
  }

  Container _buildBackground() {
    return Container(
          height: Get.height * 0.24,
          width: double.infinity,
          foregroundDecoration: const BoxDecoration(
            color: AppColors.white,
            image: DecorationImage(
              image: AssetImage('assets/images/img_banner_profile1.png'),
              fit: BoxFit.cover,
            ),
          ),
        );
  }

  Center _buildAvatar_Name() {
    return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PhysicalModel(
                color: Colors.transparent,
                shape: BoxShape.circle,
                elevation: 10.0,
                shadowColor: Colors.black54,
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 55,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/images/avatar.jpg',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "User name",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          ),
        );
  }
}
