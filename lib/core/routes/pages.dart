import 'package:find_food/core/routes/routes.dart';
import 'package:find_food/features/account_setting/di/account_setting_binding.dart';
import 'package:find_food/features/account_setting/presentation/page/account_setting_page.dart';
import 'package:find_food/features/auth/forget_password/di/forget_password_binding.dart';
import 'package:find_food/features/auth/forget_password/presentation/page/forget_password_page.dart';
import 'package:find_food/features/auth/login/di/login_binding.dart';
import 'package:find_food/features/auth/login/presentation/page/login_page.dart';
import 'package:find_food/features/auth/register/di/register_binding.dart';
import 'package:find_food/features/auth/register/presentation/page/register_page.dart';
import 'package:find_food/features/main/di/main_binding.dart';
import 'package:find_food/features/main/presentation/page/main_page.dart';
import 'package:find_food/features/maps/location/di/location_binding.dart';
import 'package:find_food/features/maps/location/presentation/page/location_page.dart';
import 'package:find_food/features/maps/maps/di/maps_binding.dart';
import 'package:find_food/features/maps/maps/presentation/page/maps_page.dart';
import 'package:find_food/features/nav/post/upload/di/upload_binding.dart';
import 'package:find_food/features/nav/post/upload/presentation/page/upload_page.dart';
import 'package:find_food/features/nav/profile/di/profile_binding.dart';
import 'package:find_food/features/nav/profile/presentation/page/profile_page.dart';
import 'package:find_food/features/splash/di/splash_binding.dart';
import 'package:find_food/features/splash/presentation/pages/splash_page.dart';
import 'package:get/get.dart';

class Pages {
  static const initial = Routes.splash;
  static const main = Routes.main;

  static final routes = [
    // trang đăng nhập
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBindding(),
    ),

    // trang đăng ký
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      binding: RegisterBindding(),
    ),

    // màng hình chính
    GetPage(
      name: Routes.main,
      page: () => const MainPage(),
      binding: MainBindding(),
    ),

    // màng hình chờ loading
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),

    //Trang quên mật khẩu

    GetPage(
      name: Routes.forgetpass,
      page: () => const ForgetPasswordPage(),
      binding: ForgetPasswordBinding(),
    ),

    //trang profile
    GetPage(
      name: Routes.profile,
      page: () => const ProfilePage(),
      binding: ProfileBindding(),
    ),

    //trang setting account
    GetPage(
      name: Routes.accountSetting,
      page: () => const AccountSettingPage(),
      binding: AccountSettingBinding(),
    ),

    // =====================  ROUTE POST =====================

    //màng hình đăng bài viết
    GetPage(
      name: Routes.uploadPostPage,
      page: () => const UploadPage(),
      binding: UploadBinding(),
    ),

    // màng hình lấy vị trí cửa hàng trong bài viết
    GetPage(
      name: Routes.getLoactionPage,
      page: () => const LocationPage(),
      binding: LocationBinding(),
    ),
    
    // màng hình hiển thị Maps
    GetPage(
      name: Routes.maps,
      page: () => const MapsPage(),
      binding: MapsBinding(),
    ),

    

  ];
}
