import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/features/auth/register/presentation/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends GetView<RegisterController> {
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarRegisterPage(),
      body: bodyRegisterPage(),
    );
  }

  AppBar appbarRegisterPage() {
    return AppBar(
      backgroundColor: AppColors.primary,
      leading: IconButton(
        color: AppColors.white,
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Get.back();
        },
      ),
      title: const TextWidget(
        text: "Sign In",
        color: AppColors.white,
      ),
      centerTitle: true,
    );
  }

  Padding bodyRegisterPage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            headerRegisterPage(),
            const SizedBox(height: 20),
            formRegister(),
            const SizedBox(height: 10), // Khoảng cách giữa nút và đường viền
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    indent: 50,
                    endIndent: 50,
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                ),
              ],
            ),
            const TextWidget(text: "Or"),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color(0xFF395998),
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                  side: const BorderSide(color: Colors.white, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/ic_facebook_logo.svg',
                        width: 15, // Đặt chiều rộng của biểu tượng
                        height: 15,
                      ),
                    ),
                    // Thay thế bằng biểu tượng bạn muốn
                    const SizedBox(
                        width: 8), // Khoảng cách giữa biểu tượng và văn bản
                    const Expanded(
                      child: TextWidget(
                        text: 'Login with Facebook',
                        color: AppColors.white,
                        textAlign: TextAlign.center, // Căn giữa văn bản
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),z
              Form(
                  key: controller.formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: controller.emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Colors.grey), // Màu sắc của border bottom
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .green), // Màu sắc của border bottom khi trường được tập trung
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!controller.validateEmail()) {
                            return controller.msgEmailError.value;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        controller: controller.passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Colors.grey), // Màu sắc của border bottom
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .green), // Màu sắc của border bottom khi trường được tập trung
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (!controller.validatePassword()) {
                            return controller.msgPasswordError.value;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Colors.grey), // Màu sắc của border bottom
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .green), // Màu sắc của border bottom khi trường được tập trung
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != controller.passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: const Color(0xffEB2F06),
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(fontSize: 20),
                            side: const BorderSide(
                                color: Colors.white,
                                width: 2), // Thêm viền màu trắng và rộng 2
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // Góc bo tròn
                            ),
                          ),
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.register();
                            }
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 10), // Khoảng cách giữa nút và đường viền
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      indent: 50,
                      endIndent: 50,
                      color: Colors.grey, // Màu của đường viền
                      thickness: 0.5, // Độ dày của đường viền
                    ),
                  ),
                ],
              ),
              const Text("Or"),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color(0xFF395998),
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                    side: const BorderSide(
                        color: Colors.white,
                        width: 2), // Thêm viền màu trắng và rộng 2
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Góc bo tròn
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/ic_facebook_logo.svg',
                          width: 15, // Đặt chiều rộng của biểu tượng
                          height: 15,
                        ),
                      ),
                      // Thay thế bằng biểu tượng bạn muốn
                      const SizedBox(
                          width: 8), // Khoảng cách giữa biểu tượng và văn bản
                      const Expanded(
                        child: Text(
                          'Login with Facebook',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center, // Căn giữa văn bản
                        ),
                      ),
                    ],
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/ic_google_logo.svg',
                        width: 15, // Đặt chiều rộng của biểu tượng
                        height: 15,
                      ),
                    ),
                    // Thay thế bằng biểu tượng bạn muốn
                    const SizedBox(
                        width: 8), // Khoảng cách giữa biểu tượng và văn bản
                    const Expanded(
                      child: TextWidget(
                        text: 'Login with Google',
                        color: AppColors.white,
                        textAlign: TextAlign.center, // Căn giữa văn bản
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Khoảng cách giữa nút và đường viền
          ],
        ),
      ),
    );
  }

  Form formRegister() {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey), // Màu sắc của border bottom
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors
                          .green), // Màu sắc của border bottom khi trường được tập trung
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!controller.validateEmail()) {
                  return controller.msgEmailError.value;
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              controller: controller.passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey), // Màu sắc của border bottom
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors
                          .green), // Màu sắc của border bottom khi trường được tập trung
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (!controller.validatePassword()) {
                  return controller.msgPasswordError.value;
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey), // Màu sắc của border bottom
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors
                          .green), // Màu sắc của border bottom khi trường được tập trung
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != controller.passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color(0xffEB2F06),
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                  side: const BorderSide(
                      color: Colors.white,
                      width: 2), // Thêm viền màu trắng và rộng 2
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Góc bo tròn
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.register();
                  }
                },
                child: const TextWidget(
                  text: 'Sign Up',
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ));
  }

  Column headerRegisterPage() {
    return Column(
      children: [
        const TextWidget(
          text: "Create Account",
          color: AppColors.primary,
          size: AppDimens.textSize42,
          fontWeight: FontWeight.w900,
        ),
        const SizedBox(height: 20),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "Enter your Name, Email and Password for sign up. ",
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              TextSpan(
                text: "Already have accounts?",
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  color: AppColors.primary,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
