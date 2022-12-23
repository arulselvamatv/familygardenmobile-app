class PaymentMethodSaveModel {
  int? status;
  String? message;
  String? logged;

  PaymentMethodSaveModel({this.status, this.message, this.logged});

  PaymentMethodSaveModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    logged = json['logged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['logged'] = this.logged;
    return data;
  }
}
