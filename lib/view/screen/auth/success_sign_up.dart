// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/view/widget/auth/sign_button.dart';
import 'package:my_store/view/widget/auth/title.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                    children: [
              AuthTitle(text: "38".tr),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Icon(
                  Icons.check_circle_outline_outlined,
                  size: 150,
                  color: Colors.green,
                ),
              ),
              Text(
                "41".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30,),
              Text("42".tr,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18),),
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
          ),
        ));
  }
}
