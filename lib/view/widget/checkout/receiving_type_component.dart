// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_store/core/constants/app_colors.dart';

class ReceivingTypeComponent extends StatelessWidget {
  final String text;
  final bool isSelected;
  final String image;
  const ReceivingTypeComponent(
      {super.key, required this.text, required this.isSelected, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 100,
          height: 100,
        ),
        Text(text),
        SizedBox(
          width: 80,
          child: isSelected
              ? Divider(
                  thickness: 2,
                  color: AppColors.onboardingMainColor,
                )
              : null,
        ),
      ],
    );
  }
}
