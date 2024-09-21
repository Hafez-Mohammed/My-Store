// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_store/controller/auth/forget%20password/code_verification_controller.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_colors.dart';
import 'package:my_store/core/constants/app_image_assets.dart';
import 'package:my_store/view/widget/auth/subtitle.dart';
import 'package:my_store/view/widget/auth/title.dart';

class CodeVerification extends StatelessWidget {
  const CodeVerification({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CodeVerificationController());
    return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
        ),
        body: GetBuilder<CodeVerificationController>(
          builder: (controller) {
            return controller.requestStatus == RequestStatus.loading
                ? Center(
                    child: Lottie.asset(AppImageAssets.loadingLottie,
                        width: 200, height: 200))
                : Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
                    child: Column(
                      children: [
                        AuthTitle(text: "33".tr),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: AuthSubtitle(
                              text: "${"34".tr} ${controller.email}"),
                        ),
                        30.verticalSpace,
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: OtpTextField(
                            numberOfFields: 5,
                            borderColor: AppColors.onboardingMainColor,
                            //set to true to show as box or false to show as dash
                            showFieldAsBox: true,
                            //runs when a code is typed in
                            onCodeChanged: (String code) {
                              //handle validation or checks here
                            },
                            //runs when every textfield is filled
                            onSubmit: (String verificationCode) {
                              controller.verifyCode(verificationCode);
                            }, // end onSubmit
                          ),
                        ),
                        20.verticalSpace,
                        InkWell(
                            onTap: () {
                              controller.resendVerificationCode();
                            },
                            child: Text(
                              "Resend Code",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  );
          },
        ));
  }
}
