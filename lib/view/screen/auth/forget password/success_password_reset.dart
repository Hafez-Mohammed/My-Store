import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/view/widget/auth/sign_button.dart';
import 'package:my_store/view/widget/auth/title.dart';

class SuccessPasswordReset extends StatelessWidget {
  const SuccessPasswordReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                20.verticalSpace,
                AuthTitle(text: "38".tr),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20.h),
                  child: Icon(Icons.check_circle_outline_outlined,size: 150.r,color: Colors.green,),
                ),
                Text(
              "39".tr,
              style: TextStyle(
                  color: Colors.blue, fontSize: 16.sp, fontWeight: FontWeight.bold),
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
        ));
  }
}
