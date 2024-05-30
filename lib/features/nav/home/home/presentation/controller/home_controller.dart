import 'package:find_food/core/configs/enum.dart';
import 'package:find_food/core/data/firebase/firestore_database/firestore_post_data.dart';
import 'package:find_food/core/ui/snackbar/snackbar.dart';
import 'package:find_food/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:find_food/features/nav/post/upload/models/post_data_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GetuserUseCase _getuserUseCase;
  HomeController(this._getuserUseCase);
  List<PostDataModel> listPost = [];
  UserModel? user;

  // Route? onGenerateRoute(Route setting) {
  //   return null;
  // }

  @override
  void onInit() async {
    user = await _getuserUseCase.getUser();
    getPosts();
  }

  void getPosts() async {
    final result = await FirestorePostData.getListPost(user!.uid);
    if (result.status == Status.success) {
      listPost = result.data!;
      print(listPost.length);
      update(["fetchPosts"]);
    } else {
      SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
    }
  }
}
