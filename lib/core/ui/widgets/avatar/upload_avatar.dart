import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/features/restaurant/pressentation/controller/restaurant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class getAvatar extends GetView<RestaurantController> {
  const getAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantController>(
      id: "updateAvatar",
      builder: (id) {
        return CircleAvatar(
          backgroundColor: AppColors.white,
          radius: 75,
          child: CircleAvatar(
            radius: 70,
            backgroundImage: controller.imgAvatar == null
                ? AssetImage('assets/images/avatar.jpg')
                : FileImage(controller.imgAvatar!) as ImageProvider,
          ),
        );
      },
    );
  }
}
