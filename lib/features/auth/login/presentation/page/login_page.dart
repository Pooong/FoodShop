import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/features/auth/login/presentation/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  controller.handleLoginWithEmail();
                },
                child: Text("Login"),
              ),
              const SizedBox(width: 15.0),
              GestureDetector(
                onTap: () {},
                child: Text("SingUp"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
