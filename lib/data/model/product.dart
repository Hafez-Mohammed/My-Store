class ProductModel {
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
  String? catName;
  String? catNameAr;
  String? catImage;
  String? catDate;
  int? isfavorite;

  ProductModel(
      {this.id,
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
      this.catName,
      this.catNameAr,
      this.catImage,
      this.catDate,
      this.isfavorite
      });

  ProductModel.fromJson(Map<String, dynamic> json) {
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
    catName = json['cat_name'];
    catNameAr = json['cat_name_ar'];
    catImage = json['cat_image'];
    catDate = json['cat_date'];
    isfavorite = json['isfavorite'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['name_ar'] = nameAr;
    data['description'] = description;
    data['description_ar'] = descriptionAr;
    data['image'] = image;
    data['price'] = price;
    data['dis_price'] = disPrice;
    data['quantity'] = quantity;
    data['discount'] = discount;
    data['hidden'] = hidden;
    data['date'] = date;
    data['cat_id'] = catId;
    data['cat_name'] = catName;
    data['cat_name_ar'] = catNameAr;
    data['cat_image'] = catImage;
    data['cat_date'] = catDate;
    data['isfavorite'] = isfavorite;
    return data;
  }
}