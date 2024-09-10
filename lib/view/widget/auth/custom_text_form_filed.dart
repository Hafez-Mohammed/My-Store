import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/auth/login_controller.dart';

import 'package:my_store/core/constants/app_colors.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? Function(String?)? validator;
  final bool isObsecure;
  final TextInputType? keyboardType;
  final void Function()? onIconTap;
  const CustomTextFormFiled(
      {super.key,
      required this.hint,
      required this.icon,
      required this.controller,
      this.validator,
      required this.focusNode,
      required this.isObsecure,
      this.keyboardType,
      this.onIconTap});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (loginController) => TextFormField(
        controller: controller,
        validator: validator,
        focusNode: focusNode,
        onTap: () => {FocusScope.of(context).requestFocus(focusNode)},
        cursorColor: AppColors.onboardingMainColor,
        obscureText: isObsecure ? !loginController.showPassword : isObsecure,
        keyboardType: keyboardType,
        style: TextStyle(
            fontSize: 14,
            color: focusNode.hasFocus
                ? AppColors.onboardingMainColor
                : AppColors.onboardingBodyColor),
        decoration: InputDecoration(
          suffixIcon: isObsecure
              ? (loginController.showPassword)
                  ? Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: onIconTap,
                        child: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: AppColors.homeIconGreyColor,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: onIconTap,
                        child: const Icon(
                          Icons.remove_red_eye,
                          color: AppColors.homeIconGreyColor,
                        ),
                      ),
                    )
              : SizedBox(),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: InkWell(
              child: Icon(
                icon,
              ),
            ),
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.onboardingBodyColor),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
