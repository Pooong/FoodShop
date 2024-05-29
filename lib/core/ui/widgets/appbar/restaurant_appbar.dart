import 'package:find_food/core/configs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RestaurantAppbar extends StatelessWidget implements PreferredSizeWidget {
  const RestaurantAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(5.0), // Độ cao của border
        child: Container(
          color: AppColors.primary, // Màu của border
          height: 5.0, // Độ dày của border
        ),
      ),
      backgroundColor: AppColors.white,
      leading: IconButton(
        color: AppColors.primary,
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Get.back();
        },
      ),
      title: const Text(
        "RESTAURANT",
        style: TextStyle(color: AppColors.primary),
      ),
      centerTitle: true,
    );
    ;
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
