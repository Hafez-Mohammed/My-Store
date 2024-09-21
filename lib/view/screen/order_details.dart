import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/orders/order_details_controller.dart';
import 'package:my_store/core/classes/handling_data_view.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_colors.dart';
import 'package:my_store/core/functions/translate_database.dart';
import 'package:my_store/core/shared/custom_app_button.dart';
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
          centerTitle: true,
        ),
        body: GetBuilder<OrderDetailsController>(
          builder: (controller) => HandlingDataView(
            requestStatus: controller.requestStatus,
            widget: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30).r,
              child: Column(
                children: [
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: {0: FixedColumnWidth(120.w)},
                    children: [
                      // name of column
                      TableRow(children: [
                        const OrderColumnName(text: "Product"),
                        const OrderColumnName(text: "QTY"),
                        const OrderColumnName(text: "Price"),
                        if (controller.orderModel.status == "delivered")
                          const Center()
                      ]),
                      // order products rows
                      ...List.generate(
                          controller.orderProducts.length,
                          (index) => TableRow(children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.h),
                                  child: OrderCellText(
                                      text: translateDatabase(
                                          controller
                                              .orderProducts[index].nameAr!,
                                          controller
                                              .orderProducts[index].name!)),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.h),
                                  child: OrderCellText(
                                      text:
                                          "${controller.orderProducts[index].quantity!}"),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.h),
                                  child: OrderCellText(
                                      text:
                                          "${controller.orderProducts[index].totalPrice!}"),
                                ),
                                if (controller.orderModel.status == "delivered")
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.h),
                                    child: CustomAppButton(
                                      text: "Rate",
                                      onPressed: () {
                                        // product rating process
                                        controller.resetRate();
                                        Get.defaultDialog(
                                          title: "Rating",
                                          content: GetBuilder<
                                                  OrderDetailsController>(
                                              builder: (controller) => controller
                                                          .requestStatus2 ==
                                                      RequestStatus.loading
                                                  ? const CircularProgressIndicator(
                                                      color: AppColors
                                                          .onboardingMainColor)
                                                  : Row(
                                                      children: [
                                                        ...List.generate(
                                                            5,
                                                            (i) => IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    controller
                                                                        .changeRate(
                                                                            i);
                                                                  },
                                                                  icon:
                                                                      TweenAnimationBuilder(
                                                                    tween: ColorTween(
                                                                        begin: Colors
                                                                            .grey,
                                                                        end: i <=
                                                                                controller.rate - 1
                                                                            ? Colors.yellow
                                                                            : Colors.grey),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            600),
                                                                    curve: Curves
                                                                        .bounceIn,
                                                                    builder: (context,
                                                                            value,
                                                                            child) =>
                                                                        Icon(
                                                                            Icons
                                                                                .star,
                                                                            color:
                                                                                value),
                                                                  ),
                                                                  iconSize:
                                                                      25.r,
                                                                )),
                                                      ],
                                                    )),
                                          onCancel: () {},
                                          buttonColor:
                                              AppColors.onboardingMainColor,
                                          onConfirm: () {
                                            controller.ratingProduct(
                                                controller.orderProducts[index]
                                                    .productId!,
                                                controller.rate);
                                          },
                                        );
                                        // end product rating
                                      },
                                    ),
                                  )
                              ]))
                    ],
                  ),
                  // order price details
                  Padding(
                      padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const OrderDetailsTitle(text: "Order Price : "),
                          OrderDetailsContent(
                              text: "${controller.orderModel.price} \$")
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const OrderDetailsTitle(text: "Discount : "),
                          OrderDetailsContent(
                              text: "${controller.orderModel.discount} %")
                        ],
                      ),
                      Row(
                        children: [
                          const OrderDetailsTitle(text: "Delivery Cost : "),
                          OrderDetailsContent(
                              text: "${controller.orderModel.deliveryCost} \$")
                        ],
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const OrderDetailsTitle(text: "Total Price : "),
                          OrderDetailsContent(
                              text: "${controller.orderModel.totalPrice} \$")
                        ],
                      )),
                  const Divider(),

                  // if user has ordered with delivery option and has selected address show Delivery Address of order
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
                                    fontSize: 14.sp),
                          ),
                          leading: Icon(
                            Icons.location_on_outlined,
                            color: AppColors.homeIconGreyColor,
                            size: 30.r,
                          ),
                        )
                      : const Center(),

                  // if user selected pay with card when he had ordered and does not pay yet show checkout button to continue card payment
                  if (controller.orderModel.paymentMethod == 1 &&
                      controller.orderModel.paymentStatus == 0)
                    CustomAppButton(
                      text: "Card Checkout",
                      onPressed: () {
                        controller.cardCheckout();
                      },
                    )
                ],
              ),
            ),
          ),
        ));
  }
}
