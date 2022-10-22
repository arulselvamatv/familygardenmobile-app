// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  SignupModel({
    this.checkout,
    this.errorWarning,
    this.errorFirstname,
    this.errorLastname,
    this.errorEmail,
    this.errorTelephone,
    this.errorPassword,
    this.errorConfirm,
  });

  String? checkout;
  String? errorWarning;
  String? errorFirstname;
  String? errorLastname;
  String? errorEmail;
  String? errorTelephone;
  String? errorPassword;
  String? errorConfirm;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        checkout: json["checkout"] == null ? null : json["checkout"],
        errorWarning:
            json["error_warning"] == null ? null : json["error_warning"],
        errorFirstname:
            json["error_firstname"] == null ? null : json["error_firstname"],
        errorLastname:
            json["error_lastname"] == null ? null : json["error_lastname"],
        errorEmail: json["error_email"] == null ? null : json["error_email"],
        errorTelephone:
            json["error_telephone"] == null ? null : json["error_telephone"],
        errorPassword:
            json["error_password"] == null ? null : json["error_password"],
        errorConfirm:
            json["error_confirm"] == null ? null : json["error_confirm"],
      );

  Map<String, dynamic> toJson() => {
        "checkout": checkout == null ? null : checkout,
        "error_warning": errorWarning == null ? null : errorWarning,
        "error_firstname": errorFirstname == null ? null : errorFirstname,
        "error_lastname": errorLastname == null ? null : errorLastname,
        "error_email": errorEmail == null ? null : errorEmail,
        "error_telephone": errorTelephone == null ? null : errorTelephone,
        "error_password": errorPassword == null ? null : errorPassword,
        "error_confirm": errorConfirm == null ? null : errorConfirm,
      };
}
