import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/product_details_controller.dart';
import 'package:my_store/core/constants/app_colors.dart';

class QuantityComponent extends StatelessWidget {
  const QuantityComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Quantity",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black),
                ),
                Container(
                  margin: const EdgeInsets.all(5).r,
                  height: 40.h,
                  width: 130.w,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.increaseQuantity();
                        },
                        icon: Icon(
                          Icons.add,
                          size: 25.r,
                          color: AppColors.onboardingMainColor,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          color: const Color.fromARGB(255, 224, 231, 236),
                          child: Text(
                            "${controller.quantity}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.decreaseQuantity();
                        },
                        iconSize: 25.r,
                        icon: const Icon(
                          Icons.remove,
                          color: AppColors.onboardingMainColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ));
  }
}
