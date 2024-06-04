import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/features/account_setting/nav/create_restaurant/presentation/controller/create_restaurant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class UploadSingleImage extends GetView<CreateRestaurantController> {
  final bool isLogo;

  const UploadSingleImage({Key? key, required this.isLogo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10.0,),
        Obx(() {
          File? image = isLogo ? controller.logoImage.value : controller.backgroundImage.value;
          return image != null
              ? Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: isLogo ? BoxShape.circle : BoxShape.rectangle,
                        borderRadius: isLogo ? null : BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.gray.withOpacity(0.1),
                          width: 2,
                        ),
                        image: DecorationImage(
                          image: FileImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () => controller.removeSingleImage(isLogo),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.gray.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : GestureDetector(
                  onTap: () {
                    controller.pickImage(isLogo);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: isLogo ? BoxShape.circle : BoxShape.rectangle,
                      borderRadius: isLogo ? null : BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.gray.withOpacity(0.1),
                        width: 2,
                      ),
                      color: AppColors.gray2,
                    ),
                    child: const Icon(
                      Icons.photo_camera_rounded,
                      size: 100,
                    ),
                  ),
                );
        }),
        const SizedBox(height: 10),
      ],
    );
  }
}
