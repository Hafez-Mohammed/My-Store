import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:my_store/controller/home_screen_controller.dart';
import 'package:my_store/controller/notification_controller.dart';
import 'package:my_store/controller/orders/orders_controller.dart';
import 'package:my_store/core/constants/app_routes.dart';

requestPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

showLocalNotification() {
  requestPermission();
  FirebaseMessaging.onMessage.listen((message) {
    if (message.notification != null) {
      FlutterRingtonePlayer().playNotification();
      Get.snackbar(message.notification!.title!, message.notification!.body!);
    }
    if (message.data['pagename'] == "order" &&
        Get.currentRoute == AppRoutes.homeScreen) {
      HomeScreenControllerImp homeScreenControllerImp = Get.find();
      if (homeScreenControllerImp.currentPage == 2) {
        OrdersController ordersController = Get.find();
        ordersController.refreshPage();
      }
    }
    if (Get.currentRoute == AppRoutes.notifications) {
      NotificationController controller = Get.find();
      controller.getNotifications();
    }
  });
}
