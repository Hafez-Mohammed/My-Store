import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/orders/orders_controller.dart';
import 'package:my_store/core/classes/handling_data_view.dart';
import 'package:my_store/core/constants/app_colors.dart';
import 'package:my_store/view/widget/orders/order_card.dart';
import 'package:my_store/view/widget/orders/orders_title.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OrdersController());
    return SafeArea(
      child: GetBuilder<OrdersController>(
        builder: (controller) => RefreshIndicator.adaptive(
          color: AppColors.onboardingMainColor,
          onRefresh: () async{
            await controller.refreshPage();
          },
          child: HandlingDataView(
              requestStatus: controller.requestStatus,
              widget: Column(
                children: [
                  Container(
                      height: 50,
                      padding: const EdgeInsets.only(top: 10),
                      child: const OrdersTitle()),
                  Container(
                    height: Get.height - 130,
                    child: ListView.separated(
                        controller: controller.scrollController,
                        separatorBuilder: (context, index) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...List.generate(
                                    3,
                                    (index) => Icon(
                                          Icons.star_border_purple500_rounded,
                                          color: Colors.green[200],
                                        ))
                              ],
                            ),
                        padding: const EdgeInsets.all(10),
                        itemCount: controller.orders.length + 1,
                        itemBuilder: (context, index) => index <
                                controller.orders.length
                            ? OrderCard(order: controller.orders[index])
                            : controller.hasMoreData
                                ? const Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: CircularProgressIndicator(
                                        color: AppColors.onboardingMainColor,
                                      ),
                                    ),
                                  )
                                : const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      "No more orders",
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
