import 'package:my_store/core/classes/crud.dart';
import 'package:my_store/core/constants/api_links.dart';

class NotificationData {
  Crud crud;
  NotificationData({required this.crud});

  getNotifications(int userId) async {
    var response =
        await crud.postData(ApiLinks.notifications, {"userId": "$userId"});
    return response.fold((l) => l, (r) => r);
  }

  deleteNotification(int id) async {
    var response =
        await crud.postData(ApiLinks.deleteNotification, {"id": "$id"});
    return response.fold((l) => l, (r) => r);
  }

  updateNotificationStatus(
      int userId, String? token, bool? notificationEnable) async {
    var response = await crud.postData(ApiLinks.controrlNotification, {
      "userId": "$userId",
      "token": token,
      "isEnabled": notificationEnable!? "1" : "0"
    });
    return response.fold((l) => l, (r) => r);
  }
}
