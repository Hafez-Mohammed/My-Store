// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_store/controller/auth/forget%20password/reset_password_controller.dart';
import 'package:my_store/controller/auth/login_controller.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_image_assets.dart';
import 'package:my_store/core/functions/input_validator.dart';
import 'package:my_store/view/widget/auth/custom_text_form_filed.dart';
import 'package:my_store/view/widget/auth/sign_button.dart';
import 'package:my_store/view/widget/auth/subtitle.dart';
import 'package:my_store/view/widget/auth/title.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordController());
    LoginController loginController = Get.find();
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<ResetPasswordController>(
          builder: (controller) {
            return controller.requestStatus == RequestStatus.loading
                ? Center(
                    child: Lottie.asset(AppImageAssets.loadingLottie,
                        width: 200, height: 200))
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            AuthTitle(text: "35".tr),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: AuthSubtitle(text: "36".tr),
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
                                loginController.hidePassword();
                              },
                              icon: Icons.lock_outline_rounded,
                              focusNode: controller.passwordFocusNode!,
                            ),
                            SizedBox(height: 20),
                            CustomTextFormFiled(
                              validator: (value) {
                                return inputValidate(value, "confirm password",
                                    6, 30, controller.password!.text);
                              },
                              controller: controller.confirmPassword!,
                              hint: "26".tr,
                              isObsecure: true,
                              onIconTap: () {
                                loginController.hidePassword();
                              },
                              icon: Icons.lock_outline_rounded,
                              focusNode: controller.confpasswordFocusNode!,
                            ),
                            SizedBox(height: 40),
                            SignButton(
                              text: "37".tr,
                              onPressed: () {
                                controller.resetPassword();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  );
          },
        ));
  }
}
