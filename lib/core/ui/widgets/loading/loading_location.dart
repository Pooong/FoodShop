import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/services/location_service.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingLocation extends StatelessWidget {
  LoadingLocation({super.key, required this.locationService,required this.isLoading});
  final LocationService locationService;
  bool isLoading;

  Future<void> initializeLocation() async {
    isLoading = true;
    await locationService.initializeLocation();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(.4),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              await initializeLocation();
              print("run");
            },
            child: const TextWidget(
              text: "Get current location",
            ),
          ),
        ),
      ),
    );
  }
}
