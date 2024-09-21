import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/product_details_controller.dart';
import 'package:my_store/core/constants/app_colors.dart';

class ColorsComponent extends StatelessWidget {
  const ColorsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => 
        controller.color.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Colors",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                            controller.color.length,
                            (index) => InkWell(
                                  borderRadius: BorderRadius.circular(25).r,
                                  onTap: () {
                                    controller.changeColor(index);
                                  },
                                  child: Container(
                                    width: 25.r,
                                    height: 25.r,
                                    margin: const EdgeInsets.all(5).r,
                                    decoration: BoxDecoration(
                                        color: controller.standardColors[
                                            controller.color[index]],
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1.5.r,
                                            color:
                                                // if the color is selected rounded with blue border else black
                                                controller.selectedColorIndex ==
                                                        index
                                                    ? AppColors
                                                        .onboardingMainColor
                                                    : Colors.black)),
                                  ),
                                ))
                      ],
                    ),
                  )
                ],
              )
            : const Center()
            );
  }
}
