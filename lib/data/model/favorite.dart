class FavoriteProductModel {
  int? favId;
  int? id;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  String? image;
  int? price;
  double? disPrice;
  int? quantity;
  int? discount;
  int? hidden;
  String? date;
  int? catId;
  int? userId;

  FavoriteProductModel(
      {this.favId,
      this.id,
      this.name,
      this.nameAr,
      this.description,
      this.descriptionAr,
      this.image,
      this.price,
      this.disPrice,
      this.quantity,
      this.discount,
      this.hidden,
      this.date,
      this.catId,
      this.userId});

  FavoriteProductModel.fromJson(Map<String, dynamic> json) {
    favId = json['fav_id'];
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    image = json['image'];
    price = json['price'];
    disPrice = double.parse("${json['dis_price']}");
    quantity = json['quantity'];
    discount = json['discount'];
    hidden = json['hidden'];
    date = json['date'];
    catId = json['cat_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fav_id'] = this.favId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['description'] = this.description;
    data['description_ar'] = this.descriptionAr;
    data['image'] = this.image;
    data['price'] = this.price;
    data['dis_price'] = disPrice;
    data['quantity'] = this.quantity;
    data['discount'] = this.discount;
    data['hidden'] = this.hidden;
    data['date'] = this.date;
    data['cat_id'] = this.catId;
    data['user_id'] = this.userId;
    return data;
  }
}
