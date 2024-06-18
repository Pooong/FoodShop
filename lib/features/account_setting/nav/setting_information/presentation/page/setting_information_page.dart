import 'package:find_food/core/ui/widgets/appbar/setting_infomation_appbar.dart';
import 'package:find_food/core/ui/widgets/button/button_widget.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/features/account_setting/nav/setting_information/presentation/controller/setting_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingInformationPage extends StatelessWidget {
  const SettingInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingInformationAppBar(),
      body: GetBuilder<SettingInformationController>(
        id: "setting_information_controller",
        builder: (controller) {
          if (controller.user == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return buildSettingInformationBody(controller);
        },
      ),
    );
  }
}

SingleChildScrollView buildSettingInformationBody(
    SettingInformationController controller) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: Get.height - Get.height * 0.16,
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              textFormFieldList(controller),
              ButtonWidget(
                  ontap: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.formKey.currentState!.save();
                      controller.updateUser();
                    }
                  },
                  text: "Save Change"),
            ],
          ),
        ),
      ),
    ),
  );
}

Column textFormFieldList(SettingInformationController controller) {
  return Column(
    children: <Widget>[
      _buildDisplayNameField(controller),
      const SizedBox(height: 10.0),
      _buildEmailField(controller),
      const SizedBox(height: 10.0),
      _buildPhoneNumberField(controller),
      const SizedBox(height: 10.0),
      _buildPasswordField(controller),
      const SizedBox(height: 30.0),
    ],
  );
}

Widget _buildDisplayNameField(SettingInformationController controller) {
  return GetBuilder<SettingInformationController>(
    id: "fetchUserInformation",
    builder: (_) {
      return TextFormField(
        initialValue: controller.user?.displayName ?? "",
        decoration: const InputDecoration(
          labelText: "Display Name",
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          hintText: "Enter your display name",
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
        onSaved: (value) {
          controller.user?.displayName = value;
        },
      );
    },
  );
}

Widget _buildEmailField(SettingInformationController controller) {
  return GetBuilder<SettingInformationController>(
    id: "fetchUserInformation",
    builder: (_) {
      return TextFormField(
        initialValue: controller.user?.email ?? "",
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
            return "Please enter a correct email!";
          }
          return null;
        },
        onSaved: (value) {
          controller.user?.email = value ?? "";
        },
      );
    },
  );
}

Widget _buildPhoneNumberField(SettingInformationController controller) {
  return GetBuilder<SettingInformationController>(
    id: "fetchUserInformation",
    builder: (_) {
      return TextFormField(
        initialValue: controller.user?.phoneNumber ?? "",
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
        onSaved: (value) {
          controller.user?.phoneNumber = value;
        },
      );
    },
  );
}

Widget _buildPasswordField(SettingInformationController controller) {
  return GetBuilder<SettingInformationController>(
    id: "fetchUserInformation",
    builder: (_) {
      return Row(
        children: [
          Expanded(
            child: TextFormField(
              initialValue: controller.user?.password ?? "",
              // enabled: false, // Disable TextFormField
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                hintText: "Password",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
              ),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your password";
                }
                return null;
              },
              onSaved: (value) {
                controller.user?.password = value;
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.offNamed("/changePassword");
            },
            child: const TextWidget(
              text: "Change Password",
              color: Colors.red,
            ),
          ),
        ],
      );
    },
  );
}
