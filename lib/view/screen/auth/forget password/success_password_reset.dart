// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/view/widget/auth/sign_button.dart';
import 'package:my_store/view/widget/auth/title.dart';

class SuccessPasswordReset extends StatelessWidget {
  const SuccessPasswordReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                AuthTitle(text: "38".tr),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Icon(Icons.check_circle_outline_outlined,size: 150,color: Colors.green,),
                ),
                Text(
              "39".tr,
              style: TextStyle(
                  color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                width: double.infinity,
                child: SignButton(
                  text: "40".tr,
                  onPressed: () {
                    Get.offNamed(AppRoutes.login);
                  },
                ),
              ),
            )
              ],
            ),
          ),
        ));
  }
}
