// To parse this JSON data, do
//
//     final cartListModel = cartListModelFromJson(jsonString);

import 'dart:convert';

LoginModel cartListModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String LoginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.errorWarning,
    this.status,
    this.redirect,
    this.success,
    this.session,
    this.firstname,
    this.lastname,
    this.email,
    this.telephone,
    this.customFields,
    this.accountCustomField,
  });

  String? errorWarning;
  int? status;
  String? redirect;
  String? success;
  Session? session;
  String? firstname;
  String? lastname;
  String? email;
  String? telephone;
  List<dynamic>? customFields;
  dynamic accountCustomField;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        errorWarning:
            json["error_warning"] == null ? null : json["error_warning"],
        status: json["status"] == null ? null : json["status"],
        redirect: json["redirect"] == null ? null : json["redirect"],
        success: json["success"] == null ? null : json["success"],
        session:
            json["session"] == null ? null : Session.fromJson(json["session"]),
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        email: json["email"] == null ? null : json["email"],
        telephone: json["telephone"] == null ? null : json["telephone"],
        customFields: json["custom_fields"] == null
            ? null
            : List<dynamic>.from(json["custom_fields"].map((x) => x)),
        accountCustomField: json["account_custom_field"],
      );

  Map<String, dynamic> toJson() => {
        "error_warning": errorWarning == null ? null : errorWarning,
        "status": status == null ? null : status,
        "redirect": redirect == null ? null : redirect,
        "success": success == null ? null : success,
        "session": session == null ? null : session?.toJson(),
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "email": email == null ? null : email,
        "telephone": telephone == null ? null : telephone,
        "custom_fields": customFields == null
            ? null
            : List<dynamic>.from(customFields!.map((x) => x)),
        "account_custom_field": accountCustomField,
      };
}

class Session {
  Session({
    this.language,
    this.currency,
    this.customerId,
    this.shippingAddress,
  });

  String? language;
  String? currency;
  String? customerId;
  dynamic shippingAddress;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        language: json["language"] == null ? null : json["language"],
        currency: json["currency"] == null ? null : json["currency"],
        customerId: json["customer_id"] == null ? null : json["customer_id"],
        shippingAddress: json["shipping_address"],
      );

  Map<String, dynamic> toJson() => {
        "language": language == null ? null : language,
        "currency": currency == null ? null : currency,
        "customer_id": customerId == null ? null : customerId,
        "shipping_address": shippingAddress,
      };
}
