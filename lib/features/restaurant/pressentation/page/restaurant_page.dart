import 'dart:ui';

import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/widgets/appbar/restaurant_appbar.dart';
import 'package:find_food/core/ui/widgets/avatar/upload_avatar.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/features/restaurant/pressentation/controller/restaurant_controller.dart';
import 'package:find_food/features/restaurant/pressentation/model/food_model.dart';
import 'package:find_food/features/restaurant/pressentation/widgets/card_menu_restaurant.dart';
import 'package:find_food/features/restaurant/pressentation/widgets/edit_modal_menu.dart';
import 'package:find_food/features/restaurant/pressentation/widgets/icon_button.dart';
import 'package:find_food/features/restaurant/pressentation/widgets/item_infor_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RestaurantPage extends GetView<RestaurantController> {
  const RestaurantPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RestaurantAppbar(),
      body: buildBody(),
    );
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(clipBehavior: Clip.none, children: [
            getWallpapper(),
            Positioned(
              width: Get.width * 0.88,
              // height: Get.height * 0.1,
              bottom: 0,
              right: 0,
              child: Container(
                  padding: const EdgeInsets.only(left: 140, bottom: 10),
                  color: Colors.white.withOpacity(0.7),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextWidget(
                        text: "RESTAURANT",
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
            Positioned(
              bottom: -50,
              left: 20,
              child: Stack(
                children: [
                  getAvatar(),
                  Positioned(
                    bottom: 0,
                    child: iconButton(
                      icon: Icons.edit,
                      onPressed: () {
                        controller.selectImageAvatarGallery();
                      },
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                top: 20,
                right: 10,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle, // Hình dạng của nút
                  ),
                  child: iconButton(
                    icon: Icons.edit,
                    onPressed: () {
                      controller.selectImageWallpaper();
                    },
                  ),
                )),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                width: 40,
              ),
              const Spacer(),
              const Row(
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
            height: 100,
            padding: const EdgeInsets.all(20),
            margin:
                const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
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
                ItemInforProfile(quantity: 130, title: "Post "),
                ItemInforProfile(quantity: 130, title: "Saved"),
                ItemInforProfile(quantity: 130, title: "Liked"),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
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
                Flexible(
                    flex: 1,
                    child: Icon(
                      Icons.location_on,
                      size: 30,
                      color: Colors.red,
                    )),
                Flexible(
                  flex: 8,
                  child: TextWidget(
                      text:
                          "27A - Đường 30 tháng 4 - Hưng Lợi - Ninh Kiều - Cần Thơ",
                      size: AppDimens.textSize18),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            // height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget(
                  text: "Menu",
                  color: AppColors.red,
                ),
                GestureDetector(
                  onTap: () {
                    print("Oke");
                  },
                  child: const Row(
                    children: [
                      TextWidget(text: "Add Food"),
                      SizedBox(width: 5),
                      Image(
                        image: AssetImage('assets/icons/ic_add_foodmenu.png'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          buildGridOrders()
        ],
      ),
    );
  }

  // Widget getAvatar() {
  //   return GetBuilder<RestaurantController>(
  //     id: "updateAvatar",
  //     builder: (id) {
  //       return CircleAvatar(
  //         backgroundColor: AppColors.white,
  //         radius: 75,
  //         child: CircleAvatar(
  //           radius: 70,
  //           backgroundImage: controller.imgAvatar == null
  //               ? AssetImage('assets/images/avatar.jpg')
  //               : FileImage(controller.imgAvatar!) as ImageProvider,
  //         ),
  //       );
  //     },
  //   );
  // }

  Widget getWallpapper() {
    return GetBuilder<RestaurantController>(
      id: "updateWallpaper",
      builder: (id) {
        return Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: controller.imgWallpapper == null
                  ? const AssetImage('assets/images/avatar.jpg')
                  : FileImage(controller.imgWallpapper!) as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget buildGridOrders() {
    return Obx(() {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        // itemCount: controller.menu.length,
        itemCount: controller.itemsToShow.value <= controller.menu.length
            ? controller.itemsToShow.value + 1
            : controller.itemsToShow.value,

        itemBuilder: (BuildContext context, int index) {
          if (index == controller.itemsToShow.value) {
            // print(index);
            return GestureDetector(
              onTap: controller.seeMore,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextWidget(
                  textAlign: TextAlign.start,
                  text: "See More",
                  color: AppColors.blue,
                  size: AppDimens.textSize18,
                ),
              ),
            );
          } else {
            final foodMenu = controller.menu[index];
            // print(index);

            return GestureDetector(
              onTap: () {
                controller.inforCard(foodMenu);
                // print(controller.menu[index].foodName);
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
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child:
                                  EditFoodModal(food: foodMenu, index: index),
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
          }
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
      );
    });
  }

  // AppBar buildAppBar() {
  //   return AppBar(
  //     bottom: PreferredSize(
  //       preferredSize: const Size.fromHeight(5.0),
  //       child: Container(
  //         color: AppColors.primary,
  //         height: 5.0,
  //       ),
  //     ),
  //     backgroundColor: AppColors.white,
  //     leading: IconButton(
  //       color: AppColors.primary,
  //       icon: const Icon(Icons.arrow_back_ios),
  //       onPressed: () {
  //         Get.back();
  //       },
  //     ),
  //     title: const TextWidget(
  //         text: 'RESTAURANT',
  //         color: AppColors.primary,
  //         fontWeight: FontWeight.bold),
  //     centerTitle: true,
  //     actions: [
  //       iconButton(
  //           icon: Icons.settings,
  //           onPressed: () {
  //             Get.toNamed('restaurantsetting');
  //           })
  //     ],
  //   );
  // }
}
