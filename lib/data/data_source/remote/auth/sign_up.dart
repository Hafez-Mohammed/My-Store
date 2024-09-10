import 'package:my_store/core/classes/crud.dart';
import 'package:my_store/core/constants/api_links.dart';

class SignupData {
  Crud crud;
  SignupData({required this.crud});
  insertUser(
      String username, String email, String phone, String password) async {
    Map data = {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
    };
    var response = await crud.postData(ApiLinks.signUp, data);
    return response.fold((l) => l, (r) => r);
  }
}
