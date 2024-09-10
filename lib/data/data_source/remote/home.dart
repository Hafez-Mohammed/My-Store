import 'package:my_store/core/classes/crud.dart';
import 'package:my_store/core/constants/api_links.dart';

class HomeData {
  Crud crud;
  HomeData({required this.crud});

  getData() async {
    var response = await crud.postData(ApiLinks.home, {});
    return response.fold((l) => l, (r) => r);
  }
}
