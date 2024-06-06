import 'package:find_food/features/maps/domain/get_location_case.dart';
import 'package:find_food/features/maps/location/models/place_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class LocationService extends GetxService {

  final GetLocationCase getLocationCase;

  LocationService(this.getLocationCase);

  Rx<PlaceMap?> place = Rx<PlaceMap?>(null);

  RxString? nameLocation;  

  LatLng? latLng;

  Future<PlaceMap?> getLocation() async {
      return await getLocationCase.getLocation();
    }

}
