import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/constants/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final FocusNode focusNode;
  final bool? isObsecure;
  final TextInputType? keyboardType;
  const AppTextFormField(
      {super.key,
      required this.hint,
      this.controller,
      this.validator,
      required this.focusNode,
      this.isObsecure,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      focusNode: focusNode,
      onTap: () => {FocusScope.of(context).requestFocus(focusNode)},
      cursorColor: AppColors.onboardingMainColor,
      obscureText: isObsecure == null ? false : isObsecure!,
      keyboardType: keyboardType,
      style: TextStyle(
          fontSize: 14.sp,
          color: focusNode.hasFocus
              ? AppColors.onboardingMainColor
              : AppColors.onboardingBodyColor),
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.onboardingBodyColor),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15.h)),
    );
  }
}
