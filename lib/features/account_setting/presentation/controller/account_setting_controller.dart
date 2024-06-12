
import 'package:find_food/core/data/prefs/prefs.dart';
import 'package:find_food/features/maps/domain/get_location_case.dart';
import 'package:find_food/features/maps/domain/save_location_case.dart';
import 'package:find_food/features/maps/location/models/place_map.dart';
import 'package:get/get.dart';

class AccountSettingController extends GetxController {
  final SaveLoactionCase _saveLoactionCase;
  final GetLocationCase _getLocationCase;
  
  AccountSettingController(this._saveLoactionCase, this._getLocationCase);

  PlaceMap? place;

  String locationName = "";

  @override
  void onInit() async{
    super.onInit();
    await _loadLocation();
  }

  _loadLocation() async {
    place = await _getLocationCase.getLocation();
    locationName = place?.displayName??"Add or change your location";
    update(['fetchLocaiton']);
  }

  // Log out user and clear preferences
  static Future<void> logoutUser() async {
    final Prefs prefs = Prefs.preferences;
    await prefs.clear();
    Get.offAllNamed('/login');
  }

  // Save the current location using SaveLoactionCase
  void saveLocation(PlaceMap place) async {
    _saveLoactionCase.saveLocation(place);
    await _loadLocation();
    update(['fetchLocaiton']);
  }
}
