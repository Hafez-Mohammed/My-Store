import 'package:get/get.dart';
import 'package:my_store/core/services/app_services.dart';

translateDatabase(arabicColumn, englishColumn) {
  AppServices services = Get.find();
  String? lang = services.preferences.getString("codeLang");
  return lang == "ar" ? arabicColumn : englishColumn;
}
