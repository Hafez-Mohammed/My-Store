import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:my_store/core/functions/fcm_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices extends GetxService{
  late SharedPreferences preferences;
  Future<AppServices> init() async{
    await Firebase.initializeApp();
    preferences = await SharedPreferences.getInstance();
    showLocalNotification();
    return this;
  }
}
initializeServices() async{
  await Get.putAsync(() => AppServices().init());
}