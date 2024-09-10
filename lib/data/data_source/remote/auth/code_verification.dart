import 'package:my_store/core/classes/crud.dart';
import 'package:my_store/core/constants/api_links.dart';

class CodeVerificationData {
  Crud crud;
  CodeVerificationData({required this.crud});
  verfyCode(String email, String verificationCode) async {
    Map data = {
      "email": email,
      "verificationCode": verificationCode,
    };
    var response = await crud.postData(ApiLinks.codeVerification, data);
    return response.fold((l) => l, (r) => r);
  }

  resendCode(String email) async {
    Map data = {
      "email": email,
    };
    var response = await crud.postData(ApiLinks.resendVerificationCode, data);
    return response.fold((l) => l, (r) => r);
  }
}
