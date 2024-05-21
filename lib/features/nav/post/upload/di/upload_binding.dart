
import 'package:find_food/core/data/prefs/prefs.dart';
import 'package:find_food/features/nav/post/upload/presentation/controller/upload_controller.dart';
import 'package:get/get.dart';

class UploadBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Prefs(), fenix: true);
    Get.lazyPut(()=> UploadController());
  }

}