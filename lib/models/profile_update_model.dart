

class ChangeProfileModel {
  String? message;
  int? status;
  dynamic logged;
  ChangeProfileModel({this.message, this.status});

  ChangeProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    logged = json['logged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['logged'] = logged;
    return data;
  }
}
