class CheckoutModel {
  String? addressId;
  List<Addresses>? addresses;
  String? telephone;
  String? logged;
  String? countryId;
  String? zoneId;

  CheckoutModel({
    this.addressId,
    this.addresses,
    this.telephone,
    this.logged,
    this.countryId,
    this.zoneId,
  });

  CheckoutModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
    telephone = json['telephone'];
    logged = json['logged'];
    countryId = json['country_id'];
    zoneId = json['zone_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    data['telephone'] = this.telephone;
    data['logged'] = this.logged;
    data['country_id'] = this.countryId;
    data['zone_id'] = this.zoneId;
    return data;
  }
}

class Addresses {
  String? addressId;
  String? firstname;
  String? lastname;
  String? email;
  String? company;
  String? address1;
  String? address2;
  String? postcode;
  String? city;
  String? zoneId;
  String? zone;
  String? zoneCode;
  String? countryId;
  String? telephone;
  String? country;
  String? isoCode2;
  String? isoCode3;
  String? addressFormat;
  Null? customField;

  Addresses(
      {this.addressId,
      this.firstname,
      this.lastname,
      this.email,
      this.company,
      this.address1,
      this.address2,
      this.postcode,
      this.city,
      this.zoneId,
      this.zone,
      this.zoneCode,
      this.countryId,
      this.telephone,
      this.country,
      this.isoCode2,
      this.isoCode3,
      this.addressFormat,
      this.customField});

  Addresses.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    company = json['company'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    postcode = json['postcode'];
    city = json['city'];
    zoneId = json['zone_id'];
    zone = json['zone'];
    zoneCode = json['zone_code'];
    countryId = json['country_id'];
    telephone = json['telephone'];
    country = json['country'];
    isoCode2 = json['iso_code_2'];
    isoCode3 = json['iso_code_3'];
    addressFormat = json['address_format'];
    customField = json['custom_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['company'] = this.company;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['postcode'] = this.postcode;
    data['city'] = this.city;
    data['zone_id'] = this.zoneId;
    data['zone'] = this.zone;
    data['zone_code'] = this.zoneCode;
    data['country_id'] = this.countryId;
    data['telephone'] = this.telephone;
    data['country'] = this.country;
    data['iso_code_2'] = this.isoCode2;
    data['iso_code_3'] = this.isoCode3;
    data['address_format'] = this.addressFormat;
    data['custom_field'] = this.customField;
    return data;
  }
}
