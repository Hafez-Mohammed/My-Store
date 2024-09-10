import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/product_details_controller.dart';
import 'package:my_store/core/constants/app_colors.dart';

class ColorsComponent extends StatelessWidget {
  const ColorsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => controller.color.isNotEmpty
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
                                  borderRadius: BorderRadius.circular(25),
                                  onTap: () {
                                    controller.changeColor(index);
                                  },
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: controller.standardColors[
                                            controller.color[index]],
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1.5,
                                            color: controller
                                                        .selectedColorIndex ==
                                                    index
                                                ? AppColors.onboardingMainColor
                                                : Colors.black)),
                                  ),
                                ))
                      ],
                    ),
                  )
                ],
              )
            : Center());
  }
}
