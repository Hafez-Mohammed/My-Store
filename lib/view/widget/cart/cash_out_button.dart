import 'package:flutter/material.dart';
import 'package:my_store/core/constants/app_colors.dart';

class CashOutButton extends StatelessWidget {
  final void Function()? onPressed;
  const CashOutButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColors.onboardingMainColor,
      minWidth: 150,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: const Text(
        "Check Out",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
