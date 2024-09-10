// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_store/controller/auth/forget%20password/forget_password_controller.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_image_assets.dart';
import 'package:my_store/core/functions/input_validator.dart';
import 'package:my_store/view/widget/auth/custom_text_form_filed.dart';
import 'package:my_store/view/widget/auth/sign_button.dart';
import 'package:my_store/view/widget/auth/subtitle.dart';
import 'package:my_store/view/widget/auth/title.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordController());
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<ForgetPasswordController>(
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
                            AuthTitle(text: "30".tr),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: AuthSubtitle(text: "31".tr),
                            ),
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
                            SizedBox(height: 30),
                            SignButton(
                              text: "32".tr,
                              onPressed: () {
                                controller.checkEmail();
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
