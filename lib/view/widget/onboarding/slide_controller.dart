import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/onboarding_controller.dart';
import 'package:my_store/core/constants/app_colors.dart';
import 'package:my_store/data/data_source/static/statics.dart';

class SlideController extends StatelessWidget {
  const SlideController({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
            onboardingList.length,
            (index) => GetBuilder<OnboardingControllerImp>(
                  builder: (controller) => AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.bounceInOut,
                    width: 6.w,
                    height: 6.w,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                        color: (controller.currentPage == index)
                            ? AppColors.onboardingMainColor
                            : AppColors.onboardingBodyColor,
                        shape: BoxShape.circle),
                  ),
                ))
      ],
    );
  }
}
