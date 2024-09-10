// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_store/controller/cart_controller.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_colors.dart';
import 'package:my_store/core/constants/app_image_assets.dart';
import 'package:my_store/core/functions/input_validator.dart';
import 'package:my_store/core/shared/app_text_form_field.dart';
import 'package:my_store/view/widget/cart/cart_title.dart';
import 'package:my_store/view/widget/cart/cash_info_row.dart';
import 'package:my_store/view/widget/cart/cash_out_button.dart';
import 'package:my_store/view/widget/cart/product_card.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CartControllerImp());
    return SafeArea(
      child: GetBuilder<CartControllerImp>(
        builder: (controller) => Column(
          children: [
            Container(
                height: 70,
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: CartTitle()),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title: "Discount",
                              content: controller.couponRequestStatus ==
                                      RequestStatus.loading
                                  ? Center(
                                      child: Lottie.asset(
                                          AppImageAssets.loadingLottie,
                                          width: 200,
                                          height: 200))
                                  : Form(
                                      key: controller.formKey,
                                      child: AppTextFormField(
                                        hint: "Coupon Name",
                                        focusNode: FocusNode(),
                                        controller: controller.couponName,
                                        validator: (val) {
                                          return inputValidate(
                                              val, "normal text", 4, 20, null);
                                        },
                                      ),
                                    ),
                              onCancel: () {},
                              textConfirm: "Apply",
                              buttonColor: AppColors.onboardingMainColor,
                              onConfirm: () {
                                controller.applyCoupon();
                              },
                            );
                          },
                          iconSize: 25,
                          color: AppColors.homeIconGreyColor,
                          icon: Icon(Icons.discount)),
                    )
                  ],
                )),
            Stack(children: [
              Container(
                height: Get.height - 150,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppColors.homeBackgroundColor,
                    borderRadius: BorderRadius.circular(40)),
              ),
              Container(
                  margin: EdgeInsets.only(top: 30),
                  height: Get.height / 1.8,
                  child: controller.requestStatus == RequestStatus.loading
                      ? Center(
                          child: Lottie.asset(AppImageAssets.loadingLottie,
                              width: 200, height: 200))
                      : controller.products.isNotEmpty
                          ? ListView.builder(
                              itemCount: controller.products.length,
                              itemBuilder: (context, index) => ProductCard(
                                  model: controller.products[index]),
                            )
                          : Center(
                              child: Text("There is not any product"),
                            )),
              Positioned(
                left: -10,
                right: -10,
                bottom: -20,
                child: Column(
                  children: [
                    CashInfoRow(),
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "${controller.total}\$",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 22),
                            ),
                            CashOutButton(
                              onPressed: () {
                                controller.toCheckout();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
