class SignupModel {
  String? errorWarning;
  String? errorFirstname;
  String? errorEmail;
  String? errorTelephone;
  String? errorPassword;
  String? errorConfirm;

  SignupModel(
      {this.errorWarning,
        this.errorFirstname,
        this.errorEmail,
        this.errorTelephone,
        this.errorPassword,
        this.errorConfirm});

  SignupModel.fromJson(Map<String, dynamic> json) {
    errorWarning = json['error_warning'];
    errorFirstname = json['error_firstname'];
    errorEmail = json['error_email'];
    errorTelephone = json['error_telephone'];
    errorPassword = json['error_password'];
    errorConfirm = json['error_confirm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_warning'] = this.errorWarning;
    data['error_firstname'] = this.errorFirstname;
    data['error_email'] = this.errorEmail;
    data['error_telephone'] = this.errorTelephone;
    data['error_password'] = this.errorPassword;
    data['error_confirm'] = this.errorConfirm;
    return data;
  }
}
