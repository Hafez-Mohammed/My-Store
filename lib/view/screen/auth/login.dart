// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_store/controller/auth/login_controller.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_image_assets.dart';
import 'package:my_store/core/functions/alert_app_exit.dart';
import 'package:my_store/core/functions/input_validator.dart';
import 'package:my_store/view/widget/auth/custom_text_form_filed.dart';
import 'package:my_store/view/widget/auth/sign_button.dart';
import 'package:my_store/view/widget/auth/social_sign_button.dart';
import 'package:my_store/view/widget/auth/subtitle.dart';
import 'package:my_store/view/widget/auth/title.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => alertAppExit(),
      child: Scaffold(body: SafeArea(
        child: GetBuilder<LoginController>(
          builder: (controller) {
            return controller.requestStatus == RequestStatus.loading
                ? Center(
                    child: Lottie.asset(AppImageAssets.loadingLottie,
                        width: 200, height: 200))
                : Padding(
                  padding: const EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // the image at the head of page
                        Image.asset(
                          AppImageAssets.loginImage,
                          width: 130,
                          height: 130,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        // the title
                        AuthTitle(text: '11'.tr),
                        // the subtitle
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 30),
                          child: AuthSubtitle(text: '12'.tr),
                        ),
                        // the form of user information
                        Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                CustomTextFormFiled(
                                  validator: (value) {
                                    return inputValidate(
                                        value, "email", 10, 100, null);
                                  },
                                  controller: controller.email!,
                                  hint: "13".tr,
                                  isObsecure: false,
                                  icon: Icons.person_outline_sharp,
                                  focusNode: controller.emailFocusNode!,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomTextFormFiled(
                                  validator: (value) {
                                    return inputValidate(
                                        value, "password", 6, 30, null);
                                  },
                                  controller: controller.password!,
                                  hint: "14".tr,
                                  isObsecure: true,
                                  onIconTap: () {
                                    controller.hidePassword();
                                  },
                                  icon: Icons.lock_outline_rounded,
                                  focusNode: controller.passwordFocusNode!,
                                ),
                              ],
                            )),
                        // end of form
                        Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(top: 10, bottom: 20),
                          child: InkWell(
                              onTap: () {
                                controller.toForgotPassword();
                              },
                              child: Text(
                                "15".tr,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              )),
                        ),
                        SignButton(
                          text: "16".tr,
                          onPressed: () {
                            controller.login();
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            "17".tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Colors.grey[400],
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                          ),
                        ),
                        // social sign buttons
                        Row(
                          children: [
                            Spacer(),
                            SocialSignButton(
                              text: "18".tr,
                              color: const Color.fromARGB(255, 14, 81, 137),
                              icon: Icons.facebook_outlined,
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            SocialSignButton(
                              text: "19".tr,
                              color: Color.fromARGB(255, 235, 83, 12),
                              icon: Icons.g_mobiledata_rounded,
                              onPressed: () {},
                            ),
                            Spacer(),
                          ],
                        ),
                        // end social sign buttons
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '20'.tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize: 14),
                            ),
                            SizedBox(width: 5),
                            InkWell(
                              onTap: () {
                                controller.toSignUp();
                              },
                              child: Text(
                                '21'.tr,
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 14),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
          },
        ),
      )),
    );
  }
}
