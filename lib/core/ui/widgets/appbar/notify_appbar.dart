import 'package:find_food/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
    
class NotifyAppbar extends StatelessWidget implements PreferredSizeWidget{
  const NotifyAppbar({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.notifySetting);
            },
            icon: const Icon(Icons.edit_notifications),
          ),
        ],
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(1.0), 
          child: Container(
            color: Colors.grey,
            height: 0.5, 
          ),
        ),
      ),
      
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}