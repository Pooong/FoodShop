import 'package:find_food/core/ui/widgets/appbar/notify_appbar.dart';
import 'package:find_food/features/nav/notify/nav/news_notify/presentation/page/news_notify_page.dart';
import 'package:find_food/features/nav/notify/nav/social_notify/presentation/page/social_notify_page.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              Obx(
                () => TextButton(
                  onPressed: () => controller.selectTab('social'),
                  child: Text(
                    'Social',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: controller.selectedTab.value == 'social'
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all<Color>(controller.selectedTab.value == 'social'
                          ? Colors.red
                          : Colors.white,
                          ),
                  ),
                ),
                  
                ),
              Obx(
                () => TextButton(
                  onPressed: () => controller.selectTab('news'),
                  child: Text(
                    'News',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: controller.selectedTab.value == 'news'
                           ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all<Color>(
                      controller.selectedTab.value == 'news'
                        ? Colors.red
                        : Colors.white,
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
