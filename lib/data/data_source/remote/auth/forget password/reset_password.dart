import 'package:my_store/core/classes/crud.dart';
import 'package:my_store/core/constants/api_links.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData({required this.crud});
  resetPassword(String email, String password) async {
    Map data = {"email": email, "password": password};
    var response = await crud.postData(ApiLinks.resetPassword, data);
    return response.fold((l) => l, (r) => r);
  }
}
