import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/onboarding_controller.dart';
import 'package:my_store/core/constants/app_colors.dart';
import 'package:my_store/data/data_source/static/statics.dart';

class CustomSlider extends GetView<OnboardingControllerImp> {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: onboardingList.length,
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onChange(value);
      },
      itemBuilder: (context, index) => Column(
        children: [
          // image of page
          Container(
              margin: const EdgeInsets.only(top: 100),
              width: double.infinity,
              height: 230,
              child: Image.asset(onboardingList[index].image!)),
          const SizedBox(
            height: 30,
          ),
          // title
          Text(
            onboardingList[index].title!,
            style: const TextStyle(
              color: AppColors.onboardingMainColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          // text body
          Text(
            onboardingList[index].body!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              height: 1.2,
              color: AppColors.onboardingBodyColor,
              fontSize: 16,
              fontWeight: FontWeight.bold)
          ),
        ],
      ),
    );
  }
}
