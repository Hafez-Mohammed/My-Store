import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/services/app_services.dart';

class MyMiddleWare extends GetMiddleware {
  AppServices services = Get.find();
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (services.preferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoutes.homeScreen);
    }
    if (services.preferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
