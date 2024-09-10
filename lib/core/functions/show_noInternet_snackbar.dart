import 'package:flutter/material.dart';
import 'package:get/get.dart';

showNoInternetSnackbar() {
  Get.snackbar("", "56".tr,
      icon: const Icon(
        Icons.wifi_off,
        color: Colors.green,
        size: 40,
      ),
      titleText:  Text(
        "58".tr,
        style:const TextStyle(fontSize: 20, color: Colors.red),
      ));
}
