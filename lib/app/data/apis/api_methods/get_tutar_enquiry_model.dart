import '../api_models/get_my_project_model.dart';

class GetTutarEnquiryModel {
  String? message;
  List<GetTutarEnquiryData>? data;
  String? status;

  GetTutarEnquiryModel({this.message, this.data, this.status});

  GetTutarEnquiryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <GetTutarEnquiryData>[];
      json['data'].forEach((v) {
        data!.add(new GetTutarEnquiryData.fromJson(v));
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

class GetTutarEnquiryData {
  String? id;
  String? studentName;
  String? userId;
  String? studentCurrentGrade;
  String? gender;
  String? language;
  String? subjectForAllSpecific;
  String? studentAvailableClassTime;
  String? address;
  String? studentSchoolName;
  String? educationalType;
  String? numberOfStudentTotur;
  String? preferenceForMaleOr;
  String? teacherExperience;
  String? teacherEnglishProficiency;
  String? tutorExperience;
  String? status;
  String? enquiryStatus;
  String? datetime;
  UserData? userData;


  GetTutarEnquiryData(
      {this.id,
        this.studentName,
        this.userId,
        this.studentCurrentGrade,
        this.gender,
        this.language,
        this.subjectForAllSpecific,
        this.studentAvailableClassTime,
        this.address,
        this.studentSchoolName,
        this.educationalType,
        this.numberOfStudentTotur,
        this.preferenceForMaleOr,
        this.teacherExperience,
        this.teacherEnglishProficiency,
        this.tutorExperience,
        this.status,
        this.enquiryStatus,
        this.datetime,
        this.userData,
      });

  GetTutarEnquiryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentName = json['student_name'];
    userId = json['user_id'];
    studentCurrentGrade = json['student_current_grade'];
    gender = json['gender'];
    language = json['language'];
    subjectForAllSpecific = json['subject_for_all_specific'];
    studentAvailableClassTime = json['student_available_class_time'];
    address = json['address'];
    studentSchoolName = json['student_school_name'];
    educationalType = json['educational_type'];
    numberOfStudentTotur = json['number_of_student_totur'];
    preferenceForMaleOr = json['preference_for_male_or'];
    teacherExperience = json['teacher_experience'];
    teacherEnglishProficiency = json['teacher_english_proficiency'];
    tutorExperience = json['tutor_experience'];
    status = json['status'];
    enquiryStatus = json['enquiry_status'];
    datetime = json['datetime'];
    userData = json['user_data'] != null
        ? UserData.fromJson(json['user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['student_name'] = studentName;
    data['user_id'] = userId;
    data['student_current_grade'] = studentCurrentGrade;
    data['gender'] = gender;
    data['language'] = language;
    data['subject_for_all_specific'] = subjectForAllSpecific;
    data['student_available_class_time'] = studentAvailableClassTime;
    data['address'] = address;
    data['student_school_name'] = studentSchoolName;
    data['educational_type'] = educationalType;
    data['number_of_student_totur'] = numberOfStudentTotur;
    data['preference_for_male_or'] = preferenceForMaleOr;
    data['teacher_experience'] = teacherExperience;
    data['teacher_english_proficiency'] = teacherEnglishProficiency;
    data['tutor_experience'] = tutorExperience;
    data['status'] = status;
    data['enquiry_status'] = enquiryStatus;
    data['datetime'] = datetime;
    if (userData != null) {
      data['user_data'] = userData!.toJson();
    }
    return data;
  }
}
