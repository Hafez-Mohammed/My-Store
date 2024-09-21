// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/constants/app_colors.dart';

class SignButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const SignButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColors.onboardingMainColor,
        padding: EdgeInsets.all(10).w,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30).w),
        elevation: 5,
        child: Text(
          text,
          style:  TextStyle(
              color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
