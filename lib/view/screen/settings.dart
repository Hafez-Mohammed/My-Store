import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/settings_controller.dart';
import 'package:my_store/core/classes/handling_data_view.dart';
import 'package:my_store/core/constants/app_colors.dart';
import 'package:my_store/view/widget/settings/logout_button.dart';
import 'package:my_store/view/widget/settings/notification_card.dart';
import 'package:my_store/view/widget/settings/person_stack.dart';
import 'package:my_store/view/widget/settings/setting_card.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SettingsController());
    return GetBuilder<SettingsController>(
      builder: (controller) => HandlingDataView(
          requestStatus: controller.requestStatus2!,
          widget: ListView(
            children: [
              const PersonStack(),
              80.verticalSpace,
              NotificationCard(
                onSwitchChanged: (value) {
                  controller.switchNotificationStatus();
                },
              ),
              SettingCard(
                text: "Address",
                icon: Icons.location_on_outlined,
                onTap: () {
                  controller.goToAddresses();
                },
              ),

              // change language card
              Card(
                child: PopupMenuButton(
                  child: ListTile(
                    leading: Icon(
                      Icons.language_outlined,
                      size: 25.r,
                      color: AppColors.settingsIconColor,
                    ),
                    title: const Text("Language"),
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text("Arabic"),
                      onTap: () {
                        controller.setLangArabic();
                      },
                    ),
                    PopupMenuItem(
                      child: const Text("English"),
                      onTap: () {
                        controller.setLangEnglish();
                      },
                    ),
                  ],
                ),
              ),

              SettingCard(
                text: "About us",
                icon: Icons.info_outline,
                onTap: () {},
              ),
              SettingCard(
                text: "Contact us",
                icon: Icons.call_end_rounded,
                onTap: () {
                  controller.makePhoneCall();
                },
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LogoutButton(
                    text: "Logout",
                    onPressed: () {
                      controller.logout();
                    },
                  ),
                ],
              )
            ],
          )),
    );
  }
}
