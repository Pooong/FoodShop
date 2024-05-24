import 'dart:ui';

import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/features/restaurant/pressentation/controller/restaurant_controller.dart';
import 'package:find_food/features/restaurant/pressentation/model/food_model.dart';
import 'package:find_food/features/restaurant/pressentation/widgets/card_menu_restaurant.dart';
import 'package:find_food/features/restaurant/pressentation/widgets/edit_modal_menu.dart';
import 'package:find_food/features/restaurant/pressentation/widgets/item_infor_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RestaurantPage extends GetView<RestaurantController> {
  const RestaurantPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Stack(clipBehavior: Clip.none, children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/img_banner_profile1.png'), // Đường dẫn đến ảnh trong assets
                      fit: BoxFit.cover, // Đặt ảnh vừa khít
                    ),
                  ),
                ),
                Positioned(
                  width: 350,
                  height: 90,
                  bottom: 0,
                  right: 0,
                  child: Container(
                      padding: const EdgeInsets.only(left: 140, bottom: 10),
                      color: Colors.white
                          .withOpacity(0.7), // Màu nền với độ mờ (opacity)
                      // padding: const EdgeInsets.only(
                      //      left: 130), // Thêm padding nếu cần thiết
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextWidget(
                            text: "RESTAURENT",
                            fontWeight: FontWeight.w700,
                            size: AppDimens.textSize22,
                            color: AppColors.primary,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Đảm bảo căn lề trái
                                  children: [
                                    TextWidget(
                                      size: AppDimens.textSize9,
                                      text: 'Email: ThanThan@gmail.com',
                                    ),
                                    TextWidget(
                                      size: AppDimens.textSize9,
                                      text: 'SDT: 0788836968',
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.facebook,
                                    size: AppDimens.textSize10,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.facebook,
                                    size: AppDimens.textSize10,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.facebook,
                                    size: AppDimens.textSize10,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                ),
                const Positioned(
                  bottom: -50,
                  left: 20,
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    radius: 75,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(
                        'assets/images/avatar.jpg',
                      ),
                    ),
                  ),
                ),
              ])
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextWidget(
                    text: "5.0",
                    size: AppDimens.textSize32,
                  ),
                  SizedBox(
                      width: 5.0), // Add spacing between elements (optional)
                  Row(
                    children: [
                      Icon(Icons.star,
                          color: Colors.amber, size: AppDimens.textSize26),
                      Icon(Icons.star,
                          color: Colors.amber, size: AppDimens.textSize26),
                      Icon(Icons.star,
                          color: Colors.amber, size: AppDimens.textSize26),
                      Icon(Icons.star,
                          color: Colors.amber, size: AppDimens.textSize26),
                      Icon(Icons.star,
                          color: Colors.amber, size: AppDimens.textSize26),
                    ],
                  ),
                  SizedBox(
                      width: 5.0), // Add spacing between elements (optional)
                  TextWidget(
                    text: "(300)",
                    size: AppDimens.textSize14,
                  ),
                  SizedBox(width: 15.0),
                ],
              ),
            ],
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.white, // Màu nền

              borderRadius: BorderRadius.circular(5.0), // Góc bo tròn
              boxShadow: const [
                // Bóng đổ
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1.0, 1.0),
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                )
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemInforProfile(quantity: 130, title: "Reviews"),
                ItemInforProfile(quantity: 130, title: "Post Relate"),
                ItemInforProfile(quantity: 130, title: "Saved"),
                ItemInforProfile(quantity: 130, title: "Liked"),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.white, // Màu nền

              borderRadius: BorderRadius.circular(5.0), // Góc bo tròn
              boxShadow: const [
                // Bóng đổ
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1.0, 1.0),
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                )
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: "OPENING",
                      fontWeight: FontWeight.bold,
                      size: AppDimens.textSize18,
                    ),
                    TextWidget(text: "7:00 - 23:00", size: AppDimens.textSize18)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      color: AppColors.black,
                      size: 25,
                    ),
                    TextWidget(
                      text: "Contact",
                      color: AppColors.primary,
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          buildGridOrders()
        ],
      ),
    );
  }

  // GridView buildGridOrders() {
  //   return GridView.builder(
  //     shrinkWrap: true,
  //     physics: const NeverScrollableScrollPhysics(),
  //     padding: const EdgeInsets.symmetric(horizontal: 20),
  //     itemCount: FoodModel.menu.length,
  //     itemBuilder: (BuildContext context, int index) {
  //       final foodmenu = FoodModel.menu[index];
  //       return CardMenuRestaurant(
  //         img: foodmenu.imageFood,
  //         foodname: foodmenu.foodName,
  //         pricefood: foodmenu.priceFood,
  //       );
  //     },
  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
  //   );
  // }

  // Widget buildGridOrders() {
  //   return Obx(() {
  //     return GridView.builder(
  //       shrinkWrap: true,
  //       physics: const NeverScrollableScrollPhysics(),
  //       padding: const EdgeInsets.symmetric(horizontal: 20),
  //       itemCount: controller.menu.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         final foodMenu = controller.menu[index];
  //         return CardMenuRestaurant(
  //           img: foodMenu.imageFood,
  //           foodname: foodMenu.foodName,
  //           pricefood: foodMenu.priceFood,
  //         );
  //       },
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //         crossAxisSpacing: 4.0,
  //         mainAxisSpacing: 4.0,
  //       ),
  //     );
  //   });
  // }

  Widget buildGridOrders() {
    return Obx(() {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: controller.menu.length,
        itemBuilder: (BuildContext context, int index) {
          final foodMenu = controller.menu[index];
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context)
                          .viewInsets
                          .bottom, // Đảm bảo widget được hiển thị trên bàn phím
                    ),
                    child: ListView(
                      shrinkWrap: true, // Giảm không gian cần thiết
                      children: [
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: EditFoodModal(food: foodMenu, index: index),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: CardMenuRestaurant(
              img: foodMenu.imageFood,
              foodname: foodMenu.foodName,
              pricefood: foodMenu.priceFood,
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
      );
    });
  }

  AppBar buildAppBar() {
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
      title: const TextWidget(
          text: 'RESTAURANT',
          color: AppColors.primary,
          fontWeight: FontWeight.bold),
      centerTitle: true,
    );
  }
}
