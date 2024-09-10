// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_store/core/constants/app_colors.dart';

class SignButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const SignButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColors.onboardingMainColor,
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 7,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
