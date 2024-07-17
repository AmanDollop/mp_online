class SendOtpModel {
  String? userId;
  String? message;
  String? status;

  SendOtpModel({this.userId, this.message, this.status});

  SendOtpModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
