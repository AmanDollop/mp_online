class JobVacancyModel {
  List<JobVacancyResult>? result;
  String? message;
  String? status;

  JobVacancyModel({this.result, this.message, this.status});

  JobVacancyModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <JobVacancyResult>[];
      json['result'].forEach((v) {
        result!.add(JobVacancyResult.fromJson(v));
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

class JobVacancyResult {
  String? id;
  String? companyName;
  String? workField;
  String? address;
  String? packageAmount;
  String? image;
  String? description;
  String? jobSector;
  String? noOfVacancy;
  String? experience;
  String? industryOfEmployer;
  String? companyWebsite;
  String? skills;
  String? education;
  String? salary;
  String? startDate;
  String? endDate;
  String? createdBy;

  JobVacancyResult(
      {this.id,
        this.companyName,
        this.workField,
        this.address,
        this.packageAmount,
        this.image,
        this.description,
        this.jobSector,
        this.noOfVacancy,
        this.experience,
        this.industryOfEmployer,
        this.companyWebsite,
        this.skills,
        this.education,
        this.salary,
        this.startDate,
        this.endDate,
        this.createdBy});

  JobVacancyResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    workField = json['work_field'];
    address = json['address'];
    packageAmount = json['package_amount'];
    image = json['image'];
    description = json['description'];
    jobSector = json['job_sector'];
    noOfVacancy = json['no_of_vacancy'];
    experience = json['experience'];
    industryOfEmployer = json['industry_of_employer'];
    companyWebsite = json['company_website'];
    skills = json['skills'];
    education = json['education'];
    salary = json['salary'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = companyName;
    data['work_field'] = workField;
    data['address'] = address;
    data['package_amount'] = packageAmount;
    data['image'] = image;
    data['description'] = description;
    data['job_sector'] = jobSector;
    data['no_of_vacancy'] = noOfVacancy;
    data['experience'] = experience;
    data['industry_of_employer'] = industryOfEmployer;
    data['company_website'] = companyWebsite;
    data['skills'] = skills;
    data['education'] = education;
    data['salary'] = salary;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['created_by'] = createdBy;
    return data;
  }
}
