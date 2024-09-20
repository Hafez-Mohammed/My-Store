import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertAppExit(){
  Get.defaultDialog(
    title: "Warning",
    titleStyle: TextStyle(color: Colors.red),
    middleText: "Do you want to exit app?",
    textConfirm: "Yes",
    buttonColor: Colors.blue,
    onConfirm: () {
      exit(0);
    },
    onCancel: () {
      Get.back();
    },
  );
}