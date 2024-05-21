import 'package:flutter/material.dart';
import 'package:get/get.dart';
    
class NotifyAppbar extends StatelessWidget implements PreferredSizeWidget{
  const NotifyAppbar({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notify"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/notifySetting");
            },
            icon: const Icon(Icons.edit_notifications),
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