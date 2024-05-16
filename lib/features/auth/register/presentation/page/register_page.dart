import 'package:find_food/features/auth/register/presentation/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text("Sign In"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Create Account",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontSize: 40,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
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
                      text: "Already have account?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                        fontSize: 20,
                      ),
                      // recognizer: TapGestureRecognizer()
                      //   ..onTap = () {
                      //     // Điều hướng đến trang đăng nhập
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => sign_in()),
                      //     );
                      //   },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
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
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
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
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
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
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Color(0xffEB2F06),
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                    side: BorderSide(
                        color: Colors.white,
                        width: 2), // Thêm viền màu trắng và rộng 2
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Góc bo tròn
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 10), // Khoảng cách giữa nút và đường viền
              Row(
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
              Text("Or"),
              SizedBox(height: 10),

              Container(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Color(0xFF395998),
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                    side: BorderSide(
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
                        padding: EdgeInsets.all(3),
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
                      SizedBox(
                          width: 8), // Khoảng cách giữa biểu tượng và văn bản
                      Expanded(
                        child: Text(
                          'Login with Facebook',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center, // Căn giữa văn bản
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Color(0xFF4285F4),
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                    side: BorderSide(
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
                        padding: EdgeInsets.all(3),
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
                      SizedBox(
                          width: 8), // Khoảng cách giữa biểu tượng và văn bản
                      Expanded(
                        child: Text(
                          'Login with Google',
                          style: TextStyle(color: Colors.white),
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
      ),
    );
  }
}
