import 'package:flutter/material.dart';
import 'package:get/get.dart';

showErorrDialog(String message){
  Get.defaultDialog(
            title: "58".tr,
            middleText: message,
            onCancel: () {},
            textCancel: "70".tr,
            titleStyle: const TextStyle(
                fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold));
}