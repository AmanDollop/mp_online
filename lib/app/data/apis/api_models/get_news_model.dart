class NewsModel {
  List<NewsResult>? result;
  String? message;
  String? status;

  NewsModel({this.result, this.message, this.status});

  NewsModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <NewsResult>[];
      json['result'].forEach((v) {
        result!.add(NewsResult.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class NewsResult {
  String? id;
  String? title;
  String? image;
  String? description;
  String? status;
  String? dateTime;

  NewsResult(
      {this.id,
        this.title,
        this.image,
        this.description,
        this.status,
        this.dateTime});

  NewsResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['description'] = description;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
