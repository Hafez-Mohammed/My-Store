class OrderDetailsModel {
  int? orderId;
  int? id;
  String? name;
  String? nameAr;
  String? image;
  int? price;
  int? quantity;
  String? productColor;
  String? productSize;
  int? discount;
  double? disPrice;
  double? totalPrice;

  OrderDetailsModel(
      {this.orderId,
      this.id,
      this.name,
      this.nameAr,
      this.image,
      this.price,
      this.quantity,
      this.productColor,
      this.productSize,
      this.discount,
      this.disPrice,
      this.totalPrice});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    image = json['image'];
    price = json['price'];
    quantity = json['quantity'];
    productColor = json['product_color'];
    productSize = json['product_size'];
    discount = json['discount'];
    disPrice = double.parse("${json['dis_price']}");
    totalPrice = double.parse("${json['total_price']}");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['image'] = this.image;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['product_color'] = this.productColor;
    data['product_size'] = this.productSize;
    data['discount'] = this.discount;
    data['dis_price'] = this.disPrice;
    data['total_price'] = this.totalPrice;
    return data;
  }
}