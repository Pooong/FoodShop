import 'package:find_food/core/data/prefs/prefs.dart';
import 'package:find_food/features/main/presentation/controller/main_controller.dart';
import 'package:get/get.dart';

class MainBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Prefs(), fenix: true);
    
    Get.lazyPut(() => MainController());
  }
}
