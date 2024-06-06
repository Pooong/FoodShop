import 'package:find_food/app.dart';
import 'package:find_food/features/create_menu_restaurant/pressentation/controller/create_menu_controller.dart';
import 'package:find_food/features/create_menu_restaurant/pressentation/widgets/upload_single_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CreateMenuPage extends GetView<CreateMenuController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Menu'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                UploadSingleImage(),
                TextField(
                  controller: controller.nameFood,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: controller.price,
                  decoration: InputDecoration(labelText: 'Price'),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.createMenu();
                  },
                  child: Text('Create'),
                ),
              ],
            ),
          ),
        ));
  }
}
