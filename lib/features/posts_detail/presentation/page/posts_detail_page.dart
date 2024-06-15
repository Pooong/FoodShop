import 'package:find_food/core/configs/app_constants.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/widgets/loading/loading_data_page.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/features/posts_detail/presentation/controller/posts_detail_controller.dart';
import 'package:find_food/features/posts_detail/widgets/comment_box_widget.dart';
import 'package:find_food/features/posts_detail/widgets/top_posts_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PostsDetailPage extends GetView<PostsDetailController> {
  const PostsDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios)),
          title: const TextWidget(text: "DETAIL"),
          centerTitle: true,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  final RenderBox overlay =
                      Overlay.of(context).context.findRenderObject() as RenderBox;
                  final Size overlaySize = overlay.size;
                  final RelativeRect position = RelativeRect.fromLTRB(
                    overlaySize.width , // Right padding
                    Get.height*0.09, // Top padding
                    10, // Left padding (from right edge)
                    overlaySize.height - kToolbarHeight, // Bottom padding
                  );
              
                  showMenu<String>(
                    context: context,
                    position: position,
                    items: [
                      const PopupMenuItem<String>(
                        value: "_changeValue",
                        child:Row(children: [Icon(Icons.edit_document),SizedBox(width: 5,), TextWidget(text: "Edit posts")],),
                      ),
                      const PopupMenuItem<String>(
                        value: "_deleteValue",
                        child:Row(children: [Icon(Icons.delete),SizedBox(width: 5,),TextWidget(text: "Delete")],),
                      ),
                    ],
                    color: Colors.white.withOpacity(0.8),
                  ).then((value) {
                    if (value != null) {
                      if(value =="_changeValue"){
                        Get.toNamed("/editPosts",arguments: controller.postDataModel);
                      }
                    }
                  });
                },
              ),
            )
          ],
        ),
        body: Obx(() {
          return controller.isLoading.value
              ? const LoadingDataPage()
              : const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Wrap(
                      runSpacing: AppDimens.columnSpacing,
                      children: [TopPostsDetail(), CommentBoxWidget()],
                    ),
                  ),
                );
        }));
  }
}
