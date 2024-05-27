import 'package:find_food/core/ui/widgets/appbar/profile_appbar.dart';
import 'package:find_food/features/nav/profile/presentation/controller/profile_controller.dart';
import 'package:find_food/features/nav/profile/presentation/widgets/nav_controll_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileController());

    return Scaffold(
      appBar: const ProfileAppbar(),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildUserInfo(context),
              const SizedBox(
                height: 10.0,
              ),
              Obx(() => NavControllList(
                    currentIndex: controller.currentIndex.value,
                    onPageChanged: (index) {
                      controller.onChangeNavList(index);
                    },
                  )),
              // Expanded(
              //   child: Navigator(
              //     key: Get.nestedKey(3),
              //     initialRoute: "/profile_list",
              //     onGenerateRoute: controller.onGenerateRoute,
              //   ),
              // ),
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
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.28,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/home.png",
            fit: BoxFit.cover,
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/author.jpg'),
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
          ),
        ],
      ),
    );
  }
}
