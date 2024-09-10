class OfferModel {
  int? id;
  String? title;
  String? titleAr;
  String? body;
  String? bodyAr;
  String? image;
  String? date;

  OfferModel(
      {this.id,
      this.title,
      this.titleAr,
      this.body,
      this.bodyAr,
      this.image,
      this.date});

  OfferModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleAr = json['title_ar'];
    body = json['body'];
    bodyAr = json['body_ar'];
    image = json['image'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['title_ar'] = titleAr;
    data['body'] = body;
    data['body_ar'] = bodyAr;
    data['image'] = image;
    data['date'] = date;
    return data;
  }
}