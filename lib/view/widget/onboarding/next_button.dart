import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/onboarding_controller.dart';
import 'package:my_store/core/constants/app_colors.dart';

class NextButton extends GetView<OnboardingControllerImp> {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45.h,
        decoration: BoxDecoration(
            border: const Border(
                right: BorderSide(color: AppColors.onboardingBodyColor),
                top: BorderSide(color: AppColors.onboardingBodyColor),
                bottom: BorderSide(color: AppColors.onboardingBodyColor)),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            MaterialButton(
              height: 45.h,
              onPressed: () {
                controller.next();
              },
              color: AppColors.onboardingMainColor,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      color: AppColors.onboardingMainColor,
                      strokeAlign: BorderSide.strokeAlignOutside),
                  borderRadius: BorderRadius.circular(20)),
              child:  Text(
                "10".tr,
                style:  TextStyle(color: Colors.white,fontSize: 14.sp),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.onboardingMainColor,
              size: 20,
            ),
            const Icon(
              Icons.keyboard_double_arrow_right,
              color: AppColors.onboardingBodyColor,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ));
  }
}
