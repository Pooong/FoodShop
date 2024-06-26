import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_constants.dart';
import 'package:find_food/core/configs/app_images_string.dart';
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
      appBar: const AppBarWidget(),
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
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const Center(
                  child: Text("No data"),
                );
        } else {
          if (snapshot.hasData) {
            final postDocs = snapshot.data!;
            return ListView.builder(
              controller: controller.scrollController,
              // reverse: true,
              itemBuilder: (ctx, i) {
                PostDataModel postDataModel = PostDataModel.fromDocumentSnapshot(postDocs[i]);
                return PostsCard(
                  restaurantTag: i%2==0,
                  postDataModel: postDataModel,
                );
              },
              itemCount: postDocs.length,
            );
          } else {
            return const CircularProgressIndicator();
          }
        }
      },
    );
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(
          kToolbarHeight + 2), // Increase height for the red line
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: AppBar(
              title: Image.asset(
                AppImagesString.iLogo,
                width: 120,
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
                    final Size overlaySize = overlay.size;
                    final RelativeRect position = RelativeRect.fromLTRB(
                      overlaySize.width - 10, // Right padding
                      85, // Top padding
                      10, // Left padding (from right edge)
                      overlaySize.height - kToolbarHeight - 10, // Bottom padding
                    );
    
                    showMenu<String>(
                      context: context,
                      position: position,
                      items: [
                        const PopupMenuItem<String>(
                          value: AppConstants.SelectOption_1,
                          child: Text('Nearest'),
                        ),
                        const PopupMenuItem<String>(
                          value: AppConstants.SelectOption_2,
                          child: Text('Favorite'),
                        ),
                        const PopupMenuItem<String>(
                          value: AppConstants.SelectOption_3,
                          child: Text('Best'),
                        ),
                      ],color: Colors.white.withOpacity(0.8),
                    ).then((value) {
                      if (value != null) {
                        
                        print('Selected: $value');
                      }
                    });
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Center(
                    child: Text(
                      "Filter",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 2.0, // Height of the red line
            color: AppColors.primary, // Set the color of the line
          ),
        ],
      ),
    );
  }
  
  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + 2); // Adjust height for the line
}
