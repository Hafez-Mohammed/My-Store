import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/core/functions/show_erorr_dialog.dart';
import 'package:my_store/core/functions/show_noInternet_snackbar.dart';
import 'package:my_store/core/functions/show_server_erorr_snackbar.dart';
import 'package:my_store/core/services/app_services.dart';
import 'package:my_store/data/data_source/remote/notification_data.dart';
import 'package:my_store/data/model/notification.dart';

class NotificationController extends GetxController {
  AppServices services = Get.find();
  List<NotificationModel> notifications = [];
  NotificationData notificationData = NotificationData(crud: Get.find());
  late RequestStatus requestStatus;

  getNotifications() async {
    notifications.clear();
    requestStatus = RequestStatus.loading;
    update();
    var response = await notificationData
        .getNotifications(services.preferences.getInt("user_id")!);
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      List data = response['data'];
      notifications.addAll(data.map((e) => NotificationModel.fromJson(e)));
    }
    update();
  }

  deleteNotification(int id) async {
    var response = await notificationData.deleteNotification(id);
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      notifications.removeWhere((element) => element.id == id);
      update();
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

  @override
  void onInit() {
    getNotifications();
    super.onInit();
  }
}
