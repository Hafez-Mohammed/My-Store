import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/data/data_source/remote/search_data.dart';
import 'package:my_store/data/model/product.dart';

abstract class SearchController extends GetxController {
  getSearchResults(String searchText);
  showSearch(String value);
}

class SearchControllerImp extends SearchController {
  bool isSearch = false;
  List<ProductModel> results = [];
  RequestStatus? requestStatus;
  SearchData searchData = SearchData(crud: Get.find());

  @override
  getSearchResults(String searchText) async {
    results.clear();
    requestStatus = RequestStatus.loading;
    update();
    var response = await searchData.getAllResults(searchText);
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      List responseBody = response['data'];
      results.addAll(responseBody.map((e) => ProductModel.fromJson(e)));
    }
    update();
  }

  @override
  showSearch(String value) {
    if (value.isNotEmpty) {
      isSearch = true;
      results.clear();
    }
    else{
      isSearch = false;
    }
    update();
  }
}
