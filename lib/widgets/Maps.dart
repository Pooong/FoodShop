// ignore: file_names
import 'dart:async';

import 'package:find_food/consts.dart';
import 'package:find_food/widgets/MeaSureDistans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class Maps extends StatefulWidget {
  const Maps({super.key});
  @override
  State<Maps> createState() => MapsState();
}


class MapsState extends State<Maps> {
  final Location _locationController = Location();

  static const LatLng _pCanThoUniversity = LatLng(10.0323,
      105.7682); // this is latitude and longitude of can tho university
  static const LatLng _pCanthoCollege = LatLng(
      10.01579, 105.76591); // this latitude and longtitude of can tho college

  LatLng? _currentP;

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    getLocationUpdates().then((_) => {
          // ignore: non_constant_identifier_names
          getPolylinePoint().then((Coordinates) => {
                print(Coordinates),
              }),
        });
  }

  @override
  Widget build(BuildContext context) {                     
    return Stack(
      children: [
        _currentP == null
        ? const Center(
            child: Text("Loading ..."),
          )
        : 
        GoogleMap(
                onMapCreated: ((GoogleMapController controller) =>
                    _mapController.complete(controller)),
                initialCameraPosition:
                    const CameraPosition(target: _pCanThoUniversity, zoom: 15),
                markers: {
                  Marker(
                      markerId: const MarkerId('_currentLocation'),
                      icon: BitmapDescriptor.defaultMarker,
                      position: _currentP!),
                  const Marker(
                      markerId: MarkerId('_sourcetLocation'),
                      icon: BitmapDescriptor.defaultMarker,
                      position: _pCanThoUniversity),
                  const Marker(
                      markerId: MarkerId('_destionationLocation'),
                      icon: BitmapDescriptor.defaultMarker,
                      position: _pCanthoCollege),
                },
              ),
    
        ElevatedButton(onPressed: getCurrentLocation, child:const Text("get current location"))
      ],
    );
  }



  Future<void> _cameraTopPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition newCameraPosition = CameraPosition(
      target: pos,
      zoom: 15,
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(newCameraPosition),
    );
  }

  Future<void> getLocationUpdates() async {
    bool serviceEnabled;

    PermissionStatus permissionGranted;

    serviceEnabled = await _locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraTopPosition(_currentP!);
          String distance = MeaSureDistans.calculateDistance(_pCanThoUniversity.latitude, _pCanThoUniversity.longitude, _pCanthoCollege.latitude, _pCanthoCollege.longitude);
          print("The distance between the two locations is $distance.");
        });
      }
    });
  }

  Future<List<LatLng>> getPolylinePoint() async {
    List<LatLng> polylineCoordinates = [];
    try {
      PolylinePoints polylinePoints = PolylinePoints();
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        GOOGLE_MAPS_API_KEY,
        PointLatLng(_pCanThoUniversity.latitude, _pCanThoUniversity.longitude),
        PointLatLng(_pCanthoCollege.latitude, _pCanthoCollege.longitude),
        travelMode: TravelMode.driving,
      );

      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      } else {
        print(result.errorMessage);
        // Xử lý tình huống không có điểm trả về từ API
        // Ví dụ: Hiển thị thông báo cho người dùng
      }
    } catch (e) {
      print('Đã xảy ra lỗi: $e');
      // Xử lý ngoại lệ, ví dụ: Hiển thị thông báo lỗi cho người dùng
    }
    return polylineCoordinates;
  }

  void getCurrentLocation() async {
    geo.Position position = await geo.Geolocator.getCurrentPosition(
        desiredAccuracy: geo.LocationAccuracy.high);
    setState(() {
      _currentP=LatLng(position.latitude, position.longitude);
    });
  }
}
