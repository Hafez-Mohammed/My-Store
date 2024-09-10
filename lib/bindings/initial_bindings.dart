import 'package:get/get.dart';
import 'package:my_store/core/classes/crud.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
