import 'package:flutter/material.dart';
import 'package:my_store/core/constants/app_colors.dart';

class LogoutButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const LogoutButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      minWidth: 200,
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
