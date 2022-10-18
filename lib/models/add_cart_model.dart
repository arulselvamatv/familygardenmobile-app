class AddCartModel {
  String? success;
  int? status;
  String? total;
  Null? logged;
  String? sessionName;

  AddCartModel(
      {this.success, this.status, this.total, this.logged, this.sessionName});

  AddCartModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    total = json['total'];
    logged = json['logged'];
    sessionName = json['session_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['total'] = this.total;
    data['logged'] = this.logged;
    data['session_name'] = this.sessionName;
    return data;
  }
}
