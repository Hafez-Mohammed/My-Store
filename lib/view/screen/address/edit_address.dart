import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_store/controller/address/edit_address_controller.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_image_assets.dart';
import 'package:my_store/core/functions/input_validator.dart';
import 'package:my_store/core/shared/app_text_form_field.dart';
import 'package:my_store/core/shared/custom_app_button.dart';

class EditAddress extends StatelessWidget {
  const EditAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditAddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit address'),
      ),
      body: GetBuilder<EditAddressController>(
        builder: (controller) => controller.requestStatus ==
                RequestStatus.loading
            ? Center(
                child: Lottie.asset(AppImageAssets.loadingLottie,
                    width: 200, height: 200))
            : ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10).r,
                    child: Icon(
                      Icons.location_on_rounded,
                      size: 50.r,
                      color: Colors.pinkAccent,
                      shadows: const [
                        Shadow(
                            blurRadius: 2,
                            color: Colors.grey,
                            offset: Offset(1, 1))
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.h, vertical: 20.h),
                    child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            AppTextFormField(
                              hint: "Name",
                              focusNode: controller.nameFocusNode!,
                              controller: controller.name,
                              validator: (value) {
                                return inputValidate(
                                    value, "normal text", 4, 10, null);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AppTextFormField(
                              hint: "City",
                              focusNode: controller.cityFocusNode!,
                              controller: controller.city,
                              validator: (value) {
                                return inputValidate(
                                    value, "normal text", 4, 10, null);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AppTextFormField(
                              hint: "Street",
                              focusNode: controller.streetFocusNode!,
                              controller: controller.street,
                              validator: (value) {
                                return inputValidate(
                                    value, "normal text", 4, 50, null);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AppTextFormField(
                              hint: "Details",
                              focusNode: controller.detailsFocusNode!,
                              controller: controller.details,
                              validator: (value) {
                                return inputValidate(
                                    value, "normal text", 4, 50, null);
                              },
                            ),
                            30.verticalSpace,
                            CustomAppButton(
                              text: "Save",
                              onPressed: () {
                                controller.editAddress();
                              },
                            )
                          ],
                        )),
                  ),
                ],
              ),
      ),
    );
  }
}
