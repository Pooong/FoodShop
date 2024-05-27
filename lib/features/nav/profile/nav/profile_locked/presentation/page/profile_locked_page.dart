import 'package:find_food/features/nav/profile/nav/profile_locked/presentation/controller/profile_locked_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileLockedPage extends StatelessWidget {
  ProfileLockedPage({super.key});
  ProfileLockedController controller = Get.put(ProfileLockedController());
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Locked"),
    );
  }
}
