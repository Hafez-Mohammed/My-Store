import 'package:my_store/core/classes/crud.dart';
import 'package:my_store/core/constants/api_links.dart';

class LoginData {
  Crud crud;
  LoginData({required this.crud});
  checkUserExist(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var response = await crud.postData(ApiLinks.login, data);
    return response.fold((l) => l, (r) => r);
  }

  addUserToken(int? userId, String token) async {
    Map data = {
      "userId": "$userId",
      "token": token,
    };
    var response = await crud.postData(ApiLinks.addToken, data);
    return response.fold((l) => l, (r) => r);
  }

  deleteUserToken(String token) async {
    Map data = {
      "token": token,
    };
    var response = await crud.postData(ApiLinks.deleteToken, data);
    return response.fold((l) => l, (r) => r);
  }
}
