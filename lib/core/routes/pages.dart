import 'package:find_food/core/routes/routes.dart';
import 'package:find_food/features/auth/login/di/login_binding.dart';
import 'package:find_food/features/auth/login/presentation/page/login_page.dart';
import 'package:find_food/features/auth/register/di/register_binding.dart';
import 'package:find_food/features/auth/register/presentation/page/register_page.dart';
import 'package:find_food/features/main/di/main_binding.dart';
import 'package:find_food/features/main/presentation/page/main_page.dart';
import 'package:find_food/features/splash/di/splash_binding.dart';
import 'package:find_food/features/splash/presentation/pages/splash_page.dart';
import 'package:get/get.dart';

class Pages {
  static const initial = Routes.splash;
  static const main = Routes.main;
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBindding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      binding: RegisterBindding(),
    ),
    GetPage(
      name: Routes.main,
      page: () => const MainPage(),
      binding: MainBindding(),
    ),
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
  ];
}
