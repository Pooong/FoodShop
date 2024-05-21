import 'package:find_food/core/data/prefs/prefs.dart';
import 'package:find_food/features/nav/notify/nav/news_notify/presentation/controller/news_notify_controller.dart';
import 'package:get/get.dart';

class NewsNotifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Prefs(), fenix: true);
    // Get.lazyPut(() => SaveUserUseCase(Get.find()));
    Get.lazyPut(() => NewsNotifyController());
  }
}
