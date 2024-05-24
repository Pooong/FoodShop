import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_food/core/data/firebase/firestore_database/firestore_post.dart';
import 'package:find_food/core/data/firebase/model/result.dart';
import 'package:find_food/features/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadController extends GetxController {

  var selectedImages = <File>[].obs;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();

    selectedImages
        .addAll(pickedImages.map((image) => File(image.path)).toList());
  }

  bool check_list_empty(){
    return selectedImages.length==0;
  }

  void removeImage(File image) {
    selectedImages.remove(image);
  }

  void uploadPost() async {
    print("==============================");
    final result = await FirestorePost.createPost(
      PostModel(
        title: "dasda",
        description: "description",
        imageList: [],
        restaurantId: "restaurantId",
        createdAt: "createAt",
        favorites: 0,
        postId: "postId",
      ),
    );
  }
  }
