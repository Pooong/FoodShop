import 'package:find_food/features/account_setting/nav/change_password/presentation/controller/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordPage extends GetView<ChangePasswordController> {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Settings"),
        actions: [],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            _buildCurrentPasswordField(),
            const SizedBox(height: 10.0),
            _buildNewPasswordField(),
            const SizedBox(height: 10.0),
            _buildNewPasswordConfirmField(),
            const SizedBox(height: 10.0),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }
}

Widget _buildCurrentPasswordField() {
  return TextFormField(
    decoration: const InputDecoration(
      labelText: "Password",
      labelStyle: TextStyle(color: Colors.grey),
      hintText: "Password",
      border: UnderlineInputBorder(),
      // suffixIcon: IconButton(
      //   onPressed: () {
      //     setState(() {
      //       _showPassword = !_showPassword;
      //     });
      //   },
      //   icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
      // ),
    ),
    //obscureText: !_showPassword,
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
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
  );
}

Widget _buildNewPasswordField() {
  return TextFormField(
    decoration: const InputDecoration(
      labelText: "New Password",
      labelStyle: TextStyle(color: Colors.grey),
      hintText: "New Password",
      border: UnderlineInputBorder(),
      // suffixIcon: IconButton(
      //   onPressed: () {
      //     setState(() {
      //       _showPassword = !_showPassword;
      //     });
      //   },
      //   icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
      // ),
    ),
    //obscureText: !_showPassword,
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
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
  );
}

Widget _buildNewPasswordConfirmField() {
  return TextFormField(
      decoration: const InputDecoration(
        labelText: "New Password Confirm",
        hintText: "New Password Confirm",
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.grey),
        // suffixIcon: IconButton(
        //   onPressed: () {
        //     setState(() {
        //       _showPassword = !_showPassword;
        //     });
        //   },
        //   icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
        // ),
      ),
      //obscureText: !_showPassword,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      validator: (value) {
        // if (value != _passwordController.text) {
        //   return "Password is not valid";
        // }
        return null;
      });
}

Widget _buildSubmitButton() {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {},
      child: const Text(
        "Save Change",
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
