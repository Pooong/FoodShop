import 'dart:ui';

import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/widgets/appbar/restaurant_appbar.dart';
import 'package:find_food/core/ui/widgets/avatar/upload_avatar.dart';
import 'package:find_food/core/ui/widgets/loading/loading_data_page.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/features/control_restaurants/restaurant/pressentation/controller/restaurant_controller.dart';
import 'package:find_food/features/control_restaurants/restaurant/pressentation/model/food_model.dart';
import 'package:find_food/features/control_restaurants/restaurant/pressentation/widgets/card_menu_restaurant.dart';
import 'package:find_food/features/control_restaurants/restaurant/pressentation/widgets/edit_modal_menu.dart';
import 'package:find_food/features/control_restaurants/restaurant/pressentation/widgets/icon_button.dart';
import 'package:find_food/features/control_restaurants/restaurant/pressentation/widgets/item_infor_profile.dart';
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
      body: Obx(
        () =>
            controller.isLoading.value ? const LoadingDataPage() : buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            clipBehavior: Clip.none,
            children: [
              getWallpapper(),
              inforRestaurant(),
              iconButtonEditBackground(),
              Positioned(
                top: 200,
                left: 20,
                child: getAvatar(),
              ),
              Positioned(
                bottom: -50,
                right: 0,
                child: ratingRestaurant(),
              ),
            ],
          ),
          const SizedBox(height: 60),
          buildInfoSection(),
          const SizedBox(height: 10),
          buildContactSection(),
          const SizedBox(height: 10),
          buildAddressSection(),
          const SizedBox(height: 10),
          buildMenuSection(),
          const SizedBox(height: 10),
          // buildGridOrders()
        ],
      ),
    );
  }

  Widget buildInfoSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1.0, 1.0),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: ItemInforProfile(quantity: 130, title: "Reviews "),
          ),
          Flexible(
            child: ItemInforProfile(quantity: 130, title: "Post "),
          ),
          Flexible(
            child: ItemInforProfile(quantity: 130, title: "Saved"),
          ),
          Flexible(
            child: ItemInforProfile(quantity: 130, title: "Liked"),
          ),
        ],
      ),
    );
  }

  Widget buildContactSection() {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1.0, 1.0),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }

  Widget buildAddressSection() {
    return GetBuilder<RestaurantController>(
        id: "getInforRestaurant",
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1.0, 1.0),
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.location_on,
                      size: 30,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: TextWidget(
                      text: controller.addressRestaurant,
                      size: AppDimens.textSize18,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget buildMenuSection() {
    return Container(
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
              Get.toNamed('createmenu', arguments: controller.idRestaurant);
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
          ),
        ],
      ),
    );
  }

  Widget getWallpapper() {
    return GetBuilder<RestaurantController>(
      id: "getInforRestaurant",
      builder: (controller) {
        return Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(controller.backgroundUrl),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget getAvatar() {
    return GetBuilder<RestaurantController>(
      id: "getInforRestaurant",
      builder: (controller) {
        return GestureDetector(
          onTap: () => controller.selectImageAvatarGallery(),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 75,
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(controller.avatarUrl),
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: iconButton(
                      icon: Icons.edit,
                      onPressed: () {
                        controller.selectImageAvatarGallery();
                      })),
            ],
          ),
        );
      },
    );
  }

  Widget ratingRestaurant() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextWidget(
          text: "5.0",
          size: AppDimens.textSize32,
        ),
        SizedBox(width: 5.0),
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: AppDimens.textSize26),
            Icon(Icons.star, color: Colors.amber, size: AppDimens.textSize26),
            Icon(Icons.star, color: Colors.amber, size: AppDimens.textSize26),
            Icon(Icons.star, color: Colors.amber, size: AppDimens.textSize26),
            Icon(Icons.star, color: Colors.amber, size: AppDimens.textSize26),
          ],
        ),
        SizedBox(width: 5.0),
        TextWidget(
          text: "(300)",
          size: AppDimens.textSize14,
        ),
        SizedBox(width: 15.0),
      ],
    );
  }

  Widget iconButtonEditBackground() {
    return Positioned(
      top: 20,
      right: 10,
      child: iconButton(
        icon: Icons.edit,
        onPressed: () {
          controller.selectImageWallpaper();
        },
      ),
    );
  }

  Widget inforRestaurant() {
    return GetBuilder<RestaurantController>(
        id: "getInforRestaurant",
        builder: (controller) {
          return Positioned(
            width: Get.width * 0.88,
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 140, bottom: 10),
              color: Colors.white.withOpacity(0.7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: controller.nameRestaurant,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              size: AppDimens.textSize9,
                              text: "Email: ${controller.emailRestaurant}",
                            ),
                            TextWidget(
                              size: AppDimens.textSize9,
                              text: "SDT: ${controller.phoneRestaurant}",
                            ),
                          ],
                        ),
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.facebook,
                            size: AppDimens.textSize10,
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.facebook,
                            size: AppDimens.textSize10,
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.facebook,
                            size: AppDimens.textSize10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget buildGridOrders() {
    return GetBuilder<RestaurantController>(
        id: "getMenuOfRestaurant",
        builder: (controller) {
          return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.listFood.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return CardMenuRestaurant(
                  img: controller.listFood[index].imageFood.toString(),
                  foodname: controller.listFood[index].foodName.toString(),
                  pricefood: controller.listFood[index].priceFood.toString(),
                );
              });
        });
  }
}
