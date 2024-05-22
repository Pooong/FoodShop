import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/features/restaurant/pressentation/controller/restaurant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantPage extends GetView<RestaurantController> {
  const RestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(5.0), // Độ cao của border
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
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/wallpaper.jpg'), // Đường dẫn đến ảnh trong assets
                    fit: BoxFit.cover, // Đặt ảnh vừa khít
                  ),
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
