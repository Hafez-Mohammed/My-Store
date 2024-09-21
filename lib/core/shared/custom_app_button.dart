import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/constants/app_colors.dart';

class CustomAppButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomAppButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColors.onboardingMainColor,
        padding: const EdgeInsets.all(10).r,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 3,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
