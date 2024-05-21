import 'package:get/get.dart';

class NotifyController extends GetxController {
  var selectedTab = 'news'.obs;

  void selectTab(String tab) {
    selectedTab.value = tab;
  }
}
