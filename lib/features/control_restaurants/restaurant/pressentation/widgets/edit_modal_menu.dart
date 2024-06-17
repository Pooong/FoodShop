import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:find_food/features/control_restaurants/restaurant/pressentation/controller/restaurant_controller.dart';
import 'package:find_food/features/control_restaurants/restaurant/pressentation/model/food_model.dart';

class EditFoodModal extends GetView<RestaurantController> {
  final FoodModel food;
  final int index;

  EditFoodModal({required this.food, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: controller.imageController,
            decoration: InputDecoration(labelText: 'Image URL'),
          ),
          TextField(
            controller: controller.nameController,
            decoration: InputDecoration(labelText: 'Food Name'),
          ),
          TextField(
            controller: controller.priceController,
            decoration: InputDecoration(labelText: 'Price'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              controller.updateFood(
                index,
                FoodModel(
                  controller.imageController.text,
                  controller.nameController.text,
                  controller.priceController.text,
                ),
              );
              Get.back();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
