import 'package:find_food/core/data/prefs/prefs.dart';
import 'package:get/get.dart';

class AccountSettingController extends GetxController {

  static Future<void> logoutUser() async {
    final Prefs prefs = Prefs.preferences;
    await prefs.clear();
    Get.offAllNamed(
        '/login'); 
  }
}
