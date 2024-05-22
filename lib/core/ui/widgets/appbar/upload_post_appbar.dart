import 'package:find_food/core/configs/app_dimens.dart';
import 'package:flutter/material.dart';
    
class UploadPostAppbar extends StatelessWidget implements PreferredSizeWidget  {

  const UploadPostAppbar({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Upload Post",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: AppDimens.textSize26),
        ),
        centerTitle: true, // Center the title
        toolbarHeight: 50,
        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(1.0), // Adjust the height of the bottom border
          child: Container(
            color: Colors.grey, // Border color
            height: .5, // Border height
          ),
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => AppBar().preferredSize;
}