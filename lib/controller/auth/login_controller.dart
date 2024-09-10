import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/core/functions/show_erorr_dialog.dart';
import 'package:my_store/core/functions/show_noInternet_snackbar.dart';
import 'package:my_store/core/functions/show_server_erorr_snackbar.dart';
import 'package:my_store/core/services/app_services.dart';
import 'package:my_store/data/data_source/remote/auth/login.dart';

class LoginController extends GetxController {
  late GlobalKey<FormState> formKey;
  FocusNode? emailFocusNode;
  FocusNode? passwordFocusNode;
  TextEditingController? email;
  TextEditingController? password;
  bool showPassword = false;
  RequestStatus? requestStatus;
  LoginData? loginData;
  AppServices services = Get.find();
  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    email = TextEditingController();
    password = TextEditingController();
    loginData = LoginData(crud: Get.find());
    super.onInit();
  }

  login() async {
    if (formKey.currentState!.validate()) {
      requestStatus = RequestStatus.loading;
      update();
      var response = await loginData!
          .checkUserExist(email!.text.trim(), password!.text.trim());
      requestStatus = handlingData(response);
      update();
      print(
          "=========================================================================  $requestStatus");
      if (requestStatus == RequestStatus.success) {
        if (response['data']['approve'] == 1) {
          services.preferences.setInt("user_id", response['data']['id']);
          services.preferences.setString("username", response['data']['name']);
          services.preferences.setString("email", response['data']['email']);
          services.preferences.setString("phone", response['data']['phone']);
          services.preferences.setString("step", "2");
          FirebaseMessaging.instance.getToken().then((value) {
            loginData!.addUserToken(response['data']['id'], value!);
          });
          FirebaseMessaging.instance.subscribeToTopic("users");
          Get.offNamed(AppRoutes.homeScreen);
        } else {
          Get.toNamed(AppRoutes.signupCodeVerification,
              arguments: {"email": email!.text.trim()});
        }
      }
      if (requestStatus == RequestStatus.failure) {
        showErorrDialog("51".tr);
      }
      if (requestStatus == RequestStatus.offlineFailure) {
        showNoInternetSnackbar();
      }
      if (requestStatus == RequestStatus.serverFailure) {
        showServerErorrSnackbar();
      }
    }
  }

  toSignUp() {
    Get.toNamed(AppRoutes.signup);
  }

  toForgotPassword() {
    Get.toNamed(AppRoutes.forgetPassword, arguments: {"email": email!.text});
  }

  hidePassword() {
    showPassword = !showPassword;
    update();
  }
}
