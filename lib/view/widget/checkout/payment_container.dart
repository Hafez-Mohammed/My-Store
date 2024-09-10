// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_store/core/constants/app_colors.dart';

class PaymentContainer extends StatelessWidget {
  final String text;
  final bool isSelected;

  const PaymentContainer(
      {super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: isSelected
              ? AppColors.onboardingMainColor.withOpacity(0.2)
              : null,
          border: Border.all(color: AppColors.onboardingMainColor),
          borderRadius: BorderRadius.circular(25)),
      child: Text(
        text,
        style: TextStyle(color: Colors.orangeAccent),
      ),
    );
  }
}
