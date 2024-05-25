import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetLocationAppbar extends StatelessWidget implements PreferredSizeWidget {
  const GetLocationAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
          IconButton(onPressed: () {}, icon: const Icon(Icons.location_on)),
      title: const Text(
        "Set Restaurent Location",
        style: TextStyle(
            fontSize: AppDimens.textSize26, fontWeight: FontWeight.w500),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: AppColors.gray2, borderRadius: BorderRadius.circular(100)),
          child: IconButton(onPressed: () {Get.back();}, icon: const Icon(Icons.close)),
        )
      ],
    );
  }
  
  @override
  Size get preferredSize => AppBar().preferredSize;
}
