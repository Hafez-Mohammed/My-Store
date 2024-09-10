import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/bindings/initial_bindings.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/localization/app_translation.dart';
import 'package:my_store/core/localization/locale_controller.dart';
import 'package:my_store/core/services/app_services.dart';
import 'package:my_store/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: AppTranslation(),
        locale: localeController.language,
        theme: localeController.appTheme,
        title: 'My Store',
        initialBinding: InitialBindings(),
        getPages: routes,
        initialRoute: AppRoutes.chooseLanguage,
        );
  }
}
