import 'package:find_food/features/account_setting/nav/change_password/presentation/controller/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordPage extends GetView<ChangePasswordController> {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
     final ChangePasswordController controller = Get.put(ChangePasswordController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: Get.height - Get.height * 0.16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    _buildCurrentPasswordField(controller),
                    const SizedBox(height: 10.0),
                    _buildNewPasswordField(controller),
                    const SizedBox(height: 10.0),
                    _buildNewPasswordConfirmField(controller),
                    const SizedBox(height: 10.0),
                  ],
                ),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentPasswordField(ChangePasswordController controller) {
    return Obx(() => TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        hintText: "Enter your current password",
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 10,
        ),
        border: const UnderlineInputBorder(),
        suffixIcon: IconButton(
          onPressed: controller.toggleCurrentPasswordVisibility,
          icon: Icon(
            controller.showCurrentPassword.value ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      obscureText: !controller.showCurrentPassword.value,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password is required";
        }
        if (value.length < 6) {
          return "Password must be longer than 6 characters";
        }
        return null;
      },
      onSaved: (value) {},
    ));
  }

  Widget _buildNewPasswordField(ChangePasswordController controller) {
    return Obx(() => TextFormField(
      decoration: InputDecoration(
        labelText: "New Password",
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        hintText: "Enter your new password",
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 10,
        ),
        border: const UnderlineInputBorder(),
        suffixIcon: IconButton(
          onPressed: controller.toggleNewPasswordVisibility,
          icon: Icon(
            controller.showNewPassword.value ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      obscureText: !controller.showNewPassword.value,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password is required";
        }
        if (value.length < 6) {
          return "Password must be longer than 6 characters";
        }
        return null;
      },
      onSaved: (value) {},
    ));
  }

  Widget _buildNewPasswordConfirmField(ChangePasswordController controller) {
    return Obx(() => TextFormField(
      decoration: InputDecoration(
        labelText: "New Password Confirm",
        border: const UnderlineInputBorder(),
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        hintText: "Confirm your new password",
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 10,
        ),
        suffixIcon: IconButton(
          onPressed: controller.toggleConfirmPasswordVisibility,
          icon: Icon(
            controller.showConfirmPassword.value ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      obscureText: !controller.showConfirmPassword.value,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password is required";
        }
        if (value.length < 6) {
          return "Password must be longer than 6 characters";
        }
        return null;
      },
    ));
  }

  Widget _buildSubmitButton() {
    return  SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          // Add your submit logic here
        },
        child: const Text(
          "Save Change",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
