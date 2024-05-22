import 'package:find_food/core/data/prefs/prefs.dart';
import 'package:find_food/features/restaurant/pressentation/controller/restaurant_controller.dart';
import 'package:get/get.dart';

class RestaurantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Prefs(), fenix: true);

    // Get.lazyPut(() => RestaurantController());
  }
}
