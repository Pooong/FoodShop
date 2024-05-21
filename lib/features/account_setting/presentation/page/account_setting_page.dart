import 'package:find_food/core/configs/enum.dart';
import 'package:find_food/core/data/firebase/model/result.dart';
import 'package:find_food/core/ui/dialogs/dialogs.dart';
import 'package:find_food/features/account_setting/presentation/controller/account_setting_controller.dart';
import 'package:find_food/features/nav/profile/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSettingPage extends GetView<ProfileController> {
  const AccountSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            InkWell(onTap: () => Get.back(), child: Icon(Icons.arrow_back_ios)),
        title: const Text("Account Settings"),
        actions: [],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(0.8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSection(
                context,
                icon: Icons.person,
                title: "Profile Information",
                subtitle: "Change your account profile information",
                sectionIcon: Icons.arrow_forward_ios,
                route: "/settingInformation",
              ),
              _buildSection(
                context,
                icon: Icons.lock,
                title: "Change password",
                subtitle: "Change your current password",
                sectionIcon: Icons.arrow_forward_ios,
                route: "/changePassword",
              ),
              _buildSection(
                context,
                icon: Icons.location_on,
                title: "Location",
                subtitle: "Add or change your location",
                sectionIcon: Icons.arrow_forward_ios,
                route: "",
              ),
              _buildSection(
                context,
                icon: Icons.facebook,
                title: "Social account",
                subtitle: "Add Facebook, Twitter, .etc",
                sectionIcon: Icons.arrow_forward_ios,
                route: "",
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  paddingOnly(left: 20),
                  const Text(
                    "MORE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              _buildSection(
                context,
                icon: Icons.star,
                title: "Rate us",
                subtitle: "Rate us on GooglePlay or App Store",
                sectionIcon: Icons.arrow_forward_ios,
                route: "",
              ),
              _buildSection(
                context,
                icon: Icons.book,
                title: "FAQ",
                subtitle: "Frequency asked questions",
                sectionIcon: Icons.arrow_forward_ios,
                route: "",
              ),
              _buildSection(
                context,
                icon: Icons.policy,
                title: "About us",
                subtitle: "About us or policy and insurance",
                sectionIcon: Icons.arrow_forward_ios,
                route: "",
              ),
              _buildSection(
                context,
                icon: Icons.logout,
                title: "Logout",
                subtitle: "",
                sectionIcon: Icons.arrow_forward_ios,
                route: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSection(BuildContext context,
    {required IconData icon,
    required String title,
    required String subtitle,
    required IconData sectionIcon,
    required String route,
    Function? onTap,
    Widget? trailingWidget}) {
  return ListTile(
    leading: Icon(icon, size: 24.0),
    title: Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    subtitle: Text(
      subtitle,
      style: Theme.of(context).textTheme.bodySmall,
    ),
    trailing: trailingWidget != null ? trailingWidget : Icon(sectionIcon),
    onTap: onTap != null
        ? () => onTap()
        : () {
            if (route != null) {
              Get.toNamed(route);
            }
          },
  );
}

Widget _buildSection3(BuildContext context,
    {required IconData icon,
    required String title,
    required String subtitle,
    required IconData sectionIcon,
    required String route,
    Widget? trailingWidget}) {
  return ListTile(
    leading: Icon(icon, size: 24.0),
    title: Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    subtitle: Text(
      subtitle,
      style: Theme.of(context).textTheme.bodySmall,
    ),
    trailing: trailingWidget != null ? trailingWidget : Icon(sectionIcon),
  );
}
