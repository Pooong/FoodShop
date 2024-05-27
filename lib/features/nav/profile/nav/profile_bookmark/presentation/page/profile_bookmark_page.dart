import 'package:find_food/features/nav/profile/nav/profile_bookmark/presentation/controller/profile_bookmark_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileBookmarkPage extends StatelessWidget {
  ProfileBookmarkPage({super.key});
  ProfileBookmarkController controller = Get.put(ProfileBookmarkController());
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Bookmark"),
    );
  }
}
