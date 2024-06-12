import 'package:find_food/core/configs/enum.dart';
import 'package:find_food/core/data/firebase/firestore_database/firestore_user.dart';
import 'package:find_food/core/ui/snackbar/snackbar.dart';
import 'package:find_food/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:get/get.dart';

class SettingInformationController extends GetxController {
  final GetuserUseCase _getuserUseCase;
  SettingInformationController(this._getuserUseCase);
  UserModel? user;

  @override
  void onInit() async {
    user = await _getuserUseCase.getUser();
    super.onInit();
    getUser();
    update(["fetchDataProfilePage", "listPostsOfUser", "fetchUser", "fetchPostsOfUser"]);
  }

  void getUser() async {
    final result = await FirestoreUser.getUser(user!.uid!);
    if (result.status == Status.success) {
      user = result.data!;
      update(["fetchUser"]);
    } else {
      SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
    }
  }
}
