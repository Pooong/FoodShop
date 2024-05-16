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

class ForgetPasswordController extends GetxController {
  final SaveUserUseCase _saveUserUseCase;
  ForgetPasswordController(this._saveUserUseCase);
  @override
  void onInit() {
    super.onInit();
  }

  void handleForgetPass() async {}
}
