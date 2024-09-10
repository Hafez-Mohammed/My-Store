import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_store/controller/address/add_address_controller.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_image_assets.dart';
import 'package:my_store/core/functions/input_validator.dart';
import 'package:my_store/core/shared/app_text_form_field.dart';
import 'package:my_store/core/shared/custom_app_button.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add address'),
        ),
        body: GetBuilder<AddAddressController>(
          builder: (controller) =>
              controller.requestStatus == RequestStatus.loading
                  ? Center(
                      child: Lottie.asset(AppImageAssets.loadingLottie,
                          width: 200, height: 200))
                  : ListView(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.location_on_rounded,
                            size: 50,
                            color: Colors.pinkAccent,
                            shadows: [
                              Shadow(
                                  blurRadius: 2,
                                  color: Colors.grey,
                                  offset: Offset(1, 1))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
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
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomAppButton(
                                    text: "Add",
                                    onPressed: () {
                                      controller.addAddress();
                                    },
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
        ));
  }
}
