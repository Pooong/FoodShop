import 'package:find_food/core/configs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildAppbarRestaurantChangeInfor extends StatelessWidget
    implements PreferredSizeWidget {
  const BuildAppbarRestaurantChangeInfor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5),
          child: Container(
            color: AppColors.primary,
            height: 5,
          )),
      title: Text("Restaurant Setting"),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
