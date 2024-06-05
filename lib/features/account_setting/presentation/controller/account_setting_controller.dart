import 'dart:convert';

import 'package:find_food/core/configs/prefs_constants.dart';
import 'package:find_food/core/data/prefs/prefs.dart';
import 'package:find_food/features/maps/domain/save_location_case.dart';
import 'package:find_food/features/maps/location/models/place_map.dart';
import 'package:get/get.dart';

class AccountSettingController extends GetxController {
  final SaveLoactionCase _saveLoactionCase;
  final Prefs _prefs;

  AccountSettingController(
    this._saveLoactionCase,
    this._prefs,
  );  

  PlaceMap? place;

  @override
  void onInit() {
    super.onInit();
    _loadLocation();
  }

  // Log out user and clear preferences
  static Future<void> logoutUser() async {
    final Prefs prefs = Prefs.preferences;
    await prefs.clear();
    Get.offAllNamed('/login');
  }

  Future<void> _loadLocation() async {
    final tokenJson = await _prefs.getObject(PrefsConstants.location);
    if (tokenJson.isNotEmpty) {
        place= PlaceMap.fromJson(json.decode(tokenJson));
    }
  }

  // Save the current location using SaveLoactionCase
  void saveLocation(PlaceMap place) {
    _saveLoactionCase.saveLocation(place ?? PlaceMap());
  }
  
}
