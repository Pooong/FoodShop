import 'package:find_food/core/data/prefs/prefs.dart';
import 'package:find_food/features/nav/notify/nav/notify_setting/presentation/controller/notify_setting_controller.dart';
import 'package:get/get.dart';

class NotifySettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Prefs(), fenix: true);
    // Get.lazyPut(() => SaveUserUseCase(Get.find()));
    Get.lazyPut(() => NotifySettingController());
  }
}
