class GetMyProjectModel {
  String? message;
  List<GetMyProjectData>? data;
  String? status;

  GetMyProjectModel({this.message, this.data, this.status});

  GetMyProjectModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <GetMyProjectData>[];
      json['data'].forEach((v) {
        data!.add(GetMyProjectData.fromJson(v));
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

class GetMyProjectData {
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
  UserData? userData;
  List<DocumentGallery>? documentGallery;

  GetMyProjectData(
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
        this.dateTime,
        this.userData,
        this.documentGallery});

  GetMyProjectData.fromJson(Map<String, dynamic> json) {
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
    userData = json['user_data'] != null
        ? UserData.fromJson(json['user_data'])
        : null;
    if (json['document_gallery'] != null) {
      documentGallery = <DocumentGallery>[];
      json['document_gallery'].forEach((v) {
        documentGallery!.add(DocumentGallery.fromJson(v));
      });
    }
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
    if (userData != null) {
      data['user_data'] = userData!.toJson();
    }
    if (documentGallery != null) {
      data['document_gallery'] =
          documentGallery!.map((v) => v.toJson()).toList();
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

class DocumentGallery {
  String? id;
  String? image;

  DocumentGallery({this.id, this.image});

  DocumentGallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    return data;
  }
}
