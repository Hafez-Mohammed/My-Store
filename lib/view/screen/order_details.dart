import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/orders/order_details_controller.dart';
import 'package:my_store/core/classes/handling_data_view.dart';
import 'package:my_store/core/constants/app_colors.dart';
import 'package:my_store/core/functions/translate_database.dart';
import 'package:my_store/view/widget/order_details/order_cell_text.dart';
import 'package:my_store/view/widget/order_details/order_column_name.dart';
import 'package:my_store/view/widget/order_details/order_details_content.dart';
import 'package:my_store/view/widget/order_details/order_details_title.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Order Details',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: GetBuilder<OrderDetailsController>(
          builder: (controller) => HandlingDataView(
            requestStatus: controller.requestStatus,
            widget: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: {0: FixedColumnWidth(150)},
                    children: [
                      // name of column
                      TableRow(children: [
                        OrderColumnName(text: "Product"),
                        OrderColumnName(text: "QTY"),
                        OrderColumnName(text: "Price"),
                      ]),
                      ...List.generate(
                          controller.orderProducts.length,
                          (index) => TableRow(children: [
                                OrderCellText(
                                    text: translateDatabase(
                                        controller.orderProducts[index].nameAr!,
                                        controller.orderProducts[index].name!)),
                                OrderCellText(
                                    text:
                                        "${controller.orderProducts[index].quantity!}"),
                                OrderCellText(
                                    text:
                                        "${controller.orderProducts[index].totalPrice!}"),
                              ]))
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OrderDetailsTitle(text: "Order Price : "),
                          OrderDetailsContent(
                              text: "${controller.orderModel.price} \$")
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          OrderDetailsTitle(text: "Discount : "),
                          OrderDetailsContent(
                              text: "${controller.orderModel.discount} %")
                        ],
                      ),
                      Row(
                        children: [
                          OrderDetailsTitle(text: "Delivery Cost : "),
                          OrderDetailsContent(
                              text: "${controller.orderModel.deliveryCost} \$")
                        ],
                      )
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OrderDetailsTitle(text: "Total Price : "),
                          OrderDetailsContent(
                              text: "${controller.orderModel.totalPrice} \$")
                        ],
                      )),
                  Divider(),
                  controller.orderModel.receivingType == 1
                      ? ListTile(
                          title: Text("Delivery Address",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          subtitle: Text(
                            "${controller.orderModel.city} / ${controller.orderModel.street}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                          ),
                          leading: Icon(
                            Icons.location_on_outlined,
                            color: AppColors.homeIconGreyColor,
                            size: 30,
                          ),
                        )
                      : Center()
                ],
              ),
            ),
          ),
        ));
  }
}
