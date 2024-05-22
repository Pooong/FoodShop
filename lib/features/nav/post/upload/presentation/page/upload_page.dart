
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
    final controller = Get.put(UploadController());

    return Scaffold(
      appBar: const UploadPostAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Image Picker
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleField(title: 'Images'),
                  Obx(() {
                    return Wrap(
                      spacing: 10,
                      runSpacing: 10,
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
                    child: Container(
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.gray.withOpacity(0.1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.gray2,
                      ),
                      child: const Icon(
                        Icons.add_photo_alternate,
                        size: 120,
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
                onTap: () => Get.toNamed('/getLocationPage'),
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

// class UploadController extends GetxController {
//   var selectedImages = <File>[].obs;
//   final titleController = TextEditingController();
//   final descriptionController = TextEditingController();

//   Future<void> pickImages() async {
//     final picker = ImagePicker();
//     final pickedImages = await picker.pickMultiImage();

//     if (pickedImages != null) {
//       selectedImages.addAll(pickedImages.map((image) => File(image.path)).toList());
//     } else {
//       // User canceled the picker
//     }
//   }

//   void removeImage(File image) {
//     selectedImages.remove(image);
//   }

//   void uploadPost() {
//     // Implement your upload logic here
//     // You can use titleController.text, descriptionController.text, and selectedImages
//   }
// }
