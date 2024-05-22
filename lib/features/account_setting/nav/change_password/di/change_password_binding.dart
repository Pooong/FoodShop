import 'package:find_food/core/data/prefs/prefs.dart';
import 'package:find_food/features/account_setting/nav/change_password/presentation/controller/change_password_controller.dart';
import 'package:get/get.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Prefs(), fenix: true);
    Get.lazyPut(()=> ChangePasswordController());
  }
}
