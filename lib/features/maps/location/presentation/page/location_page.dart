import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/ui/widgets/appbar/get_location_appbar.dart';
import 'package:find_food/features/maps/location/models/place.dart';
import 'package:find_food/features/maps/location/presentation/controller/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationPage extends GetView<LocationController> {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GetLocationAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromARGB(18, 0, 0, 0)),
              child: Row(
                children: [
                  GestureDetector(
                    child: const Icon(Icons.search),
                    onTap: () {
                      controller
                          .handleSearch(controller.addressController.text);
                    },
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      child: SizedBox(
                    height: 30,
                    child: TextField(
                      controller: controller.addressController,
                      decoration: const InputDecoration(
                        labelText: "search location this here",
                        labelStyle:
                            TextStyle(color: Color.fromARGB(187, 0, 0, 0)),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                      onChanged: (value) {
                        controller.onTextChange(value);
                      },
                    ),
                  ))
                ],
              ),
            ),
            lineBetween(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: ElevatedButton(
                  onPressed: () {
                    // Get.toNamed('/maps');
                    controller.getCurrentPosition();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(177, 0, 0, 0))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on, color: Colors.white),
                      Text(
                        "Use Your Current Location",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )),
            ),
            // lineBetween(),
            // Container(
            //   margin: const EdgeInsets.symmetric(vertical: 15),
            //   child: const Row(
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.only(right: 10),
            //         child: Icon(Icons.search),
            //       ),
            //       Text(
            //         "Ninh kieu, Can tho",
            //         style: TextStyle(color: Color.fromARGB(154, 0, 0, 0)),
            //       )
            //     ],
            //   ),
            // ),
            // lineBetween(),
            // buildListPlace(),
            buildListPlace()
          ],
        ),
      ),
    );
  }

  Container lineBetween() {
    return Container(
      height: 2,
      width: double.infinity,
      color: AppColors.gray2,
    );
  }

  Widget buildListPlace() {
    return StreamBuilder<List<Place>>(
      stream: controller.controllerOut,
      builder: (context, snapshot) {
        if (snapshot.data == null || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data address found'));
        }
        final data = snapshot.data;

        return data != null && data.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                    // shrinkWrap: true,
                    itemCount: data!.length,
                    itemBuilder: (_, index) {
                      Place place = data![index];
                      return ItemPlace(place: place);
                    }),
              )
            : const SizedBox.shrink();
      },
    );
  }

  Widget ItemPlace({required Place place}) {
    return GestureDetector(
      onTap: () {
        controller.onSelectPlace(place);
      },
      child: Column(
        children: [
          const Divider(
            color: AppColors.gray2,
            height: 2.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.search),
                ),
                Expanded(
                  child: Text(
                    place.displayAddress(),
                    style: const TextStyle(color: Color.fromARGB(154, 0, 0, 0)),
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: AppColors.gray2,
            height: 2.0,
          ),
        ],
      ),
    );
  }
}
