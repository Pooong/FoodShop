import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/widgets/button/button_widget.dart';
import 'package:find_food/features/nav/post/upload/presentation/controller/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends GetView<UploadController> {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleField(title: 'Images'),
                GestureDetector(
                  onTap: () {
                    _pickImage(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.gray.withOpacity(0.1), width: 2),
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.gray2,
                    ),
                    child: const Icon(
                      Icons.add_photo_alternate,
                      size: 120,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20), // Adding some space
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleField(title: 'Title post'),
                const TextField(
                  decoration: InputDecoration(
                      hintText: "Enter post title",
                      hintStyle: TextStyle(
                          color: AppColors.grey, fontWeight: FontWeight.w400)),
                ),
              ],
            ),
            const SizedBox(height: 20), // Adding some space

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleField(title: 'Description post'),
                Container(
                  height: 180,
                  padding:
                      const EdgeInsets.all(8.0), // Adjust padding as needed
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.grey), // Add border for visual clarity
                    borderRadius: BorderRadius.circular(
                        8.0), // Optional: Add border radius for rounded corners
                  ),
                  child: const TextField(
                    maxLines: null, // Allows for multiple lines of input
                    decoration: InputDecoration(
                      hintText: 'Enter description post', // Placeholder text
                      border: InputBorder
                          .none, // Hide the default border of the TextField
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20), // Adding some space

            //button get loction.
            InkWell(
              onTap: ()=> Get.toNamed('/getLocationPage'),
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
                      )
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            ButtonWidget(
              ontap: () {},
              text: "Upload Post",
              fontWeight:FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }

  Container titleField({String title = "plase enter title"}) {
    return Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(title,
            style: const TextStyle(
                fontSize: AppDimens.textSize18, fontWeight: FontWeight.w500)));
  }

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // Handle the picked image, you can display it or save it
      // File imageFile = File(pickedImage.path);
      // Here, you can add the logic to save the image file or display it in your UI
      // For example, you can use Image.file(imageFile) to display the image in your UI
    } else {
      // User canceled the picker
    }
  }
}
