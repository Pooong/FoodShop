import 'dart:convert';

import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/widgets/appbar/get_location_appbar.dart';
import 'package:find_food/core/ui/widgets/button/button_widget.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/features/maps/location/presentation/controller/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class LocationPage extends GetView<LocationController> {
  const LocationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      init: LocationController(),
      builder: (controller) {
        return Scaffold(
          appBar: const GetLocationAppbar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  searchBox(controller),
                  Column(
                    children: [
                      Container(),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Get.height * .03),
                    width: Get.width,
                    height: Get.height * .75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColors.gray.withOpacity(.5),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            width: 180,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.primary,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  color: AppColors.white,
                                ),
                                TextWidget(
                                  text: "Current location",
                                  size: AppDimens.textSize15,
                                  color: AppColors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Maps(
                            controller.mapController, controller.initialCenter),
                        Positioned(
                            right: 5,
                            top: 5,
                            child: SizedBox(child: buttoCurrentLocation())),
                        Positioned(
                          bottom: 10,
                          right: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              buttonControllerSizeMaps(
                                  controller, MapAction.resetZoom),
                              buttonControllerSizeMaps(
                                  controller, MapAction.zoomIn),
                              buttonControllerSizeMaps(
                                  controller, MapAction.zoomOut),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ButtonWidget(
                    ontap: () {},
                    text: "SAVE LOCATION",
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  ElevatedButton buttoCurrentLocation() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
      onPressed: () {},
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on,
            color: AppColors.white,
          ),
          SizedBox(
            width: 5,
          ),
          TextWidget(
            text: "Get Current location",
            size: AppDimens.textSize14,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Maps(MapController mapController, LatLng center) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: center,
        initialZoom: 16,
        interactionOptions:
            const InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom),
      ),
      children: [
        openStreetMapTileLayer,
        MarkerLayer(
          
          markers: [
            
          Marker(
            point: controller.initialCenter,
            
            width: 60,
            height: 90,
            alignment: Alignment.centerLeft,
            child: GestureDetector(
                onTap: () {
                  controller.showMarker();
                },
                child: GetBuilder<LocationController>(
                  id: "fetchMarkerLabel",
                  builder: (_) => Stack(
                    children: [
                      controller.labelMark.value
                          ? Positioned(
                              child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: AppColors.black.withOpacity(.2),
                                      blurRadius: 3)
                                ], color: AppColors.white),
                                height: 30,
                                child: const TextWidget(
                                  text: "Can Tho University",
                                  fontWeight: FontWeight.w500,
                                  size: AppDimens.textSize10,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : Container(),
                      const Positioned(
                        bottom: 0,
                        child: Icon(
                          Icons.location_on,
                          size: 60,
                          color: AppColors.markerLocation,
                        ),
                      ),
                    ],
                  ),
                )),
          )
        ])
      ],
    );
  }

  TileLayer get openStreetMapTileLayer => TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'com.example.app',
      );

  ElevatedButton buttonControllerSizeMaps(
      LocationController controller, MapAction action) {
    IconData iconData;
    switch (action) {
      case MapAction.zoomIn:
        iconData = Icons.zoom_in;
        break;
      case MapAction.zoomOut:
        iconData = Icons.zoom_out;
        break;
      default:
        iconData = Icons.location_searching;
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: AppColors.primary,
      ),
      onPressed: () {
        controller.performAction(action);
      },
      child: Icon(
        iconData,
        color: AppColors.white,
        size: AppDimens.textSize26,
      ),
    );
  }

  // Search Box Widget
// Search Box Widget
  Widget searchBox(LocationController controller) {
    final TextEditingController searchController = TextEditingController();

    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.gray2.withOpacity(.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.gray.withOpacity(.3),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.search),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintStyle: TextStyle(fontWeight: FontWeight.w400),
                border: InputBorder.none,
                hintText: "Enter location",
              ),
              onSubmitted: (value) {
                _searchLocation(controller, value);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Function to search for a location and update the map
  Future<void> _searchLocation(
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
        controller.updateMapLocation(LatLng(lat, lon));
      } else {
        // Handle no results found
        print('No results found');
      }
    } else {
      // Handle request failure
      print('Request failed with status: ${response.statusCode}');
    }
  }

  // Optional Comment Search Widget
  Container commentSearch() {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 3,
          ),
        ],
      ),
      child: const TextWidget(
        text: "location - location - location - location ",
        size: AppDimens.textSize14,
        color: AppColors.gray,
      ),
    );
  }

  // Line Between Widget
  Container lineBetween() {
    return Container(
      height: 1,
      width: double.infinity,
      color: AppColors.gray.withOpacity(.4),
    );
  }
}
