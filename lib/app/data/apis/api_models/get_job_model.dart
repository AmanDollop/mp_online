class JobModel {
  List<JobResult>? result;
  String? message;
  String? status;

  JobModel({this.result, this.message, this.status});

  JobModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <JobResult>[];
      json['result'].forEach((v) {
        result!.add(JobResult.fromJson(v));
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

class JobResult {
  String? id;
  String? title;
  String? image;
  String? description;
  String? status;
  String? dateTime;

  JobResult(
      {this.id,
        this.title,
        this.image,
        this.description,
        this.status,
        this.dateTime});

  JobResult.fromJson(Map<String, dynamic> json) {
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
