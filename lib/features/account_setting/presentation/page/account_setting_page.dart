import 'package:find_food/core/configs/enum.dart';
import 'package:find_food/core/ui/dialogs/dialogs.dart';
import 'package:find_food/features/account_setting/presentation/controller/account_setting_controller.dart';
import 'package:find_food/features/account_setting/presentation/controller/account_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSettingPage extends GetView<AccountSettingController> {
  const AccountSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Get.back(), child: const Icon(Icons.arrow_back)),
        title: const Text("Account Settings"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                subtitle: "Add Facebook, Twitter, etc.",
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
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "MORE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                subtitle: "Frequently asked questions",
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
                onTap: () {
                  DialogsUtils.showAlertDialog(
                    title: "Đăng xuất",
                    message: "Bạn có muốn đăng xuất ?",
                    typeDialog: TypeDialog.success,
                    onPresss: () async {
                      await AccountSettingController.logoutUser();
                      Get.offAllNamed(
                          '/login'); // Điều hướng về trang đăng nhập
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSection(
  BuildContext context, {
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
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    subtitle: Text(
      subtitle,
      style: Theme.of(context).textTheme.bodySmall,
    ),
    trailing: trailingWidget ?? Icon(sectionIcon),
    onTap: onTap != null
        ? () => onTap()
        : () {
            if (route.isNotEmpty) {
              Get.toNamed(route);
            }
          },
  );
}
