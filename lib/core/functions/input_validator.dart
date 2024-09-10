import 'package:get/get.dart';

inputValidate(String? value, String type, int min, int max,String? password ){
  if (value!.trim().isEmpty) {
    return "43".tr;
  }
  if (value.trim().length < min) {
    return "${'44'.tr} $min ${'45'.tr}";
  }
  if (value.trim().length > max) {
    return "${'46'.tr} $max ${'45'.tr}";
  }
  if (type == 'user name' && !GetUtils.isUsername(value.trim())) {
    return "47".tr;
  }
  if (type == 'email' && !GetUtils.isEmail(value.trim())) {
    return "48".tr;
  }
  if (type == 'phone' && !GetUtils.isPhoneNumber(value.trim())) {
    return "49".tr;
  }
  if (type == 'confirm password' && value.trim() != password!.trim()) {
    return "50".tr;
  }

}