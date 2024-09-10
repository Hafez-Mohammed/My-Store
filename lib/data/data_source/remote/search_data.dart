import 'package:my_store/core/classes/crud.dart';
import 'package:my_store/core/constants/api_links.dart';

class SearchData {
  Crud crud;
  SearchData({required this.crud});

  getAllResults(String searchText) async {
    var response = await crud
        .postData(ApiLinks.searchAllProducts, {"searchText": searchText});
    return response.fold((l) => l, (r) => r);
  }

  getResultsMatchCategory(String searchText, int catId) async {
    var response = await crud.postData(ApiLinks.searchCatProducts,
        {"searchText": searchText, "catId": "$catId"});
    return response.fold((l) => l, (r) => r);
  }
}
