import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/core/functions/show_erorr_dialog.dart';
import 'package:my_store/core/functions/show_noInternet_snackbar.dart';
import 'package:my_store/core/functions/show_server_erorr_snackbar.dart';
import 'package:my_store/data/data_source/remote/auth/forget%20password/check_email.dart';

class ForgetPasswordController extends GetxController {
  FocusNode? emailFocusNode;
  TextEditingController? email;
  late GlobalKey<FormState> formKey;
  RequestStatus? requestStatus;
  CheckEmailData? checkEmailData;
  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    emailFocusNode = FocusNode();
    email = TextEditingController();
    email!.text = Get.arguments['email'];
    checkEmailData = CheckEmailData(crud: Get.find());
    super.onInit();
  }

  checkEmail() async {
    if (formKey.currentState!.validate()) {
      requestStatus = RequestStatus.loading;
      update();
      var response = await checkEmailData!.checkUserEmail(email!.text.trim());
      requestStatus = handlingData(response);
      update();
      print(
          "=========================================================================  $requestStatus");
      if (requestStatus == RequestStatus.success) {
        Get.toNamed(AppRoutes.codeVerification,
            arguments: {'email': email!.text.trim()});
      }
      if (requestStatus == RequestStatus.failure) {
        showErorrDialog("54".tr);
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
