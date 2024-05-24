import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/configs/app_dimens.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:find_food/core/ui/widgets/textfield/textfield_widget.dart';
import 'package:find_food/features/auth/login/presentation/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarLoginPage(),
      body: bodyLoginPage(),
    );
  }

  AppBar appbarLoginPage() {
    return AppBar(
      backgroundColor: AppColors.primary,
      leading: IconButton(
        color: AppColors.white,
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      title: const TextWidget(
        text: "Sign In",
        color: AppColors.white,
      ),
      centerTitle: true,
    );
  }

  Padding bodyLoginPage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TextWidget(
              text: "Welcome to Tamangg Food Servicess",
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              size: AppDimens.textSize32,
            ),
            const SizedBox(height: 20),
            const TextWidget(
              text:
                  "Enter your Phone number or Email address for sign in. Enjoy your food :)",
              color: AppColors.black,
              size: AppDimens.textSize20,
            ),
            const SizedBox(height: 20),
            formLogin(),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Get.toNamed('/forgetpass');
              },
              child: const TextWidget(
                text: 'Forget Password ?',
                color: AppColors.primary,
                textDecoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Flexible(
                  fit: FlexFit.loose,
                  flex: 1,
                  child: TextWidget(
                    text: 'Don’t have account?',
                  ),
                ),
                const SizedBox(width: 4),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/register');
                    },
                    child: const TextWidget(
                      maxLines: 2,
                      text: 'Create New Account here',
                      color: AppColors.primary,
                      textDecoration: TextDecoration.none,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
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
            const TextWidget(
              text: "Or",
              color: AppColors.black,
            ),
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
                    width: 2,
                  ),
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
                        width: 15,
                        height: 15,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: TextWidget(
                        text: 'Login with Facebook',
                        color: AppColors.black,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color(0xFF4285F4),
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                  side: const BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
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
                        'assets/icons/ic_google_logo.svg',
                        width: 15,
                        height: 15,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: TextWidget(
                        text: 'Login with Google',
                        color: AppColors.white,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Form formLogin() {
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
                  color: AppColors.grey,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              // if (!controller.validateEmail()) {
              //   return "Email invalid";
              // }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
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
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
                side: const BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.handleLoginWithEmail();
                }
              },
              child: const TextWidget(
                text: 'Sign In',
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
