import 'package:find_food/core/ui/widgets/card/explore_food_card.dart';
import 'package:find_food/features/nav/profile/nav/profile_list/presentation/controller/profile_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileListPage extends StatelessWidget {
  ProfileListPage({super.key});
  ProfileListController profileListController =
      Get.put(ProfileListController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: GridView.count(
        crossAxisCount: 2, // Số cột trong GridView
        crossAxisSpacing: 10, // Khoảng cách ngang giữa các ô
        mainAxisSpacing: 10, // Khoảng cách dọc giữa các ô
        children: [
          for (var i = 1; i <= 20; i++) const ExploreFoodCard(),
        ],
      ),
    );
  }
}
