import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/widgets/appbar/upload_post_appbar.dart';
import 'package:find_food/core/ui/widgets/button/button_widget.dart';
import 'package:find_food/features/nav/post/upload/presentation/controller/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadPage extends GetView<UploadController> {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: const UploadPostAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GetBuilder<UploadController>(
            id: "clearData",
            builder: (logic) {
              return Column(
                children: [
                  // Image Picker
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleField(title: 'Images'),
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
                                    Icons.add_photo_alternate,
                                    size: 120,
                                  )
                                : const Icon(Icons.add, size: 40),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Title Field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleField(title: 'Title post'),
                      TextField(
                        controller: controller.titleController,
                        decoration: const InputDecoration(
                          hintText: "Enter post title",
                          hintStyle: TextStyle(
                            color: AppColors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Description Field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleField(title: 'Description post'),
                      Container(
                        height: 180,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextField(
                          controller: controller.descriptionController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'Enter description post',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Location Picker
                  InkWell(
                    // onTap: () => Get.toNamed(Routes.getLoactionPage),
                    onTap: () async {
                      final result = await Get.toNamed(
                        '/getLocationPage',
                        arguments: controller.placeSelected,
                      );
                      if (result != null) {
                        controller.placeSelected = result;
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.gray2,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: AppColors.white,
                          width: 1,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on, color: Colors.red),
                            SizedBox(width: 10),
                            Text(
                              "Enter post's location restaurant",
                              style: TextStyle(
                                fontSize: AppDimens.textSize16,
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Upload Button
                  ButtonWidget(
                    ontap: () {
                      controller.uploadPost();
                    },
                    text: "Upload Post",
                    fontWeight: FontWeight.bold,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Container titleField({String title = "Please enter title"}) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: AppDimens.textSize18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
