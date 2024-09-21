import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/settings_controller.dart';
import 'package:my_store/core/constants/app_colors.dart';

class NotificationCard extends StatelessWidget {
  final void Function(bool)? onSwitchChanged;
  const NotificationCard({super.key, required this.onSwitchChanged});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.find();
    return GetBuilder<SettingsController>(
      builder: (controller) => Card(
        child: ListTile(
          title: const Text("Notifications"),
          leading: Icon(
            Icons.notifications_none,
            size: 25.r,
            color: AppColors.settingsIconColor,
          ),
          trailing: Switch(
            dragStartBehavior: DragStartBehavior.down,
            activeColor: Colors.blue,
            value: controller.notificationEnable!,
            onChanged: onSwitchChanged,
          ),
        ),
      ),
    );
  }
}
