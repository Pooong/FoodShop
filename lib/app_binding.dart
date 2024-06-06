import 'package:find_food/core/data/prefs/prefs.dart';
import 'package:find_food/core/services/location_service.dart';
import 'package:find_food/features/maps/domain/get_location_case.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    final Prefs prefs = Prefs();
    final GetLocationCase getLocationCase = GetLocationCase(prefs);
    Get.put(getLocationCase);
    Get.put(LocationService(getLocationCase));
  }
}
