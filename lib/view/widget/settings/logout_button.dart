import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/constants/app_colors.dart';

class LogoutButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const LogoutButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40.h,
      minWidth: 200.w,
      color: AppColors.onboardingMainColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20).r),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16.sp),
      ),
    );
  }
}
