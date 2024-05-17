import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/features/find_post/result_search/presentation/controller/result_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultSearchPage extends GetView<ResultSearchController> {
  const ResultSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var value = Get.arguments??"";

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          flexibleSpace: Container(
            child: Column(
              children: [
              ],
            ),
          ),
          leading: const Icon(Icons.search),
          title: const TextWidget(
            text: "Search",
            size: AppDimens.textSize26,
            fontWeight: FontWeight.w500,
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.gray,
                ),
                child:  const Icon(Icons.close,color: AppColors.white,),
              )
            ],
        ),
      ),

      body: const Center(
        child: Text("this is result search page "),  
      ),
    );
  }
  
  
}
