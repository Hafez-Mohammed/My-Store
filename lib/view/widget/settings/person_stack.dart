import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/settings_controller.dart';
import 'package:my_store/core/constants/app_colors.dart';

class PersonStack extends GetView<SettingsController> {
  const PersonStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: Get.width / 3,
          decoration: BoxDecoration(
              color: AppColors.onboardingMainColor.withOpacity(0.7)),
        ),
        Positioned(
            top: Get.width / 4.5,
            left: Get.width / 2.5,
            child: CircleAvatar(
              radius: 40.r,
              child: Icon(
                Icons.person_2,
                size: 40.r,
                color: Colors.black,
              ),
            )),
        Positioned(
            top: Get.width / 2.2,
            child: Container(
                width: Get.width,
                alignment: Alignment.center,
                child: Text(controller.username!))),
      ],
    );
  }
}
