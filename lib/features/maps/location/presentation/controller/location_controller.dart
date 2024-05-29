import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';



enum MapAction {
  zoomIn,
  zoomOut,
  resetZoom,
}

// Location Controller
class LocationController extends GetxController with GetSingleTickerProviderStateMixin {
  final MapController mapController = MapController();
  final LatLng initialCenter = const LatLng(10.0323, 105.7682);

  var labelMark=false.obs;
  var currentZoom = 16.0.obs;

  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }



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

  void showMarker(){
    labelMark.value= !labelMark.value;
    update(["fetchMarkerLabel"]);
    Timer(const Duration(seconds: 3), () {
    // Hide the marker
    labelMark.value = false;
    update(["fetchMarkerLabel"]);
  });
  }


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
    // Dispose the animation controller when the controller is closed
    animationController.dispose();
    super.onClose();
  }
  
}
