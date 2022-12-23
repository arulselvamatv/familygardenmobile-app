class CouponModel {
  String? message;
  String? logged;

  CouponModel({this.message, this.logged});

  CouponModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    logged = json['logged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['logged'] = this.logged;
    return data;
  }
}
