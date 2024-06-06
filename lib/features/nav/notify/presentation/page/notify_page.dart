import 'package:find_food/core/ui/widgets/appbar/notify_appbar.dart';
import 'package:find_food/features/nav/notify/presentation/page/news_notify_page.dart';
import 'package:find_food/features/nav/notify/presentation/page/social_notify_page.dart';
import 'package:find_food/features/nav/notify/presentation/controller/notify_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifyPage extends GetView<NotifyController> {
  const NotifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NotifyController controller = Get.put(NotifyController());

    return Scaffold(
      appBar: const NotifyAppbar(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Obx(
                  () => Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: controller.selectedTab.value == 'social' ? Colors.red : Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () => controller.selectTab('social'),
                      child: Text(
                        'Social',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: controller.selectedTab.value == 'social' ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: controller.selectedTab.value == 'news' ? Colors.red : Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () => controller.selectTab('news'),
                      child: Text(
                        'News',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: controller.selectedTab.value == 'news' ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () {
                if (controller.selectedTab.value == 'news') {
                  return NewsNotifyPage();
                } else {
                  return SocialNotifyPage();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
