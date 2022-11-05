class AccountAddressModel {
  String? errorWarning;
  String? success;
  List<Addresses>? addresses;
  String? add;
  String? back;
  dynamic logged;

  AccountAddressModel({
    this.errorWarning,
    this.success,
    this.addresses,
    this.add,
    this.back,
    this.logged,
  });

  AccountAddressModel.fromJson(Map<String, dynamic> json) {
    errorWarning = json['error_warning'];
    success = json['success'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
    add = json['add'];
    back = json['back'];
    back = json['logged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_warning'] = this.errorWarning;
    data['success'] = this.success;
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    data['add'] = this.add;
    data['back'] = this.back;
    data['logged'] = this.logged;
    return data;
  }
}

class Addresses {
  String? addressId;
  String? address;
  String? update;
  String? delete;

  Addresses({this.addressId, this.address, this.update, this.delete});

  Addresses.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    address = json['address'];
    update = json['update'];
    delete = json['delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address'] = this.address;
    data['update'] = this.update;
    data['delete'] = this.delete;
    return data;
  }
}
