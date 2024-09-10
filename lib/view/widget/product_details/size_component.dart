import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/product_details_controller.dart';
import 'package:my_store/core/constants/app_colors.dart';

class SizeComponent extends StatelessWidget {
  const SizeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => controller.size.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Size",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black),
                  ),
                  Row(
                    children: [
                      ...List.generate(
                          controller.size.length,
                          (index) => InkWell(
                                borderRadius: BorderRadius.circular(25),
                                onTap: () {
                                  controller.changeSize(index);
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  margin: const EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: controller.selectedSizeIndex == index
                                        ? AppColors.onboardingMainColor
                                            .withOpacity(0.2)
                                        : null,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1.5,
                                        color: controller.selectedSizeIndex ==
                                                index
                                            ? AppColors.onboardingMainColor
                                            : Colors.black),
                                  ),
                                  child: Text(controller.size[index]),
                                ),
                              ))
                    ],
                  )
                ],
              )
            : Center());
  }
}
