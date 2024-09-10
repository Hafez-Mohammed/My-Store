import 'package:flutter/material.dart';
import 'package:get/get.dart';

showServerErorrSnackbar() {
  Get.snackbar("", "57".tr,
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 40,
      ),
      titleText: Text(
        "58".tr,
        style: const TextStyle(fontSize: 20, color: Colors.red),
      ));
}
