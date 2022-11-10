class CouponModel {
  String? error;

  CouponModel({this.error});

  CouponModel.fromJson(Map<String, dynamic> json) {
    error = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.error;
    return data;
  }
}
