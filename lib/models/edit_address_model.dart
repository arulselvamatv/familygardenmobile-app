class EditAddressModel {
  String? success;
  int? status;

  EditAddressModel({this.success, this.status});

  EditAddressModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    return data;
  }
}
