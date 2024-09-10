class AddressModel {
  int? id;
  String? name;
  String? city;
  String? street;
  String? details;
  int? userId;

  AddressModel(
      {this.id, this.name, this.city, this.street, this.details, this.userId});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    street = json['street'];
    details = json['details'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['city'] = this.city;
    data['street'] = this.street;
    data['details'] = this.details;
    data['user_id'] = this.userId;
    return data;
  }
}