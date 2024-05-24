import 'package:find_food/features/restaurant/pressentation/model/food_model.dart';
import 'package:get/get.dart';

class RestaurantController extends GetxController {
  var menu = FoodModel.menu.obs;

  void updateFood(int index, FoodModel updatedFood) {
    var updatedMenu = List<FoodModel>.from(menu);
    updatedMenu[index] = updatedFood;
    menu.assignAll(updatedMenu);
  }
}
