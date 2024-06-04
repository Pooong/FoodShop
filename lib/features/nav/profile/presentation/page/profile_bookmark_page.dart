import 'package:find_food/core/ui/widgets/card/profile_card.dart';
import 'package:find_food/features/nav/profile/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

class ProfileBookmarkPage extends GetView<ProfileController> {
  ProfileBookmarkPage({super.key});
  // ProfileBookmarkController controller = Get.put(ProfileBookmarkController());
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.5),
        itemBuilder: (context, index) {
          return ProfileCard();
        }
    );
  }
}
