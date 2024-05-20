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
      body: Column(
        children: <Widget>[
          _buildUserInfo(context),
          Obx(() => NavControllList(
                currentIndex: controller.currentIndex.value,
                onPageChanged: (index) {
                  controller.onChangeNavList(index);
                },
              )),
          Expanded(
            child: Navigator(
              key: Get.nestedKey(3),
              initialRoute: "/profile_list",
              onGenerateRoute: controller.onGenerateRoute,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return  SizedBox(
      // height: MediaQuery.of(context).size.height * 0.2,
      height: Get.height * 0.25,
      child:  const Row (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
              ),
              SizedBox(height: 20),
              Text(
                "User name",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
