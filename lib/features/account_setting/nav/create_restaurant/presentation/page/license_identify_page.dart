import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/ui/widgets/appbar/license_identify_appbar.dart';
import 'package:find_food/core/ui/widgets/button/button_widget.dart';
import 'package:find_food/features/account_setting/nav/create_restaurant/presentation/controller/create_restaurant_controller.dart';
import 'package:find_food/features/account_setting/nav/create_restaurant/presentation/page/images_identify_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LicenseIdentifyPage extends GetView<CreateRestaurantController> {
  const LicenseIdentifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LicenseIdentifyAppbar(),
      body: buildLicenseIdentifyBody(),
    );
  }

  SingleChildScrollView buildLicenseIdentifyBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<CreateRestaurantController>(
          id: "clearData",
          builder: (logic) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5.0,
                    ),
                    titleField(title: "LICENSE RESTAURANT"),
                    uploadImage(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    titleField(title: "LICENSE OWNER"),
                    uploadImage(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    titleField(title: "RESTAURANT ADDRESS"),
                    _buildRestaurantAddressField(),
                    const SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
                ButtonWidget(
                  ontap: () {
                    Get.to(ImagesIdentifyPage());
                  },
                  text: "CONTINUE",
                  fontWeight: FontWeight.bold,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Column uploadImage() {
    return Column(
      children: [
        Obx(() {
          return Wrap(
            spacing: 15,
            runSpacing: 15,
            children: controller.selectedImages.map((image) {
              return Stack(
                children: [
                  Image.file(
                    image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => controller.removeImage(image),
                      child: Container(
                        color: Colors.red,
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          );
        }),
        GestureDetector(
          onTap: () {
            controller.pickImages();
          },
          child: Obx(
            () => Container(
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: controller.check_list_empty() ? 180 : 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.gray.withOpacity(0.1),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
                color: AppColors.gray2,
              ),
              child: controller.check_list_empty()
                  ? const Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 100,
                    )
                  : const Icon(Icons.add, size: 40),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

Widget titleField({required String title}) {
  return Text(
    title,
    style: const TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w300,
    ),
  );
}

Widget _buildRestaurantAddressField() {
  return TextFormField(
    decoration: const InputDecoration(
      hintText: "Enter your restaurant name",
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: 10,
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 2.0,
        ),
      ),
    ),
    keyboardType: TextInputType.name,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 15,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Please enter your restaurant address";
      }
      return null;
    },
    onSaved: (value) {},
  );
}
