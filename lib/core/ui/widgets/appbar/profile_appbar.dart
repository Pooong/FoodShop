import 'package:flutter/material.dart';
import 'package:get/get.dart';
    
class ProfileAppbar extends StatelessWidget implements PreferredSizeWidget{

  const ProfileAppbar({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/accountSetting");
            },
            icon: const Icon(Icons.settings),
          ),
        ],
        centerTitle: true,
      ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}