import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/localization/locale_controller.dart';
import 'package:my_store/view/widget/language_button.dart';

class ChooseLanguage extends GetView<LocaleController> {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "1".tr,
              style:  TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          30.verticalSpace,
          SizedBox(
            width: 150.w,
            child: LanguageButton(
              text: "2".tr,
              onPressed: () {
                controller.changeLanguage("en");
                Get.offNamed(AppRoutes.onboarding);
              },
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 150.w,
            child: LanguageButton(
              text: "3".tr,
              onPressed: () {
                controller.changeLanguage("ar");
                Get.offNamed(AppRoutes.onboarding);
              },
            ),
          ),
        ],
      ),
    );
  }
}
