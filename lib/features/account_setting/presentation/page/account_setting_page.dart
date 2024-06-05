import 'package:find_food/core/routes/routes.dart';
import 'package:find_food/core/ui/widgets/appbar/account_setting_appbar.dart.dart';
import 'package:find_food/features/account_setting/presentation/controller/account_setting_controller.dart';
import 'package:find_food/features/maps/location/models/place_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSettingPage extends GetView<AccountSettingController> {
  const AccountSettingPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const AccountSettingAppbar(),
      body: _buildAcountSettingPage(controller),
    );
  }
  
  SingleChildScrollView _buildAcountSettingPage(AccountSettingController controller) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: AccountSettingList(controller),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Column AccountSettingList(AccountSettingController controller) {
    print(controller.place);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        _buildTitleText(titleText: "YOUR ACCOUNT"),
        _buildSection(
          controller:controller,
          icon: Icons.person,
          title: "Profile Information",
          subtitle: "Change your account profile information",
          sectionIcon: Icons.arrow_forward_ios,
          route: Routes.settingInformation,
        ),
        _buildSection(
          controller:controller,
          icon: Icons.lock,
          title: "Change password",
          subtitle:"Change your current password",
          sectionIcon: Icons.arrow_forward_ios,
          route: Routes.changePassword,
        ),
        _buildSection(
          controller:controller,
          icon: Icons.location_on,
          title: "Location",
          subtitle:"Add or chang your location",
          sectionIcon: Icons.arrow_forward_ios,
          route: Routes.getLoactionPage,
        ),

        _buildSection(
          controller:controller,
          icon: Icons.facebook,
          title: "Social account",
          subtitle: "Add Facebook, Twitter, etc.",
          sectionIcon: Icons.arrow_forward_ios,
          route: "",
        ),
        const SizedBox(height: 30),
        _buildTitleText(titleText: "RESTAURANT"),
        _buildSection(
          controller:controller,
          icon: Icons.store_mall_directory_rounded,
          title: "Restaurant",
          subtitle: "Change or create your restaurant information",
          sectionIcon: Icons.arrow_forward_ios,
          route: Routes.createRestaurant,
        ),
        const SizedBox(height: 30),
        _buildTitleText(titleText: "MORE"),
        _buildSection(
          controller:controller,
          icon: Icons.star,
          title: "Rate us",
          subtitle: "Rate us on GooglePlay or App Store",
          sectionIcon: Icons.arrow_forward_ios,
          route: "",
        ),
        _buildSection(
          controller:controller,
          icon: Icons.book,
          title: "FAQ",
          subtitle: "Frequently asked questions",
          sectionIcon: Icons.arrow_forward_ios,
          route: "",
        ),
        _buildSection(
          controller:controller,
          icon: Icons.policy,
          title: "About us",
          subtitle: "About us or policy and insurance",
          sectionIcon: Icons.arrow_forward_ios,
          route: "",
        ),
        _buildSection(
          controller:controller,
          icon: Icons.logout,
          title: "Logout",
          subtitle: "",
          sectionIcon: Icons.arrow_forward_ios,
          route: "",
          onTap: () async {
            await AccountSettingController.logoutUser();
          },
        ),
      ],
    );
  }

  Padding _buildTitleText({required String titleText}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        titleText,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      ),
    );
  }
}

Widget _buildSection({
  required AccountSettingController controller,
  required IconData icon,
  required String title,
  required String subtitle,
  required IconData sectionIcon,
  required String route,
  Function? onTap,
  Widget? trailingWidget,
}) {
  return ListTile(
    leading: Icon(icon, size: 24.0),
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 15.0,
      ),
    ),
    subtitle: Text(subtitle,
        style: const TextStyle(
          fontSize: 11.0,
        )),
    trailing: trailingWidget ?? Icon(sectionIcon),
    onTap: onTap != null
        ? () => onTap()
        : () async {
            if (route.isNotEmpty) {
              final result = await Get.toNamed(route);
              if (result != null) {
                controller.saveLocation(result);
              }
            }
          },
  );
}
