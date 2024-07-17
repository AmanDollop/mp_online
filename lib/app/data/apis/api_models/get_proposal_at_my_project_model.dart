class ProposalAtMyProjectModel {
  String? message;
  List<ProposalAtMyProjectData>? data;
  String? status;

  ProposalAtMyProjectModel({this.message, this.data, this.status});

  ProposalAtMyProjectModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <ProposalAtMyProjectData>[];
      json['data'].forEach((v) {
        data!.add(ProposalAtMyProjectData.fromJson(v));
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

class ProposalAtMyProjectData {
  String? id;
  String? userId;
  String? projectId;
  String? budgetAmount;
  String? time;
  String? description;
  String? dateTime;
  List<UserData>? userData;

  ProposalAtMyProjectData(
      {this.id,
        this.userId,
        this.projectId,
        this.budgetAmount,
        this.time,
        this.description,
        this.dateTime,
        this.userData});

  ProposalAtMyProjectData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    projectId = json['project_id'];
    budgetAmount = json['budget_amount'];
    time = json['time'];
    description = json['description'];
    dateTime = json['date_time'];
    if (json['user_data'] != null) {
      userData = <UserData>[];
      json['user_data'].forEach((v) {
        userData!.add(UserData.fromJson(v));
      });
    }
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
    if (userData != null) {
      data['user_data'] = userData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserData {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? type;
  String? countryCode;
  String? mobile;
  String? gender;
  String? dob;
  String? image;
  String? otp;
  String? accountStatus;
  String? shopAddress;
  String? shopBanner;
  String? drivingLicence;
  String? address;
  String? lat;
  String? lon;
  String? language;
  String? bio;
  String? updatedAt;
  String? createdAt;
  String? generalNotification;
  String? sound;
  String? vibrate;
  String? appUpdate;
  String? newTipsAvailable;
  String? newServiceAvailable;

  UserData(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.type,
        this.countryCode,
        this.mobile,
        this.gender,
        this.dob,
        this.image,
        this.otp,
        this.accountStatus,
        this.shopAddress,
        this.shopBanner,
        this.drivingLicence,
        this.address,
        this.lat,
        this.lon,
        this.language,
        this.bio,
        this.updatedAt,
        this.createdAt,
        this.generalNotification,
        this.sound,
        this.vibrate,
        this.appUpdate,
        this.newTipsAvailable,
        this.newServiceAvailable});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    type = json['type'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    gender = json['gender'];
    dob = json['dob'];
    image = json['image'];
    otp = json['otp'];
    accountStatus = json['account_status'];
    shopAddress = json['shop_address'];
    shopBanner = json['shop_banner'];
    drivingLicence = json['driving_licence'];
    address = json['address'];
    lat = json['lat'];
    lon = json['lon'];
    language = json['language'];
    bio = json['bio'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    generalNotification = json['general_notification'];
    sound = json['sound'];
    vibrate = json['vibrate'];
    appUpdate = json['app_update'];
    newTipsAvailable = json['new_tips_available'];
    newServiceAvailable = json['new_service_available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['type'] = type;
    data['country_code'] = countryCode;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['dob'] = dob;
    data['image'] = image;
    data['otp'] = otp;
    data['account_status'] = accountStatus;
    data['shop_address'] = shopAddress;
    data['shop_banner'] = shopBanner;
    data['driving_licence'] = drivingLicence;
    data['address'] = address;
    data['lat'] = lat;
    data['lon'] = lon;
    data['language'] = language;
    data['bio'] = bio;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['general_notification'] = generalNotification;
    data['sound'] = sound;
    data['vibrate'] = vibrate;
    data['app_update'] = appUpdate;
    data['new_tips_available'] = newTipsAvailable;
    data['new_service_available'] = newServiceAvailable;
    return data;
  }
}
