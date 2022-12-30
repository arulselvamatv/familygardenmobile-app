class InformationDetailsModel {
  String? headingTitle;
  String? description;
  String? logged;

  InformationDetailsModel({this.headingTitle, this.description, this.logged});

  InformationDetailsModel.fromJson(Map<String, dynamic> json) {
    headingTitle = json['heading_title'];
    description = json['description'];
    logged = json['logged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['heading_title'] = this.headingTitle;
    data['description'] = this.description;
    data['logged'] = this.logged;
    return data;
  }
}
