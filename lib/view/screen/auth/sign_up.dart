import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_store/controller/auth/login_controller.dart';
import 'package:my_store/controller/auth/signup_controller.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_image_assets.dart';
import 'package:my_store/core/functions/input_validator.dart';
import 'package:my_store/view/widget/auth/custom_text_form_filed.dart';
import 'package:my_store/view/widget/auth/sign_button.dart';
import 'package:my_store/view/widget/auth/subtitle.dart';
import 'package:my_store/view/widget/auth/title.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    LoginController loginController = Get.find();
    return Scaffold(body: SafeArea(
      child: GetBuilder<SignUpController>(
        builder: (controller) {
          return controller.requestStatus == RequestStatus.loading
              ? Center(
                  child: Lottie.asset(AppImageAssets.loadingLottie,
                      width: 200, height: 200))
              : Padding(
                  padding: const EdgeInsets.all(30).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // the title
                      AuthTitle(text: '22'.tr),
                      // the subtitle
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
                        child: AuthSubtitle(text: '23'.tr),
                      ),
                      // the form of user information
                      Expanded(
                          child: ListView(
                        children: [
                          Form(
                              key: controller.formKey,
                              child: Column(
                                children: [
                                  CustomTextFormFiled(
                                    validator: (value) {
                                      return inputValidate(
                                          value, "user name", 4, 30, null);
                                    },
                                    controller: controller.userName!,
                                    hint: "24".tr,
                                    isObsecure: false,
                                    icon: Icons.person_outline_sharp,
                                    focusNode: controller.nameFocusNode!,
                                  ),
                                  20.verticalSpace,
                                  CustomTextFormFiled(
                                    validator: (value) {
                                      return inputValidate(
                                          value, "email", 10, 100, null);
                                    },
                                    controller: controller.email!,
                                    hint: "13".tr,
                                    isObsecure: false,
                                    icon: Icons.email_outlined,
                                    focusNode: controller.emailFocusNode!,
                                  ),
                                  20.verticalSpace,
                                  CustomTextFormFiled(
                                    validator: (value) {
                                      return inputValidate(
                                          value, "phone", 10, 20, null);
                                    },
                                    controller: controller.phone!,
                                    hint: "25".tr,
                                    isObsecure: false,
                                    icon: Icons.phone_android_outlined,
                                    focusNode: controller.phoneFocusNode!,
                                    keyboardType: TextInputType.phone,
                                  ),
                                  20.verticalSpace,
                                  CustomTextFormFiled(
                                    validator: (value) {
                                      return inputValidate(
                                          value, "password", 6, 30, null);
                                    },
                                    controller: controller.password!,
                                    hint: "14".tr,
                                    isObsecure: true,
                                    onIconTap: () {
                                      loginController.hidePassword();
                                    },
                                    icon: Icons.lock_outline_rounded,
                                    focusNode: controller.passwordFocusNode!,
                                  ),
                                  20.verticalSpace,
                                  CustomTextFormFiled(
                                    validator: (value) {
                                      return inputValidate(
                                          value,
                                          "confirm password",
                                          6,
                                          30,
                                          controller.password!.text);
                                    },
                                    controller: controller.confirmPassword!,
                                    hint: "26".tr,
                                    isObsecure: true,
                                    onIconTap: () {
                                      loginController.hidePassword();
                                    },
                                    icon: Icons.lock_outline_rounded,
                                    focusNode:
                                        controller.confpasswordFocusNode!,
                                  ),
                                ],
                              )),
                          // end of form
                          20.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.h, horizontal: 80.w),
                            child: SignButton(
                              text: "27".tr,
                              onPressed: () {
                                controller.signUp();
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '28'.tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    fontSize: 14.sp),
                              ),
                              const SizedBox(width: 5),
                              InkWell(
                                onTap: () {
                                  controller.toLogin();
                                },
                                child: Text(
                                  '29'.tr,
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 14.sp),
                                ),
                              )
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                );
        },
      ),
    ));
  }
}
