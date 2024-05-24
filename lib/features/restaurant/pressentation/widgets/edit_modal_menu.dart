import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:find_food/features/restaurant/pressentation/controller/restaurant_controller.dart';
import 'package:find_food/features/restaurant/pressentation/model/food_model.dart';

class EditFoodModal extends StatelessWidget {
  final FoodModel food;
  final int index;

  EditFoodModal({required this.food, required this.index});

  final TextEditingController imageController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final RestaurantController controller = Get.find();

    imageController.text = food.imageFood;
    nameController.text = food.foodName;
    priceController.text = food.priceFood;

    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: imageController,
            decoration: InputDecoration(labelText: 'Image URL'),
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Food Name'),
          ),
          TextField(
            controller: priceController,
            decoration: InputDecoration(labelText: 'Price'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              controller.updateFood(
                index,
                FoodModel(
                  imageController.text,
                  nameController.text,
                  priceController.text,
                ),
              );
              Get.back();
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
