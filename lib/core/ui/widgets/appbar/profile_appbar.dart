import 'package:flutter/material.dart';
import 'package:get/get.dart';
    
class ProfileAppbar extends StatelessWidget implements PreferredSizeWidget{

  const ProfileAppbar({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              Get.offNamed("/accountSetting");
            },
            icon: Icon(Icons.settings),
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