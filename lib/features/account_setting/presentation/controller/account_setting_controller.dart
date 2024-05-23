
import 'package:find_food/core/data/prefs/prefs.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:find_food/core/configs/prefs_constants.dart';
import 'package:find_food/core/data/prefs/prefs.dart';
//import 'package:find_food/features/auth/user/model/user_model.dart';

class AccountSettingController extends GetxController {
  Route? onGenerateRoute(Route setting) {
    return null;
  }

  static Future<void> logoutUser() async {
    final Prefs prefs = Prefs.preferences;
    await prefs.clear();
    Get.offAllNamed('/login');
  }
}
