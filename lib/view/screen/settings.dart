// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/settings_controller.dart';
import 'package:my_store/view/widget/settings/logout_button.dart';
import 'package:my_store/view/widget/settings/notification_card.dart';
import 'package:my_store/view/widget/settings/person_stack.dart';
import 'package:my_store/view/widget/settings/setting_card.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SettingsController());
    SettingsController controller = Get.find();
    return ListView(
      children: [
        PersonStack(),
        SizedBox(
          height: 80,
        ),
        NotificationCard(
          onSwitchChanged: (value) {},
        ),
        SettingCard(
          text: "Address",
          icon: Icons.location_on_outlined,
          onTap: () {
            controller.goToAddresses();
          },
        ),
        SettingCard(
          text: "Language",
          icon: Icons.language_outlined,
          onTap: () {},
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
        SizedBox(
          height: 20,
        ),
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
    );
  }
}
