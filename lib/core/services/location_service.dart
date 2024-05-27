import 'package:find_food/features/maps/location/models/place.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      // Location services are not enabled, do not continue
      return Future.error('Location services are disabled.');
    }

    // Check and request permission
    permission = await checkLocationPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are denied');
    }

    // When we reach here, permissions are granted, and we can get the position
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  static Future<LocationPermission> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return permission;
  }

  static Future<void> openAppSettings() async {
    await Geolocator.openAppSettings();
  }

  static Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  static Future<List<Place>> getPlacemarksFromPosition(
      Position position) async {
    List<Place> listPlace = [];
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      placemarks.forEach((placeMark) {
        listPlace.add(Place.fromPlacemarkAndLocation(
            placeMark,
            Location(
              latitude: position.latitude,
              longitude: position.longitude,
              timestamp: position.timestamp,
            )));
      });
      return listPlace;
    } catch (e) {
      print('Error occurred while getting placemarks: $e');
      return [];
    }
  }

  static Future<Location> getLocationFromPosition(Position position) async {
    // Simply convert Position to Location as they both contain latitude and longitude
    return Location(
      latitude: position.latitude,
      longitude: position.longitude,
      timestamp: position.timestamp,
    );
  }
}
