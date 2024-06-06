import 'package:find_food/core/configs/app_images_string.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/features/find_post/category/presentation/controller/category_controller.dart';
import 'package:find_food/features/find_post/category/widget/nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const TextWidget(
          text: "SEARCH CATEGORY",
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<CategoryController>(
        id: "fetchPostsCategory",
        builder: (_) {
          return Container(
            child: categoryBody(),
          );
        },
      ),
    );
  }

  Widget categoryBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(maxHeight: Get.height * .13),
            child: Image.asset(
              AppImagesString.iBackgroundUserDefault,
              width: Get.width,
              fit: BoxFit.cover,
            ),
          ),
          Obx(
            () => NavControllList(
              currentIndex: controller.currentIndex.value,
              onPageChanged: (index) {
                controller.onChangeNavList(index);
              },
            ),
          ),
          SizedBox(
            height: Get.height * 0.6,
            width: double.infinity,
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (index) {
                controller.onChangePage(index);
              },
              children: controller.getPages(),
            ),
          ),
        ],
      ),
    );
  }
}
