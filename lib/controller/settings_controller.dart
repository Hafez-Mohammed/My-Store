import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/core/functions/show_erorr_dialog.dart';
import 'package:my_store/core/functions/show_noInternet_snackbar.dart';
import 'package:my_store/core/functions/show_server_erorr_snackbar.dart';
import 'package:my_store/core/services/app_services.dart';
import 'package:my_store/data/data_source/remote/auth/login.dart';
import 'package:my_store/data/data_source/remote/notification_data.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController {
  AppServices services = Get.find();
  String? username;
  int? userId;
  String? token;
  bool? notificationEnable;
  RequestStatus? requestStatus;
  NotificationData? notificationData;
  RequestStatus? requestStatus2 = RequestStatus.success;
  LoginData? loginData;

  @override
  void onInit() async {
    notificationData = NotificationData(crud: Get.find());
    loginData = LoginData(crud: Get.find());
    username = services.preferences.getString("username");
    userId = services.preferences.getInt("user_id");
    notificationEnable = services.preferences.getBool("notification");
    token = await FirebaseMessaging.instance.getToken();
    super.onInit();
  }

  logout() async {
    requestStatus2 = RequestStatus.loading;
    update();
    var response = await loginData!.deleteUserToken(token!);
    requestStatus = handlingData(response);
    update();
    if (requestStatus == RequestStatus.success) {
      FirebaseMessaging.instance.unsubscribeFromTopic("users");
      services.preferences.clear();
      Get.offAllNamed(AppRoutes.login);
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
    update();
  }

  goToAddresses() {
    Get.toNamed(AppRoutes.addresses);
  }

  Future<void> makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: "0938776925",
    );
    await launchUrl(launchUri);
  }

  switchNotificationStatus() async {
    notificationEnable = !notificationEnable!;
    update();
    var response = await notificationData!
        .updateNotificationStatus(userId!, token, notificationEnable);
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      var fcm = FirebaseMessaging.instance;
      notificationEnable!
          ? fcm.subscribeToTopic("users")
          : fcm.unsubscribeFromTopic("users");
      services.preferences.setBool("notification", notificationEnable!);
    } else {
      notificationEnable = !notificationEnable!;
      update();
      Get.snackbar("Erorr", "Something went wrong!");
    }
  }
}
