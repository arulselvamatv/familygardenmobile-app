class accountOtpModel {
  int? status;
  String? message;
  String? logged;

  accountOtpModel({this.status, this.message, this.logged});

  accountOtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    logged = json['logged'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['logged'] = this.logged;
    return data;
  }
}
