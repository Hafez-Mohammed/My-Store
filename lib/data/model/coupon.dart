class CouponModel {
  int? id;
  String? name;
  int? discount;
  int? count;
  String? expireDate;

  CouponModel({this.id, this.name, this.discount, this.count, this.expireDate});

  CouponModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    discount = json['discount'];
    count = json['count'];
    expireDate = json['expire_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['discount'] = this.discount;
    data['count'] = this.count;
    data['expire_date'] = this.expireDate;
    return data;
  }
}