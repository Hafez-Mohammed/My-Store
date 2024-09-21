import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              margin:  EdgeInsets.only(top: 100.h),
              height: 230.h,
              child: Image.asset(onboardingList[index].image!)),
          30.verticalSpace,
          // title
          Text(
            onboardingList[index].title!,
            style:  TextStyle(
              color: AppColors.onboardingMainColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          // text body
          Text(
            onboardingList[index].body!,
            textAlign: TextAlign.center,
            style:  TextStyle(
              height: 1.2,
              color: AppColors.onboardingBodyColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold)
          ),
        ],
      ),
    );
  }
}
