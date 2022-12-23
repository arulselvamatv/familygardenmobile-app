class AddAddressModel {
  String? success;
  int? status;
  String? logged;

  AddAddressModel({this.success, this.status, this.logged});

  AddAddressModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    logged = json['logged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['logged'] = this.logged;
    return data;
  }
}