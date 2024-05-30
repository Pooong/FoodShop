// ignore: camel_case_types
import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_images_string.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double width;
  final double height;

  const Avatar({
    super.key,
    this.authorImg = AppImagesString.iUserDefault, 
    required this.width,
    required this.height,
  });

  final String? authorImg;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: AppColors.white, width: 2),
          boxShadow: [
            BoxShadow(
                color: AppColors.black.withOpacity(.2),
                blurRadius: 1,
                spreadRadius: 1)
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10000),
        child: Image.asset(
          authorImg!,
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
