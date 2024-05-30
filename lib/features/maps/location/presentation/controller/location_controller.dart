import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

enum MapAction {
  zoomIn,
  zoomOut,
  resetZoom,
}

// Location Controller
class LocationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final MapController mapController = MapController();

  LatLng initialCenter = const LatLng(10.0323, 105.7682);

  TextEditingController searchController = TextEditingController();

  bool isSubmit = false;

  var labelMark = false.obs;

  var currentZoom = 16.0.obs;

  // var nameDisPlaceMarked
  Timer? debounce;

  var listLocationName = <dynamic>[];

  var tempValueSearch = [];

  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  // ============= CONTROL ZOOM-IN, ZOOM-OUT AND RETURN TO MARKER
  void performAction(MapAction action) {
    switch (action) {
      case MapAction.zoomIn:
        currentZoom.value++;
        _animatedMove(mapController.camera.center, currentZoom.value);
        break;
      case MapAction.zoomOut:
        currentZoom.value--;
        _animatedMove(mapController.camera.center, currentZoom.value);
        break;
      case MapAction.resetZoom:
        currentZoom.value = 16.0;
        _animatedMove(initialCenter, currentZoom.value);
        break;
    }
  }

  //============== SHOW MARKER NAME LOCAION DEFAULT STATUS IS HIDDEN
  void showMarker() {
    labelMark.value = !labelMark.value;
    update(["fetchMarkerLabel"]);
    Timer(const Duration(seconds: 3), () {
      // Hide the marker
      labelMark.value = false;
      update(["fetchMarkerLabel"]);
    });
  }

  //================= MOVE MARKER TO NEW LOCATION AND UPDATE MAP ====================================
  void updateMapLocation(LatLng newCenter) async {
    mapController.move(newCenter, mapController.camera.zoom);
    initialCenter = newCenter;
    update();
    resetSearch();
  }

  //======================  REST SEARCH ======================================
  void resetSearch() {
    listLocationName = [];
    searchController.text = "";
    isSubmit = false;
    update(['fetchSearchComment']);
  }

  //=====================  GET CURRENT LOCATION FUNCTION ===================================
  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, don't continue
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    LatLng currentLocation = LatLng(position.latitude, position.longitude);
    
    updateMapLocation(currentLocation);
  }

  // =========================== SEARCH FUNCTION ===============================
  Future<void> searchLocation(
      LocationController controller, String query) async {
    final response = await http.get(
      Uri.parse(
          'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=1'),
    );

    if (response.statusCode == 200) {
      final List results = json.decode(response.body);
      if (results.isNotEmpty) {
        final double lat = double.parse(results[0]['lat']);
        final double lon = double.parse(results[0]['lon']);
        tempValueSearch = results;
        updateMapLocation(LatLng(lat, lon));
      } else {
        //NOI DUNG KHONG TON TAI
      }
    } else {}
  }

  //==================== COMMENT SEARCH FUNCITON ==========================
  Future<void> commentSearch(
      LocationController controller, String query) async {
    final response = await http.get(
      Uri.parse(
          'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=1'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> results = json.decode(response.body);
      if (results.isNotEmpty) {
        tempValueSearch = results;
        listLocationName = results;
        update(['fetchSearchComment']);
      } else {
        listLocationName = [];
        update(['fetchSearchComment']);
      }
    } else {
      // Handle request failure
    }
  }

  //=============================== ANIMATION MOVE ============================
  void _animatedMove(LatLng destLocation, double destZoom) {
    final latTween = Tween<double>(
      begin: mapController.camera.center.latitude,
      end: destLocation.latitude,
    );
    final lngTween = Tween<double>(
      begin: mapController.camera.center.longitude,
      end: destLocation.longitude,
    );
    final zoomTween = Tween<double>(
      begin: mapController.camera.zoom,
      end: destZoom,
    );

    Animation<double> animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );

    animationController.addListener(() {
      mapController.move(
        LatLng(
          latTween.evaluate(animation),
          lngTween.evaluate(animation),
        ),
        zoomTween.evaluate(animation),
      );
    });

    animationController.forward(from: 0.0);
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
