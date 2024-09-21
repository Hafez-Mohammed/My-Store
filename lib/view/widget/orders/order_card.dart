import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/orders/orders_controller.dart';
import 'package:my_store/core/shared/custom_app_button.dart';
import 'package:my_store/data/model/order.dart';

class OrderCard extends GetView<OrdersController> {
  final OrderModel order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:  EdgeInsets.symmetric(vertical: 10.h),
      child: Padding(
        padding: const EdgeInsets.all(10).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                "Order Number :   ${order.id}",
                style:  TextStyle(color: Colors.black, fontSize: 20.sp),
              ),
            ),
            Divider(
              color: Colors.blue[200],
            ),
            OrderCardText(title: "Date", body: "${order.date}"),
            OrderCardText(
                title: "Payment Method",
                body: controller.getPaymentMethod(order.paymentMethod)),
            OrderCardText(
                title: "Receiving Type",
                body: controller.getReceivingType(order.receivingType)),
            OrderCardText(title: "Order Price", body: "${order.price} \$"),
            OrderCardText(title: "Discount", body: "${order.discount} %"),
            (order.receivingType == 1 && order.status != "pending")
                ? OrderCardText(
                    title: "Delivery Cost", body: "${order.deliveryCost} \$")
                : const Center(),
            OrderCardText(title: "Status", body: "${order.status}"),
            OrderCardText(
                title: "Payment Status",
                body: controller.getPaymentStatus(order.paymentStatus)),
            Divider(
              color: Colors.blue[200],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      "Total : ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${order.totalPrice} \$",
                      style:  TextStyle(color: Colors.red, fontSize: 16.sp),
                    ),
                  ],
                ),
                SizedBox(
                  width: 70.w,
                  child: CustomAppButton(
                    text: "Details",
                    onPressed: () {
                      controller.goToDetails(order);
                    },
                  ),
                ),
                order.status == "pending"
                    ? SizedBox(
                        width: 70.w,
                        child: CustomAppButton(
                          text: "Cancel",
                          onPressed: () {
                            controller.cancelOrder(order.id!);
                          },
                        ),
                      )
                    : const Center()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OrderCardText extends StatelessWidget {
  final String title;
  final String body;
  const OrderCardText({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title : "),
          Text(
            body,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
