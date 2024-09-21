import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/product_details_controller.dart';
import 'package:my_store/core/constants/app_colors.dart';

class SizeComponent extends StatelessWidget {
  const SizeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) =>
            controller.size.isNotEmpty
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
                                borderRadius: BorderRadius.circular(25).r,
                                onTap: () {
                                  controller.changeSize(index);
                                },
                                child: Container(
                                  width: 40.r,
                                  height: 40.r,
                                  margin: const EdgeInsets.all(5).r,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color:
                                        // if the size is selected rounded with blue border else black
                                        controller.selectedSizeIndex == index
                                            ? AppColors.onboardingMainColor
                                                .withOpacity(0.2)
                                            : null,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1.5.r,
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
            : const Center());
  }
}
