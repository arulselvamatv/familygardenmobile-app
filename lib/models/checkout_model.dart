class CheckoutModel {
  CheckoutModel({
    this.addressId,
    this.addresses,
    this.telephone,
    this.logged,
    this.countryId,
    this.zoneId,
    this.customFields,
    this.paymentAddressCustomField,
  });
  late final Null addressId;
  late final List<Addresses>? addresses;
  late final String? telephone;
  late final Null logged;
  late final String? countryId;
  late final String? zoneId;
  late final List<dynamic>? customFields;
  late final List<dynamic>? paymentAddressCustomField;

  CheckoutModel.fromJson(Map<String, dynamic> json) {
    addressId = null;
    addresses =
        List.from(json['addresses']).map((e) => Addresses.fromJson(e)).toList();
    telephone = json['telephone'];
    logged = null;
    countryId = json['country_id'];
    zoneId = json['zone_id'];
    customFields = List.castFrom<dynamic, dynamic>(json['custom_fields']);
    paymentAddressCustomField =
        List.castFrom<dynamic, dynamic>(json['payment_address_custom_field']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address_id'] = addressId;
    _data['addresses'] = addresses?.map((e) => e.toJson()).toList();
    _data['telephone'] = telephone;
    _data['logged'] = logged;
    _data['country_id'] = countryId;
    _data['zone_id'] = zoneId;
    _data['custom_fields'] = customFields;
    _data['payment_address_custom_field'] = paymentAddressCustomField;
    return _data;
  }
}

class Addresses {
  Addresses({
    required this.addressId,
    required this.firstname,
    required this.lastname,
    required this.company,
    required this.address_1,
    required this.address_2,
    required this.postcode,
    required this.city,
    required this.zoneId,
    required this.zone,
    required this.zoneCode,
    required this.countryId,
    required this.telephone,
    required this.country,
    required this.isoCode_2,
    required this.isoCode_3,
    required this.addressFormat,
    this.customField,
  });
  late final String addressId;
  late final String firstname;
  late final String lastname;
  late final String company;
  late final String address_1;
  late final String address_2;
  late final String postcode;
  late final String city;
  late final String zoneId;
  late final String zone;
  late final String zoneCode;
  late final String countryId;
  late final String telephone;
  late final String country;
  late final String isoCode_2;
  late final String isoCode_3;
  late final String addressFormat;
  late final Null customField;

  Addresses.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    company = json['company'];
    address_1 = json['address_1'];
    address_2 = json['address_2'];
    postcode = json['postcode'];
    city = json['city'];
    zoneId = json['zone_id'];
    zone = json['zone'];
    zoneCode = json['zone_code'];
    countryId = json['country_id'];
    telephone = json['telephone'];
    country = json['country'];
    isoCode_2 = json['iso_code_2'];
    isoCode_3 = json['iso_code_3'];
    addressFormat = json['address_format'];
    customField = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address_id'] = addressId;
    _data['firstname'] = firstname;
    _data['lastname'] = lastname;
    _data['company'] = company;
    _data['address_1'] = address_1;
    _data['address_2'] = address_2;
    _data['postcode'] = postcode;
    _data['city'] = city;
    _data['zone_id'] = zoneId;
    _data['zone'] = zone;
    _data['zone_code'] = zoneCode;
    _data['country_id'] = countryId;
    _data['telephone'] = telephone;
    _data['country'] = country;
    _data['iso_code_2'] = isoCode_2;
    _data['iso_code_3'] = isoCode_3;
    _data['address_format'] = addressFormat;
    _data['custom_field'] = customField;
    return _data;
  }
}
