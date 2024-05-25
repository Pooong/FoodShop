import 'package:find_food/features/account_setting/nav/setting_information/presentation/controller/setting_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingInformationPage extends GetView<SettingInformationController> {
  const SettingInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingInformationController controller = Get.put(SettingInformationController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings Information"),
        actions: [],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: Get.height - Get.height * 0.16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    _buildFullNameField(),
                    const SizedBox(height: 10.0),
                    _buildEmailField(),
                    const SizedBox(height: 10.0),
                    _buildPhoneNumberField(),
                    const SizedBox(height: 10.0),
                    _buildPasswordField(),
                    const SizedBox(height: 30.0),
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
}

Widget _buildFullNameField() {
  return  TextFormField(
      decoration: const InputDecoration(
        labelText: "Full Name",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        hintText: "Enter your full name",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 10,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red, // Change the color here
            width: 2.0,
          ),
        ),
      ),
      keyboardType: TextInputType.name,
      style: const TextStyle(
        color: Colors.black,
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
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        hintText: "Enter Your Email Address",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 10,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Your email is required";
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
  return  TextFormField(
      decoration: const InputDecoration(
        labelText: "Phone Number",
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        hintText: "Enter Your Phone Number",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 10,
        ),
      ),
      keyboardType: TextInputType.phone,
      style: const TextStyle(
        color: Colors.black,
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
      //enabled: false, // Disable TextFormField
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        hintText: "Password",
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 10,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
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
        fontSize: 20,
      ),
  );
}

Widget _buildSubmitButton() {
  return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: const Text(
          "Save Change",
          style: TextStyle(color: Colors.white),
        ),
      ),
  );
}
