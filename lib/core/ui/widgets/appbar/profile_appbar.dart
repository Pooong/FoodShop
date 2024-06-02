import 'package:find_food/core/configs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/accountSetting");
            },
            icon: const Icon(Icons.settings),
          ),
        ],
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: AppColors.primary,
            height: 2.0,
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}
