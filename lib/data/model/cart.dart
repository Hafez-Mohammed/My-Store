class CartProductModel {
  int? id;
  String? productColor;
  String? productSize;
  int? quantity;
  int? userId;
  int? productId;
  String? name;
  String? nameAr;
  String? image;
  int? price;
  double? disPrice;
  int? discount;
  double? totalPrice;

  CartProductModel(
      {this.id,
      this.productColor,
      this.productSize,
      this.quantity,
      this.userId,
      this.productId,
      this.name,
      this.nameAr,
      this.image,
      this.price,
      this.disPrice,
      this.discount,
      this.totalPrice});

  CartProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productColor = json['product_color'];
    productSize = json['product_size'];
    quantity = json['quantity'];
    userId = json['user_id'];
    productId = json['product_id'];
    name = json['name'];
    nameAr = json['name_ar'];
    image = json['image'];
    price = json['price'];
    disPrice = double.parse("${json['dis_price']}");
    discount = json['discount'];
    totalPrice = double.parse("${json['total_price']}");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_color'] = this.productColor;
    data['product_size'] = this.productSize;
    data['quantity'] = this.quantity;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['image'] = this.image;
    data['price'] = this.price;
    data['dis_price'] = disPrice;
    data['discount'] = this.discount;
    data['total_price'] = this.totalPrice;
    return data;
  }
}
