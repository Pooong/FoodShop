// ignore: camel_case_types
import 'package:find_food/core/configs/app_colors.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.authorImg,
  });

  final String? authorImg;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
          width: 45,
          height: 45,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
