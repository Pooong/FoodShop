import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemBottomBarWidget extends StatelessWidget {
  final String icon;

  final String title;
  final int index;
  final int currentIndex;
  final VoidCallback onTap;

  const ItemBottomBarWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 4.0),
              SvgPicture.asset(
                icon,
                height: 24.0,
                width: 24.0,
                color:
                    currentIndex == index ? AppColors.primary : AppColors.grey,
              ),
              const SizedBox(height: 8.0),
              TextWidget(
                text: title,
                fontWeight:
                    currentIndex == index ? FontWeight.w700 : FontWeight.w500,
                color:
                    currentIndex == index ? AppColors.primary : AppColors.grey,
                size: AppDimens.textSize14,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
