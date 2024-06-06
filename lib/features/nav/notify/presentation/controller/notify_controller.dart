import 'package:get/get.dart';

class NotifyController extends GetxController {
  var selectedTab = 'news'.obs;

  void selectTab(String tab) {
    selectedTab.value = tab;
  }

  var switchValue1 = false.obs;
  var switchValue2 = false.obs;
}
