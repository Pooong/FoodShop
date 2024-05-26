import 'dart:async';

import 'package:find_food/core/services/location_service.dart';
import 'package:find_food/features/maps/location/models/place.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class Deley {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Deley({required this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(microseconds: milliseconds), action);
  }
}

class LocationController extends GetxController {
  List<Place> places = [];

  var addressController = TextEditingController();

  final _deley = Deley(milliseconds: 500);
  final debounceDelay = const Duration(milliseconds: 1000);
  Timer? _debounceTimer;
  final _controller = StreamController<List<Place>>.broadcast();
  Stream<List<Place>> get controllerOut =>
      _controller.stream.asBroadcastStream();

  StreamSink<List<Place>> get controllerIn => _controller.sink;
  final dataArgument = Get.arguments;
  RxBool isLoading = false.obs;
  @override
  void onInit() {}

  onTextChange(String value) {
    if (_debounceTimer != null && _debounceTimer!.isActive) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(debounceDelay, () {
      if (value.isNotEmpty) {
        handleSearch(value);
      } else {
        // places.clear();
        clearPlaces();
      }
    });
  }

  addPlace(Place place) {
    places.add(place);
    controllerIn.add(places);
  }

  handleSearch(String query) async {
    if (query.isNotEmpty) {
      _deley.run(() async {
        try {
          // Kiểm tra quyền truy cập vị trí trước khi thực hiện tìm kiếm
          LocationPermission permission =
              await LocationService.checkLocationPermission();
          if (permission == LocationPermission.denied ||
              permission == LocationPermission.deniedForever) {
            print('Quyền truy cập vị trí bị từ chối');
            return;
          }
          List<Location> locations = await locationFromAddress(query);
          places.clear();
          locations.forEach((location) async {
            List<Placemark> placeMarks = await placemarkFromCoordinates(
                location.latitude, location.longitude);
            placeMarks.forEach((placeMark) {
              addPlace(
                Place.fromPlacemarkAndLocation(placeMark, location),
              );
            });
          });
        } on Exception catch (e) {
          print(e);
        }
      });
    } else {
      places.clear();
    }
  }

  @override
  void onClose() {
    super.onClose();
    _controller.close();
  }

  onSelectPlace(Place place) {
    Get.back(result: place);
  }

  getCurrentPosition() async {
    // isLoading.value = true;
    Position position = await LocationService.getCurrentLocation();
    places = await LocationService.getPlacemarksFromPosition(position);
    // isLoading.value = false;
    controllerIn.add(places);
  }

  void clearPlaces() {
    places.clear();
    controllerIn.add(List<Place>.from(
        places)); // Sử dụng danh sách mới để kích hoạt cập nhật stream
  }

  @override
  void onReady() {
    if (dataArgument != null && dataArgument is Place) {
      addPlace(dataArgument);
    }
  }
}
