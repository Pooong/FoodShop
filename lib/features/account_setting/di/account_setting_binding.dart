import 'package:find_food/core/data/prefs/prefs.dart';
import 'package:find_food/features/account_setting/presentation/controller/account_setting_controller.dart';
import 'package:get/get.dart';

class AccountSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Prefs(), fenix: true);
    // Get.lazyPut(() => SaveUserUseCase(Get.find()));
    Get.lazyPut(() => AccountSettingController());
  }
}
