import 'package:find_food/core/configs/enum.dart';
import 'package:find_food/core/data/firebase/firebae_auth/firebase_auth.dart';
import 'package:find_food/core/data/firebase/firestore_database/firestore_user.dart';
import 'package:find_food/core/routes/routes.dart';
import 'package:find_food/core/ui/dialogs/dialogs.dart';
import 'package:find_food/core/ui/snackbar/snackbar.dart';
import 'package:find_food/core/utils/validator.dart';
import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  RxString msgEmailError = ''.obs;
  RxString msgPasswordError = ''.obs;
  RxString msgConfirmPasswordError = ''.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool validateEmail() {
    if (emailController.text.isEmpty) {
      msgEmailError.value = 'email_cannot_be_empty';
      return false;
    } else if (!Validators.validateEmail(emailController.text)) {
      msgEmailError.value = 'email_invalid';
      return false;
    } else {
      msgEmailError.value = '';
      return true;
    }
  }

  bool validatePassword() {
    if (passwordController.text.isEmpty) {
      msgPasswordError.value = 'password_cannot_be_empty';
      return false;
    } else if (!Validators.validPassword(passwordController.text)) {
      msgPasswordError.value = 'password_invalid';
      return false;
    } else if (confirmPasswordController.text.isNotEmpty &&
        passwordController.text != confirmPasswordController.text) {
      msgConfirmPasswordError.value = 'passwords_do_not_match';
      return false;
    } else {
      msgPasswordError.value = '';
      msgConfirmPasswordError.value = '';
      return true;
    }
  }

  void register() async {
    print("==================OK VAO CONTROLLER=====================");
    if (!validateEmail() || !validatePassword()) {
      print("==================FAILS ROI DO==================");
      return;
    }
    print("===============PROCESSING===============");
    // DialogsUtils.showAlterLoading();
    final result = await FirebaseAuthentication.signUp(
      email: emailController.text,
      password: passwordController.text,
    );
    print("===============WAITTINGgggggg===============");

    if (result.status == Status.success) {
      UserModel user = UserModel(
        uid: result.data!.uid,
        email: result.data!.email!,
      );
      DialogsUtils.showAlertDialog(
          title: "Đăng ký thành công",
          message: "Bạn sẽ được chuyển đến trang đăng nhập",
          typeDialog: TypeDialog.success,
          onPresss: () async =>
              {await createNewUser(user), Get.offAllNamed("/login")});
      print("DANG KY THANH CONG!! XIN CHUC MUNG");
    } else {
      Get.back();
      if (result.exp?.code == "email-already-in-use") {
        print("something_went_wrong");

        msgEmailError.value = 'email_already_in_use';
        return;
      }

      SnackbarUtil.show(result.exp?.message ?? "something_went_wrong");
    }
  }

  createNewUser(UserModel user) async {
    final result = await FirestoreUser.createUser(user);
    if (result.status == Status.success) {
      Get.back();
      // Get.offAllNamed(Routes.emailVerify);
    } else {
      Get.back();
      SnackbarUtil.show(result.exp?.message ?? "something_went_wronggg");
    }
  }
}
