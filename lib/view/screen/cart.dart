import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                padding: EdgeInsets.only(top: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    30.horizontalSpace,
                    const Expanded(child: CartTitle()),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
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
                          iconSize: 25.r,
                          color: AppColors.homeIconGreyColor,
                          icon: const Icon(Icons.discount)),
                    )
                  ],
                )),
            Stack(children: [
              Container(
                height: (Get.height - 146.3).h,
                decoration: BoxDecoration(
                    color: AppColors.homeBackgroundColor,
                    borderRadius: BorderRadius.circular(40).r),
              ),
              Container(
                  margin: EdgeInsets.only(top: 30.h),
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
                          : const Center(
                              child: Text("There is not any product"),
                            )),
              Positioned(
                left: -10,
                right: -10,
                bottom: -20,
                child: Column(
                  children: [
                    const CashInfoRow(),
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "${controller.total}\$",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 22.sp),
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
