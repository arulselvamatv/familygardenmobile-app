class ReCreateSessionModel {
  int? status;
  String? redirect;
  String? success;
  Session? session;
  String? firstname;
  String? lastname;
  String? email;
  String? telephone;
  String? userToken;
  String? logged;
  List<dynamic>? customFields;
  dynamic? accountCustomField;

  ReCreateSessionModel(
      {this.status,
        this.redirect,
        this.success,
        this.session,
        this.firstname,
        this.lastname,
        this.email,
        this.telephone,
        this.userToken,
        this.logged,
        this.customFields,
        this.accountCustomField});

  ReCreateSessionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    redirect = json['redirect'];
    success = json['success'];
    session =
    json['session'] != null ? new Session.fromJson(json['session']) : null;
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    telephone = json['telephone'];
    userToken = json['user_token'];
    logged = json['logged'];
    // if (json['custom_fields'] != null) {
    //   customFields = <Null>[];
    //   json['custom_fields'].forEach((v) {
    //     customFields!.add(new Null.fromJson(v));
    //   });
    // }
    accountCustomField = json['account_custom_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['redirect'] = this.redirect;
    data['success'] = this.success;
    if (this.session != null) {
      data['session'] = this.session!.toJson();
    }
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    data['user_token'] = this.userToken;
    data['logged'] = this.logged;
    // if (this.customFields != null) {
    //   data['custom_fields'] =
    //       this.customFields!.map((v) => v.toJson()).toList();
    // }
    data['account_custom_field'] = this.accountCustomField;
    return data;
  }
}

class Session {
  String? apiId;
  String? language;
  String? currency;
  String? customerId;
  Null? shippingAddress;

  Session(
      {this.apiId,
        this.language,
        this.currency,
        this.customerId,
        this.shippingAddress});

  Session.fromJson(Map<String, dynamic> json) {
    apiId = json['api_id'];
    language = json['language'];
    currency = json['currency'];
    customerId = json['customer_id'];
    shippingAddress = json['shipping_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_id'] = this.apiId;
    data['language'] = this.language;
    data['currency'] = this.currency;
    data['customer_id'] = this.customerId;
    data['shipping_address'] = this.shippingAddress;
    return data;
  }
}
