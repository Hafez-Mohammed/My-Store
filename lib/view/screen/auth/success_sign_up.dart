import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/view/widget/auth/sign_button.dart';
import 'package:my_store/view/widget/auth/title.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
          child: Column(
            children: [
              AuthTitle(text: "38".tr),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Icon(
                  Icons.check_circle_outline_outlined,
                  size: 150.r,
                  color: Colors.green,
                ),
              ),
              Text(
                "41".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
              30.verticalSpace,
              Text(
                "42".tr,
                style:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 18.sp),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: SizedBox(
                  width: Get.width,
                  child: SignButton(
                    text: "40".tr,
                    onPressed: () {
                      Get.offNamed(AppRoutes.login);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
