import 'package:my_store/core/classes/crud.dart';
import 'package:my_store/core/constants/api_links.dart';

class FavoriteData {
  Crud crud;
  FavoriteData({required this.crud});

  add(int userId, int productId) async {
    var response = await crud.postData(
        ApiLinks.addFavorite, {"userId": "$userId", "productId": "$productId"});
    return response.fold((l) => l, (r) => r);
  }

  delete(int userId, int productId) async {
    var response = await crud.postData(ApiLinks.deleteFavorite,
        {"userId": "$userId", "productId": "$productId"});
    return response.fold((l) => l, (r) => r);
  }
}
