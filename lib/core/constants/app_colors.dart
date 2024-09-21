import 'package:flutter/material.dart';

class AppColors {
  static const Color onboardingMainColor = Color.fromARGB(255, 16, 121, 206);
  static const Color onboardingBodyColor = Color.fromARGB(255, 163, 163, 163);
  static const Color homeBackgroundColor = Color.fromRGBO(244, 246, 248, 1);
  static const Color homeIconGreyColor = Color.fromRGBO(130, 130, 130, 0.7);
  static Color? settingsIconColor = Colors.orange[300];
  static Color textFormFieldFocusedColor =
      MaterialStateColor.resolveWith((states) {
    if (states.contains(MaterialState.focused)) {
      return Colors.blue;
    } else {
      return AppColors.onboardingBodyColor;
    }
  });
}
