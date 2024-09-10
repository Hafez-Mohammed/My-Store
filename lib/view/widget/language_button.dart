import 'package:flutter/material.dart';
import 'package:my_store/core/constants/app_colors.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key, required this.text,this.onPressed});
  final String text;
  final void Function()? onPressed;
  
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColors.onboardingMainColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
