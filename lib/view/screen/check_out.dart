// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/checkout_controller.dart';
import 'package:my_store/core/classes/handling_data_view.dart';
import 'package:my_store/core/constants/app_image_assets.dart';
import 'package:my_store/core/shared/custom_app_button.dart';
import 'package:my_store/view/widget/checkout/address_card.dart';
import 'package:my_store/view/widget/checkout/payment_container.dart';
import 'package:my_store/view/widget/checkout/receiving_type_component.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutControllerImp checkoutControllerImp = Get.put(CheckoutControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      floatingActionButton: CustomAppButton(
        text: "Submit",
        onPressed: () {
          checkoutControllerImp.checkout();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GetBuilder<CheckoutControllerImp>(
        builder: (controller) => HandlingDataView(
            requestStatus: controller.requestStatus!,
            widget: ListView(
              padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 100),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    "Please select payment method:",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                ),
                // Row of two payment method
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.choosePaymentMethod("Cash");
                      },
                      radius: 25,
                      child: PaymentContainer(
                          text: "Cash",
                          isSelected: controller.paymentMethod == "Cash"
                              ? true
                              : false),
                    ),
                    InkWell(
                      onTap: () {
                        controller.choosePaymentMethod("Credit Card");
                      },
                      radius: 25,
                      child: PaymentContainer(
                          text: "Credit Card",
                          isSelected: controller.paymentMethod == "Credit Card"
                              ? true
                              : false),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    "Please select receiving type:",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                ),
                // Row of two type of receiving order
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.chooseReceivingType("Drive Thru");
                      },
                      child: ReceivingTypeComponent(
                          text: "Drive Thru",
                          image: AppImageAssets.driveThru,
                          isSelected: controller.receivingType == "Drive Thru"
                              ? true
                              : false),
                    ),
                    InkWell(
                      onTap: () {
                        controller.chooseReceivingType("Delivery");
                      },
                      child: ReceivingTypeComponent(
                          text: "Delivery",
                          image: AppImageAssets.delivery,
                          isSelected: controller.receivingType == "Delivery"
                              ? true
                              : false),
                    ),
                  ],
                ),

                controller.receivingType == "Delivery"
                    ? ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 20),
                            child: Text(
                              "Please select delivery address:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          ...List.generate(
                              controller.addresses.length,
                              (index) => InkWell(
                                    onTap: () {
                                      controller.chooseAddress(
                                          controller.addresses[index]);
                                    },
                                    borderRadius: BorderRadius.circular(10),
                                    child: AddressCard(index: index),
                                  ))
                        ],
                      )
                    : Center(),
              ],
            )),
      ),
    );
  }
}
