import 'package:find_food/core/data/prefs/prefs.dart';
import 'package:find_food/features/nav/profile/nav/profile_list/presentation/controller/profile_list_controller.dart';
import 'package:get/get.dart';

class ProfileListBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Prefs(), fenix: true);
    Get.lazyPut(() => ProfileListController());
  }
}
