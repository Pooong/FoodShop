import 'package:find_food/features/account_setting/nav/setting_information/presentation/controller/setting_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingInformationPage extends GetView<SettingInformationController> {
  const SettingInformationPage({super.key});

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
            _buildFullNameField(),
            const SizedBox(height: 10.0),
            _buildEmailField(),
            const SizedBox(height: 10.0),
            _buildPhoneNumberField(),
            const SizedBox(height: 10.0),
            _buildPasswordField(),
            const SizedBox(height: 10.0),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }
}

Widget _buildFullNameField() {
  return TextFormField(
    decoration: const InputDecoration(
      labelText: "Full Name",
      hintText: "Full Name",
      border: UnderlineInputBorder(),
      labelStyle: TextStyle(color: Colors.grey),
    ),
    keyboardType: TextInputType.name,
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Please enter your Full name";
      }
      return null;
    },
    onSaved: (value) {},
  );
}

Widget _buildEmailField() {
  return TextFormField(
    decoration: const InputDecoration(
      labelText: "Email Address",
      hintText: "Email Address",
      border: UnderlineInputBorder(),
      labelStyle: TextStyle(color: Colors.grey),
    ),
    keyboardType: TextInputType.emailAddress,
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Your email ";
      }
      if (!value.contains('@')) {
        return "Please enter an correct email!";
      }
      return null;
    },
    onSaved: (value) {},
  );
}

Widget _buildPhoneNumberField() {
  return TextFormField(
    decoration: const InputDecoration(
      labelText: "Phone Number",
      hintText: "Phone Number",
      border: UnderlineInputBorder(),
      labelStyle: TextStyle(color: Colors.grey),
    ),
    keyboardType: TextInputType.phone,
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Please enter your phone number";
      }
      return null;
    },
    onSaved: (value) {},
  );
}

Widget _buildPasswordField() {
  return TextFormField(
    enabled: false, // Disable TextFormField
    obscureText: true,
    decoration: InputDecoration(
      labelText: "Password",
      labelStyle: TextStyle(color: Colors.grey),
      hintText: "Password",
      border: UnderlineInputBorder(),
      suffix: GestureDetector(
          onTap: () {
              Get.offNamed("/changePassword");
          },
          child: const Text(
            "Change",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
    ),
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  );
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
