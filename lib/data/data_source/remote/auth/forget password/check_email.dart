import 'package:my_store/core/classes/crud.dart';
import 'package:my_store/core/constants/api_links.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData({required this.crud});
  checkUserEmail(
      String email) async {
    Map data = {
      "email": email,
    };
    var response = await crud.postData(ApiLinks.checkEmail, data);
    return response.fold((l) => l, (r) => r);
  }
}