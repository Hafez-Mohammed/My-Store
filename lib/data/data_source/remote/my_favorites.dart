import 'package:my_store/core/classes/crud.dart';
import 'package:my_store/core/constants/api_links.dart';

class MyFavoritesData {
  Crud crud;
  MyFavoritesData({required this.crud});

  getData(int userId) async {
    var response =
        await crud.postData(ApiLinks.favorites, {"userId": "$userId"});
    return response.fold((l) => l, (r) => r);
  }

  delete(int id) async {
    var response =
        await crud.postData(ApiLinks.deleteFavoritesId, {"id": "$id"});
    return response.fold((l) => l, (r) => r);
  }
}
