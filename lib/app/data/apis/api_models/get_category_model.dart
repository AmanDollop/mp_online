class GetCategoryModel {
  List<GetCategoryResult>? result;
  String? message;
  String? status;

  GetCategoryModel({this.result, this.message, this.status});

  GetCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <GetCategoryResult>[];
      json['result'].forEach((v) {
        result!.add(GetCategoryResult.fromJson(v));
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

class GetCategoryResult {
  String? categoryId;
  String? categoryName;
  String? description;

  GetCategoryResult({this.categoryId, this.categoryName, this.description});

  GetCategoryResult.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['description'] = description;
    return data;
  }
}
