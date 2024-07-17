class UserModel {
  String? message;
  String? status;
  UserData? userData;

  UserModel({this.message, this.status, this.userData});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    userData = json['user_data'] != null
        ? UserData.fromJson(json['user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (userData != null) {
      data['user_data'] = userData!.toJson();
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
