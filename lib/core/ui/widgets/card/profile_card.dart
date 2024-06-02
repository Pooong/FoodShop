import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(1, 2),
          )
        ],
      ),
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/img_banner_profile1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: IconCardProfile(),
          ),
        ],
      ),
    );
  }

  Widget IconCardProfile() {
    return Row(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.colorPink,
              ),
              child: const Icon(
                Icons.favorite,
                color: AppColors.white,
                size: 20,
              ),
            ),
            const TextWidget(text: "12", color: AppColors.white),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.transparent,
              ),
              child: const Icon(
                Icons.message, 
                color: AppColors.white,
                size: 25,
              ),
            ),
            const TextWidget(text: "12", color: AppColors.white),
          ],
        ),
      ],
    );
  }
}
