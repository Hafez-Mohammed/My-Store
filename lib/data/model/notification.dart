class NotificationModel {
  int? id;
  int? userId;
  String? title;
  String? body;
  String? date;

  NotificationModel({this.id, this.userId, this.title, this.body, this.date});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    body = json['body'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['body'] = this.body;
    data['date'] = this.date;
    return data;
  }
}