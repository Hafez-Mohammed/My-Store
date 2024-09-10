import 'package:my_store/core/classes/crud.dart';
import 'package:my_store/core/constants/api_links.dart';

class TestData {
  Crud crud;
  TestData({required this.crud});

  getData() async {
    var response = await crud.postData(ApiLinks.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
