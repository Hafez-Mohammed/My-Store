import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constants/app_theme.dart';
import 'package:my_store/core/services/app_services.dart';

class LocaleController extends GetxController {
  AppServices services = Get.find();
  Locale? language;
  late ThemeData appTheme;
  @override
  void onInit() {
    String? cashedLang = services.preferences.getString('codeLang');
    if (cashedLang == "ar") {
      language = Locale(cashedLang!);
      appTheme = AppTheme.arabicLightTheme;
    } else if (cashedLang == "en") {
      language = Locale(cashedLang!);
      appTheme = AppTheme.englishLightTheme;
    } else {
      language = Get.deviceLocale;
      appTheme = AppTheme.englishLightTheme;
    }
    super.onInit();
  }

  changeLanguage(String codeLang) {
    Get.updateLocale(Locale(codeLang));
    appTheme = (codeLang == "ar")
        ? AppTheme.arabicLightTheme
        : AppTheme.englishLightTheme;
    Get.changeTheme(appTheme);
    services.preferences.setString('codeLang', codeLang);
  }
}
