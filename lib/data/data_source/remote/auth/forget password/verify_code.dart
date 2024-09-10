import 'package:my_store/core/classes/crud.dart';
import 'package:my_store/core/constants/api_links.dart';

class VerfyCodeData {
  Crud crud;
  VerfyCodeData({required this.crud});
  verfyCode(
      String email,String verificationCode) async {
    Map data = {
      "email": email,
      "verificationCode": verificationCode,
    };
    var response = await crud.postData(ApiLinks.forgetPasswordCodeVerification, data);
    return response.fold((l) => l, (r) => r);
  }
}