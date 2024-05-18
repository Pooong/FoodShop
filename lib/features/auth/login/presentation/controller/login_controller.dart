import 'package:find_food/core/configs/enum.dart';
import 'package:find_food/core/data/firebase/firebae_auth/firebase_auth.dart';
import 'package:find_food/core/data/firebase/firestore_database/firestore_user.dart';
import 'package:find_food/core/routes/routes.dart';
import 'package:find_food/core/ui/snackbar/snackbar.dart';
import 'package:find_food/core/utils/validator.dart';
import 'package:find_food/features/auth/user/domain/use_case/save_user_use_case.dart';
import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final SaveUserUseCase _saveUserUseCase;
  LoginController(this._saveUserUseCase);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isEyePassword = true.obs;
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  bool _validateEmail() {
    if (emailController.text.isEmpty) {
      emailError.value = "email_cannot_be_emptyy".tr;
      return false;
    } else if (!Validators.validateEmail(emailController.text)) {
      emailError.value = 'email_invalid';
      return false;
    } else if (passwordController.text.isEmpty) {
      passwordError.value = 'password_cannot_be_empty';
      return false;
    } else {
      passwordError.value = '';
      emailError.value = '';
      return true;
    }
  }

  void handleLoginWithEmail() async {
    // if (!_validateEmail()) return;
    // DialogsUtils.showAlterLoading();
    final result = await FirebaseAuthentication.logIn(
      email: "admin@gmail.com",
      password: "123456789",
    );

    // Get.back();
    if (result.status == Status.success) {
      User? user = result.data;
      // if (user != null && !user.emailVerified) {
      //   await FirebaseAuthentication.sendMailVerify();
      //   Get.offAllNamed(Routes.emailVerify);
      // } else {
      //   final resultUser = await FirestoreUser.getUser(user!.uid);
      //   if (resultUser.status == Status.success) {
      //     // if (resultUser.data!.isComplete == false) {
      //     //   Get.offAllNamed(Routes.userInfor, arguments: resultUser.data);
      //     // } else {
      //     //   _saveUserUseCase.saveUser(resultUser.data!);
      //     //   Get.offAllNamed(Routes.main);
      //     // }
      //     _saveUserUseCase.saveUser(resultUser.data!);
      //     Get.offAllNamed(Routes.main);
      //   } else {
      //     SnackbarUtil.show(result.exp?.message ?? "something_went_wrong");
      //   }
      // }
      final resultUser = await FirestoreUser.getUser(user!.uid);
      if (resultUser.status == Status.success) {
        //

        // if (resultUser.data!.isComplete == false) {
        //   Get.offAllNamed(Routes.userInfor, arguments: resultUser.data);
        // } else {
        //   _saveUserUseCase.saveUser(resultUser.data!);
        //   Get.offAllNamed(Routes.main);
        // }

        _saveUserUseCase.saveUser(resultUser.data!);

        Get.offAllNamed(Routes.main);
      } else {
        SnackbarUtil.show(result.exp?.message ?? "something_went_wrong");
      }
    } else {
      SnackbarUtil.show(result.exp?.message ?? "something_went_wrong");
    }
  }

  void register() async {
    // if (!validateEmail() || !validatePassword()) {
    //   return;
    // }
    // DialogsUtils.showAlterLoading();

    final result = await FirebaseAuthentication.signUp(
      email: "admin@gmail.com",
      password: "12345678",
    );
    if (result.status == Status.success) {
      UserModel user = UserModel(
        uid: result.data!.uid,
        email: result.data!.email!,
      );
      createNewUser(user);
    } else {
      Get.back();
      if (result.exp?.code == "email-already-in-use") {
        // msgEmailError.value = 'email_already_in_use';
        return;
      }
      SnackbarUtil.show(result.exp?.message ?? "something_went_wrong");
    }
  }

  createNewUser(UserModel user) async {
    final result = await FirestoreUser.createUser(user);
    if (result.status == Status.success) {
      Get.back();
    } else {
      Get.back();
      SnackbarUtil.show(result.exp?.message ?? "something_went_wrong");
    }
  }

  login() async {
    const username = "thanthan";
    const password = "1234567";
  }
}
