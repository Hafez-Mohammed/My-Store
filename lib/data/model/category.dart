class CategoryModel {
  int? id;
  String? name;
  String? nameAr;
  String? image;
  String? creationDate;

  CategoryModel(
      {this.id, this.name, this.nameAr, this.image, this.creationDate});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    image = json['image'];
    creationDate = json['creation_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['image'] = this.image;
    data['creation_date'] = this.creationDate;
    return data;
  }
}
