import 'package:get/get.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/services/app_services.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController {
  AppServices services = Get.find();
  String? username;

  @override
  void onInit() {
    username = services.preferences.getString("username");
    super.onInit();
  }

  logout() {
    services.preferences.clear();
    Get.offAllNamed(AppRoutes.login);
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
}
