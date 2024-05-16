import 'package:find_food/core/ui/widgets/appbar/profile_appbar.dart';
import 'package:find_food/features/nav/profile/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppbar(),
      body: Column(
        children: <Widget>[
          _buildUserInfo(),
          
        ],
      ),
    );
  }
}

Widget _buildUserInfo() {
  return Container(
    height: 200,
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Column(
          children: [
            CircleAvatar(
              radius: 60,
            ),
            const SizedBox(height: 20),
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

