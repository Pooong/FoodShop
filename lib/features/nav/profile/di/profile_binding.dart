import 'package:find_food/core/data/prefs/prefs.dart';
import 'package:find_food/features/nav/profile/presentation/controller/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBindding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => Prefs(), fenix: true);
<<<<<<< HEAD
    Get.lazyPut(() => ProfileController());
=======

    Get.lazyPut(()=> ProfileController());

>>>>>>> f0abbd31b4d6e30f394e5d0a58dd1e85a8f39ccb
  }
}
