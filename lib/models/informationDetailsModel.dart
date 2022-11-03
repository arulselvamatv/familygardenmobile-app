class informationDetailsModel {
  String? headingTitle;
  String? description;

  informationDetailsModel({this.headingTitle, this.description});

  informationDetailsModel.fromJson(Map<String, dynamic> json) {
    headingTitle = json['heading_title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['heading_title'] = this.headingTitle;
    data['description'] = this.description;
    return data;
  }
}
