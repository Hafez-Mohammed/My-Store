import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/data/data_source/remote/test_data.dart';

class TestController extends GetxController {
  late TestData testData;
  List data = [];
  late RequestStatus requestStatus;
  @override
  void onInit() {
    testData = TestData(crud: Get.find());
    getData();
    super.onInit();
  }

  getData() async {
    requestStatus = RequestStatus.loading;
    var response = await testData.getData();
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      data.addAll(response['data']);
    }
    update();
  }
}
