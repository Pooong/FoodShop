import 'package:find_food/core/configs/enum.dart';
import 'package:find_food/core/data/firebase/firestore_database/firestore_user.dart';
import 'package:find_food/core/ui/snackbar/snackbar.dart';
import 'package:find_food/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:find_food/features/auth/user/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingInformationController extends GetxController {
  final GetuserUseCase _getuserUseCase;
  SettingInformationController(this._getuserUseCase);
  UserModel? user;
  String? displayName;
  String? email;
  String? phoneNumber;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() async {
    user = await _getuserUseCase.getUser();
    super.onInit();
    await getUser();
    loadData();
  }

  Future<void> loadData() async {
    update(["setting_information_controller", "fetchUserInformation"]);
  }

  Future<void> getUser() async {
    final result = await FirestoreUser.getUser(user!.uid!);
    if (result.status == Status.success) {
      user = result.data!;
      update(["fetchUserInformation"]);
    } else {
      SnackbarUtil.show(result.exp?.message ?? "Something went wrong");
    }
  }

  Future<void> updateUser() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final result = await FirestoreUser.updateUser(user!);
      if (result.status == Status.success) {
        SnackbarUtil.show("Save changes");
        loadData();
        update(["fetchUserInformation"]);
      } else {
        SnackbarUtil.show(result.exp!.message ?? "Something went wrong");
      }
    }
  }
}
