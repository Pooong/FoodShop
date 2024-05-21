import 'package:find_food/features/nav/notify/nav/news_notify/presentation/page/news_notify_page.dart';
import 'package:find_food/features/nav/notify/nav/social_notify/presentation/page/social_notify_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifyController extends GetxController {
  var selectedTab = 'news'.obs;

  void selectTab(String tab) {
    selectedTab.value = tab;
  }
}
