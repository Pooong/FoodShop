import 'package:find_food/core/data/prefs/prefs.dart';
import 'package:find_food/features/account_setting/nav/setting_information/presentation/controller/setting_information_controller.dart';
import 'package:get/get.dart';

class SettingInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Prefs(), fenix: true);
    // Get.lazyPut(() => SaveUserUseCase(Get.find()));
    Get.lazyPut(() => SettingInformationController());
  }
}
