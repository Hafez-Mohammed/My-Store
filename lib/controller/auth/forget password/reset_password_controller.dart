import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/core/functions/show_erorr_dialog.dart';
import 'package:my_store/core/functions/show_noInternet_snackbar.dart';
import 'package:my_store/core/functions/show_server_erorr_snackbar.dart';
import 'package:my_store/data/data_source/remote/auth/forget%20password/reset_password.dart';

class ResetPasswordController extends GetxController {
  late GlobalKey<FormState> formKey;
  FocusNode? passwordFocusNode;
  FocusNode? confpasswordFocusNode;
  TextEditingController? password;
  TextEditingController? confirmPassword;
  RequestStatus? requestStatus;
  ResetPasswordData? resetPasswordData;
  String? email;
  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    passwordFocusNode = FocusNode();
    confpasswordFocusNode = FocusNode();
    resetPasswordData = ResetPasswordData(crud: Get.find());
    email = Get.arguments['email'];
    super.onInit();
  }

  resetPassword() async {
    if (formKey.currentState!.validate()) {
      requestStatus = RequestStatus.loading;
      update();
      var response =
          await resetPasswordData!.resetPassword(email!, password!.text.trim());
      requestStatus = handlingData(response);
      update();
      print(
          "=========================================================================  $requestStatus");
      if (requestStatus == RequestStatus.success) {
        Get.offAllNamed(AppRoutes.successPasswordReset);
      }
      if (requestStatus == RequestStatus.failure) {
        showErorrDialog("55".tr);
      }
      if (requestStatus == RequestStatus.offlineFailure) {
        showNoInternetSnackbar();
      }
      if (requestStatus == RequestStatus.serverFailure) {
        showServerErorrSnackbar();
      }
    }
  }
}
