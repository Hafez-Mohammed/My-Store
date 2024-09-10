import 'package:flutter/material.dart';
import 'package:my_store/core/constants/app_colors.dart';

class CustomAppButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomAppButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColors.onboardingMainColor,
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 3,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
