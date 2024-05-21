import 'package:find_food/core/data/prefs/prefs.dart';
import 'package:find_food/features/nav/profile/presentation/controller/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Prefs(), fenix: true);

    Get.lazyPut(()=> ProfileController());

  }
}
