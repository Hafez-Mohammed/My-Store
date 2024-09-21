import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_store/controller/auth/signup_verification_controller.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_colors.dart';
import 'package:my_store/core/constants/app_image_assets.dart';
import 'package:my_store/view/widget/auth/subtitle.dart';
import 'package:my_store/view/widget/auth/title.dart';

class SignupCodeVerification extends StatelessWidget {
  const SignupCodeVerification({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupCodeVerificationController());
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: GetBuilder<SignupCodeVerificationController>(
            builder: (controller) {
              return controller.requestStatus == RequestStatus.loading
                  ? Center(
                      child: Lottie.asset(AppImageAssets.loadingLottie,
                          width: 200, height: 200))
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 50.h),
                      child: Column(
                        children: [
                          AuthTitle(text: "33".tr),
                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 40.h),
                            child: AuthSubtitle(
                                text: "${"34".tr} ${controller.email}"),
                          ),
                          30.verticalSpace,
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: OtpTextField(
                              numberOfFields: 5,
                              borderColor: AppColors.onboardingMainColor,
                              focusedBorderColor: AppColors.onboardingMainColor,
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
                          25.verticalSpace,
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
          ),
        ),
      ),
    );
  }
}
