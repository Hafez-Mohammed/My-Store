

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/onboarding_controller.dart';
import 'package:my_store/view/widget/onboarding/custom_slider.dart';
import 'package:my_store/view/widget/onboarding/next_button.dart';
import 'package:my_store/view/widget/onboarding/slide_controller.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
          body: SafeArea(
              child: Column(
        children:  [
          const Expanded(
            child:const CustomSlider()
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 30.h),
            child: const Row(
              children: [
               SlideController(),
                Spacer(),
                NextButton()
              ],
            ),
          )
        ],
      ))),
    );
  }
}
