import 'package:find_food/core/routes/routes.dart';
import 'package:find_food/features/account_setting/di/account_setting_binding.dart';
import 'package:find_food/features/account_setting/nav/change_password/di/change_password_binding.dart';
import 'package:find_food/features/account_setting/nav/change_password/presentation/page/change_password_page.dart';
import 'package:find_food/features/account_setting/nav/setting_information/di/setting_information_binding.dart';
import 'package:find_food/features/account_setting/nav/setting_information/presentation/page/setting_information_page.dart';
import 'package:find_food/features/account_setting/presentation/page/account_setting_page.dart';
import 'package:find_food/features/auth/forget_password/di/forget_password_binding.dart';
import 'package:find_food/features/auth/forget_password/presentation/page/forget_password_page.dart';
import 'package:find_food/features/auth/login/di/login_binding.dart';
import 'package:find_food/features/auth/login/presentation/page/login_page.dart';
import 'package:find_food/features/auth/register/di/register_binding.dart';
import 'package:find_food/features/auth/register/presentation/page/register_page.dart';
import 'package:find_food/features/find_post/result_search/di/resutl_search_binding.dart';
import 'package:find_food/features/find_post/result_search/presentation/page/result_search_page.dart';
import 'package:find_food/features/main/di/main_binding.dart';
import 'package:find_food/features/main/presentation/page/main_page.dart';
import 'package:find_food/features/maps/location/di/location_binding.dart';
import 'package:find_food/features/maps/location/presentation/page/location_page.dart';
import 'package:find_food/features/maps/maps/di/maps_binding.dart';
import 'package:find_food/features/maps/maps/presentation/page/maps_page.dart';
import 'package:find_food/features/nav/notify/di/notify_binding.dart';
import 'package:find_food/features/nav/notify/nav/news_notify/di/news_notify_binding.dart';
import 'package:find_food/features/nav/notify/nav/news_notify/presentation/page/news_notify_page.dart';
import 'package:find_food/features/nav/notify/nav/notify_setting/di/notify_setting_binding.dart';
import 'package:find_food/features/nav/notify/nav/notify_setting/presentation/page/notify_setting_page.dart';
import 'package:find_food/features/nav/notify/nav/social_notify/di/social_notify_binding.dart';
import 'package:find_food/features/nav/notify/nav/social_notify/presentation/page/social_notify_page.dart';
import 'package:find_food/features/nav/notify/presentation/page/notify_page.dart';
import 'package:find_food/features/nav/post/upload/di/upload_binding.dart';
import 'package:find_food/features/nav/post/upload/presentation/page/upload_page.dart';
import 'package:find_food/features/nav/profile/di/profile_binding.dart';
import 'package:find_food/features/nav/profile/presentation/page/profile_page.dart';
import 'package:find_food/features/posts_detail/di/posts_detail_binding.dart';
import 'package:find_food/features/posts_detail/presentation/page/posts_detail_page.dart';
// import 'package:find_food/features/posts_detail/nav/bottom_post_detail.dart/di/presentation/page/bottom_posts_detail_page.dart';
// import 'package:find_food/features/posts_detail/nav/top_post_detail.dart/presentation/page/top_post_detail_page.dart';
// import 'package:find_food/features/posts_detail/presentation/page/post_detail_page.dart';
import 'package:find_food/features/restaurant/di/restaurant_binding.dart';
import 'package:find_food/features/restaurant/pressentation/page/restaurant_page.dart';
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
      page: () => LoginPage(),
      binding: LoginBindding(),
    ),

    // trang đăng ký
    GetPage(
      name: Routes.register,
      page: () => RegisterPage(),
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

    //trang setting information
    GetPage(
      name: Routes.settingInformation,
      page: () => const SettingInformationPage(),
      binding: SettingInformationBinding(),
    ),

    //trang change password
    GetPage(
      name: Routes.changePassword,
      page: () => const ChangePasswordPage(),
      binding: ChangePasswordBinding(),
    ),

    //trang notifications
    GetPage(
      name: Routes.notify,
      page: () => const NotifyPage(),
      binding: NotifyBinding(),
    ),

    //trang social notify
    GetPage(
      name: Routes.socialNotify,
      page: () => SocialNotifyPage(),
      binding: SocialNotifyBinding(),
    ),

    //trang news notify
    GetPage(
      name: Routes.newsNotify,
      page: () => NewsNotifyPage(),
      binding: NewsNotifyBinding(),
    ),

    //trang Notify Settings
    GetPage(
      name: Routes.notifySetting,
      page: () => const NotifySettingPage(),
      binding: NotifySettingBinding(),
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

    // màng hình tìm kiếm
    GetPage(
      name: Routes.resultSearch,
      page: () => const ResultSearchPage(),
      binding: ResultSearchBinding(),
    ),

    // màng hình tìm kiếm
    GetPage(
      name: Routes.postsDetail,
      page: () => PostsDetailPage(),
      binding: PostsDetailBinding(),
    ),

    //restaurant page
    GetPage(
      name: Routes.restaurant,
      page: () => RestaurantPage(),
      binding: RestaurantBinding(),
    ),
  ];
}
