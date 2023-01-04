class LoginModel {
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
  List<Null>? customFields;
  Null? accountCustomField;
  String? errorWarning;

  LoginModel(
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
        this.errorWarning,
        this.accountCustomField});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
    errorWarning = json['error_warning'];
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
  ShippingAddress? shippingAddress;

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
    shippingAddress = json['shipping_address'] != null
        ? new ShippingAddress.fromJson(json['shipping_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_id'] = this.apiId;
    data['language'] = this.language;
    data['currency'] = this.currency;
    data['customer_id'] = this.customerId;
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress!.toJson();
    }
    return data;
  }
}

class ShippingAddress {
  String? addressId;
  String? firstname;
  String? lastname;
  String? company;
  String? address1;
  String? address2;
  String? postcode;
  String? city;
  String? zoneId;
  String? telephone;
  String? zone;
  String? zoneCode;
  String? countryId;
  String? country;
  String? isoCode2;
  String? isoCode3;
  String? addressFormat;
  // Null? customField;

  ShippingAddress(
      {this.addressId,
        this.firstname,
        this.lastname,
        this.company,
        this.address1,
        this.address2,
        this.postcode,
        this.city,
        this.zoneId,
        this.telephone,
        this.zone,
        this.zoneCode,
        this.countryId,
        this.country,
        this.isoCode2,
        this.isoCode3,
        this.addressFormat,
        // this.customField
      });

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    company = json['company'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    postcode = json['postcode'];
    city = json['city'];
    zoneId = json['zone_id'];
    telephone = json['telephone'];
    zone = json['zone'];
    zoneCode = json['zone_code'];
    countryId = json['country_id'];
    country = json['country'];
    isoCode2 = json['iso_code_2'];
    isoCode3 = json['iso_code_3'];
    addressFormat = json['address_format'];
    // customField = json['custom_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['company'] = this.company;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['postcode'] = this.postcode;
    data['city'] = this.city;
    data['zone_id'] = this.zoneId;
    data['telephone'] = this.telephone;
    data['zone'] = this.zone;
    data['zone_code'] = this.zoneCode;
    data['country_id'] = this.countryId;
    data['country'] = this.country;
    data['iso_code_2'] = this.isoCode2;
    data['iso_code_3'] = this.isoCode3;
    data['address_format'] = this.addressFormat;
    // data['custom_field'] = this.customField;
    return data;
  }
}
