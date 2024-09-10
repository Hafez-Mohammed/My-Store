import 'package:flutter/material.dart';
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
                  margin: const EdgeInsets.all(5),
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.increaseQuantity();
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 25,
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
                        iconSize: 25,
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
