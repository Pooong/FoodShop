import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:find_food/core/data/prefs/prefs.dart';

class AccountSettingController extends GetxController {
  final Prefs _prefs = Prefs.preferences;

  Route? onGenerateRoute(Route setting) {
    return null;
  }

  static Future<void> logoutUser() async {
    final Prefs prefs = Prefs.preferences;
    await prefs.clear();
    Get.offAllNamed(
        '/login'); 
  }
}
