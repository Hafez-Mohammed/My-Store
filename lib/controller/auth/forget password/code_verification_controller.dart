import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/core/functions/show_erorr_dialog.dart';
import 'package:my_store/core/functions/show_noInternet_snackbar.dart';
import 'package:my_store/core/functions/show_server_erorr_snackbar.dart';
import 'package:my_store/data/data_source/remote/auth/forget%20password/verify_code.dart';

class CodeVerificationController extends GetxController {
  RequestStatus? requestStatus;
  VerfyCodeData? verfyCodeData;
  String? email;

  verifyCode(String verificationCode) async {
    requestStatus = RequestStatus.loading;
    update();
    var response = await verfyCodeData!.verfyCode(email!, verificationCode);
    requestStatus = handlingData(response);
    update();
    print(
        "=========================================================================  $requestStatus");
    if (requestStatus == RequestStatus.success) {
      Get.toNamed(AppRoutes.resetPassword, arguments: {'email': email});
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

  @override
  void onInit() {
    verfyCodeData = VerfyCodeData(crud: Get.find());
    email = Get.arguments['email'];
    super.onInit();
  }
}
