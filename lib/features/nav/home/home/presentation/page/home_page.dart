import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_food/core/ui/widgets/appbar/home_appbar.dart';
import 'package:find_food/core/ui/widgets/card/posts_card.dart';
import 'package:find_food/features/nav/home/home/presentation/controller/home_controller.dart';
import 'package:find_food/features/nav/post/upload/models/post_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppbar(),
      body: GetBuilder<HomeController>(
        id: "fetchPosts",
        builder: (logic) {
          return buildListPostStream();
        },
      ),
    );
  }

  Widget buildListPost() {
    return controller.listPost.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: controller.listPost.length,
            itemBuilder: (_, index) {
              PostDataModel postDataModel = controller.listPost[index];
              return PostsCard(
                postDataModel: postDataModel,
              );
            })
        : const SizedBox.shrink();
  }

  Widget buildListPostStream() {
    return StreamBuilder<List<DocumentSnapshot>>(
      stream: controller.listenToPostsRealTime(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.none) {
          return snapshot.hasData
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Text("No data"),
                );
        } else {
          if (snapshot.hasData) {
            final postDocs = snapshot.data!;
            return ListView.builder(
              controller: controller.scrollController,
              // reverse: true,
              itemBuilder: (ctx, i) {
                PostDataModel postDataModel =
                    PostDataModel.fromDocumentSnapshot(postDocs[i]);
                return PostsCard(
                  postDataModel: postDataModel,
                );
              },
              itemCount: postDocs.length,
            );
          } else {
            return CircularProgressIndicator();
          }
        }
      },
    );
  }
}
