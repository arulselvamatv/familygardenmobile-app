class GetTokenModel {
  String? success;
  String? apiToken;

  GetTokenModel({this.success, this.apiToken});

  GetTokenModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    apiToken = json['api_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    data['api_token'] = this.apiToken;
    return data;
  }
}
