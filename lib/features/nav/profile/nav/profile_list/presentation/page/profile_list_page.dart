import 'package:find_food/core/ui/widgets/card/profile_card.dart';
import 'package:find_food/features/nav/profile/nav/profile_list/presentation/controller/profile_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileListPage extends GetView<ProfileListController> {
  const ProfileListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 20, right: 10),
      itemBuilder: (context, index) {
        // return ProfileCard(
        //   postModel: controller.postList[index],
        // );
      },
      itemCount: 3,
    );
  }
}
