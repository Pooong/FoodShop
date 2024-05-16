import 'package:flutter/material.dart';
    
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