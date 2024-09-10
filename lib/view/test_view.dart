import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/test_controller.dart';
import 'package:my_store/core/classes/handling_data_view.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: GetBuilder<TestController>(
        init: TestController(),
        builder: (controller) {
          return HandlingDataView(
              requestStatus: controller.requestStatus,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => Text("${controller.data}"),
              ));
        },
      ),
    );
  }
}
