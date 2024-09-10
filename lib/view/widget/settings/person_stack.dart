import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constants/app_colors.dart';

class PersonStack extends StatelessWidget {
  const PersonStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: Get.width / 3,
          decoration:  BoxDecoration(color: AppColors.onboardingMainColor.withOpacity(0.7)),
        ),
        Positioned(
            top: Get.width / 4.5,
            left: Get.width / 2.5,
            child: const CircleAvatar(
              radius: 40,
              child: Icon(
                Icons.person_2,
                size: 40,
                color: Colors.black,
              ),
            )),
        Positioned(
            top: Get.width / 2.2,
            child: Container(
                width: Get.width,
                alignment: Alignment.center,
                child: const Text("Hafez Mohammed"))),
      ],
    );
  }
}
