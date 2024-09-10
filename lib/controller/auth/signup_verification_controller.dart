import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/core/functions/show_erorr_dialog.dart';
import 'package:my_store/core/functions/show_noInternet_snackbar.dart';
import 'package:my_store/core/functions/show_server_erorr_snackbar.dart';
import 'package:my_store/data/data_source/remote/auth/code_verification.dart';

class SignupCodeVerificationController extends GetxController {
  String? email;
  CodeVerificationData? codeVerificationData;
  RequestStatus? requestStatus;
  verifyCode(String verificationCode) async {
    requestStatus = RequestStatus.loading;
    update();
    var response =
        await codeVerificationData!.verfyCode(email!, verificationCode);
    requestStatus = handlingData(response);
    update();
    print(
        "=========================================================================  $requestStatus");
    if (requestStatus == RequestStatus.success) {
      Get.offAllNamed(AppRoutes.successSignUp);
    }
    if (requestStatus == RequestStatus.failure) {
      showErorrDialog("53".tr);
    }
    if (requestStatus == RequestStatus.offlineFailure) {
      showNoInternetSnackbar();
    }
    if (requestStatus == RequestStatus.serverFailure) {
      showServerErorrSnackbar();
    }
  }

  resendVerificationCode() {
    codeVerificationData!.resendCode(email!);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    codeVerificationData = CodeVerificationData(crud: Get.find());
    resendVerificationCode();
    super.onInit();
  }
}
