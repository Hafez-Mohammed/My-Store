import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/checkout_controller.dart';
import 'package:my_store/core/constants/app_colors.dart';

class AddressCard extends StatelessWidget {
  final int index;
  const AddressCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutControllerImp>(
      builder: (controller) => Card(
        color: controller.deliveryAddress != null
            ? controller.deliveryAddress!.name ==
                    controller.addresses[index].name!
                ? AppColors.onboardingMainColor.withOpacity(0.5)
                : null
            : null,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            controller.addresses[index].name!,
            style: TextStyle(
              color: controller.deliveryAddress != null
                  ? controller.deliveryAddress!.name ==
                          controller.addresses[index].name!
                      ? Colors.white
                      : null
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
