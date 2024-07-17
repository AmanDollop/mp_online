class GetMySubmittedProposalModel {
  String? message;
  List<GetMySubmittedProposalData>? data;
  String? status;

  GetMySubmittedProposalModel({this.message, this.data, this.status});

  GetMySubmittedProposalModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <GetMySubmittedProposalData>[];
      json['data'].forEach((v) {
        data!.add(GetMySubmittedProposalData.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class GetMySubmittedProposalData {
  String? id;
  String? userId;
  String? projectId;
  String? budgetAmount;
  String? time;
  String? description;
  String? dateTime;
  PostData? postData;

  GetMySubmittedProposalData(
      {this.id,
        this.userId,
        this.projectId,
        this.budgetAmount,
        this.time,
        this.description,
        this.dateTime,
        this.postData});

  GetMySubmittedProposalData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    projectId = json['project_id'];
    budgetAmount = json['budget_amount'];
    time = json['time'];
    description = json['description'];
    dateTime = json['date_time'];
    postData = json['post_data'] != null
        ? PostData.fromJson(json['post_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['project_id'] = projectId;
    data['budget_amount'] = budgetAmount;
    data['time'] = time;
    data['description'] = description;
    data['date_time'] = dateTime;
    if (postData != null) {
      data['post_data'] = postData!.toJson();
    }
    return data;
  }
}

class PostData {
  String? id;
  String? userId;
  String? email;
  String? phone;
  String? address;
  String? serviceName;
  String? description;
  String? budgetAmount;
  String? selectCopy;
  String? time;
  String? dateTime;

  PostData(
      {this.id,
        this.userId,
        this.email,
        this.phone,
        this.address,
        this.serviceName,
        this.description,
        this.budgetAmount,
        this.selectCopy,
        this.time,
        this.dateTime});

  PostData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    serviceName = json['service_name'];
    description = json['description'];
    budgetAmount = json['budget_amount'];
    selectCopy = json['select_copy'];
    time = json['time'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['service_name'] = serviceName;
    data['description'] = description;
    data['budget_amount'] = budgetAmount;
    data['select_copy'] = selectCopy;
    data['time'] = time;
    data['date_time'] = dateTime;
    return data;
  }
}
