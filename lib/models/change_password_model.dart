class ChangePasswordModel {
  String? success;
  int? status;
  dynamic logged;
  ChangePasswordModel({this.success, this.status});

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    logged = json['logged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    data['status'] = status;
    data['logged'] = logged;
    return data;
  }
}


