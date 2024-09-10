import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/core/functions/show_erorr_dialog.dart';
import 'package:my_store/core/functions/show_noInternet_snackbar.dart';
import 'package:my_store/core/functions/show_server_erorr_snackbar.dart';
import 'package:my_store/data/data_source/remote/auth/sign_up.dart';

class SignUpController extends GetxController {
  late GlobalKey<FormState> formKey;
  FocusNode? nameFocusNode;
  FocusNode? emailFocusNode;
  FocusNode? passwordFocusNode;
  FocusNode? confpasswordFocusNode;
  FocusNode? phoneFocusNode;
  TextEditingController? userName;
  TextEditingController? password;
  TextEditingController? email;
  TextEditingController? confirmPassword;
  TextEditingController? phone;
  late SignupData signupData;
  RequestStatus? requestStatus;
  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    nameFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    confpasswordFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    userName = TextEditingController();
    password = TextEditingController();
    email = TextEditingController();
    confirmPassword = TextEditingController();
    phone = TextEditingController();
    signupData = SignupData(crud: Get.find());
    super.onInit();
  }

  signUp() async {
    if (formKey.currentState!.validate()) {
      requestStatus = RequestStatus.loading;
      update();
      var response = await signupData.insertUser(userName!.text.trim(),
          email!.text.trim(), phone!.text.trim(), password!.text.trim());
      requestStatus = handlingData(response);
      update();
      print(
          "=========================================================================  $requestStatus");
      if (requestStatus == RequestStatus.success) {
        Get.toNamed(AppRoutes.signupCodeVerification,
            arguments: {"email": email!.text.trim()});
      }
      if (requestStatus == RequestStatus.failure) {
        showErorrDialog("52".tr);
      }
      if (requestStatus == RequestStatus.offlineFailure) {
        showNoInternetSnackbar();
      }
      if (requestStatus == RequestStatus.serverFailure) {
        showServerErorrSnackbar();
      }
    }
  }

  toLogin() {
    Get.back();
  }
}
