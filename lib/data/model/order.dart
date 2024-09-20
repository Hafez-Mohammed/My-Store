class OrderModel {
  int? id;
  int? userId;
  int? receivingType;
  int? deliveryAddress;
  int? paymentMethod;
  int? couponId;
  int? discount;
  double? deliveryCost;
  double? price;
  double? totalPrice;
  String? status;
  int? paymentStatus;
  String? date;
  String? city;
  String? street;
  String? details;


  OrderModel(
      {this.id,
      this.userId,
      this.receivingType,
      this.deliveryAddress,
      this.paymentMethod,
      this.couponId,
      this.discount,
      this.deliveryCost,
      this.price,
      this.totalPrice,
      this.status,
      this.paymentStatus,
      this.date,
      this.city,
      this.street,
      this.details
      });

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    receivingType = json['receiving_type'];
    deliveryAddress = json['delivery_address'];
    paymentMethod = json['payment_method'];
    couponId = json['coupon_id'];
    discount = json['discount'];
    deliveryCost = double.parse("${json['delivery_cost']}");
    price = double.parse("${json['price']}");
    totalPrice = double.parse("${json['total_price']}");
    status = json['status'];
    paymentStatus = json['payment_status'];
    date = json['date'];
    city = json['city'];
    street = json['street'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['user_id'] = userId.toString();
    data['receiving_type'] = receivingType.toString();
    data['delivery_address'] = deliveryAddress.toString();
    data['payment_method'] = paymentMethod.toString();
    data['coupon_id'] = couponId.toString();
    data['discount'] = discount.toString();
    data['delivery_cost'] = deliveryCost.toString();
    data['price'] = price.toString();
    data['total_price'] = totalPrice.toString();
    data['status'] = status.toString();
    data['payment_status'] = paymentStatus.toString();
    data['date'] = date.toString();
    data['city'] = this.city.toString();
    data['street'] = this.street.toString();
    data['details'] = this.details.toString();
    return data;
  }
}
