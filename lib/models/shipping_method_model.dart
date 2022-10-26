class ShippingMethodModel {
  ShippingMethodModel({
    required this.errorWarning,
    required this.shippingMethods,
    required this.code,
    required this.comment,
  });
  late final String? errorWarning;
  late final ShippingMethods shippingMethods;
  late final String? code;
  late final String? comment;

  ShippingMethodModel.fromJson(Map<String, dynamic> json) {
    errorWarning = json['error_warning'];
    shippingMethods = ShippingMethods.fromJson(json['shipping_methods']);
    code = json['code'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['error_warning'] = errorWarning;
    _data['shipping_methods'] = shippingMethods.toJson();
    _data['code'] = code;
    _data['comment'] = comment;
    return _data;
  }
}

class ShippingMethods {
  ShippingMethods({
    required this.flat,
  });
  late final Flat flat;

  ShippingMethods.fromJson(Map<String, dynamic> json) {
    flat = Flat.fromJson(json['flat']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['flat'] = flat.toJson();
    return _data;
  }
}

class Flat {
  Flat({
    required this.title,
    required this.quote,
    required this.sortOrder,
    required this.error,
  });
  late final String title;
  late final Quote quote;
  late final String sortOrder;
  late final bool error;

  Flat.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    quote = Quote.fromJson(json['quote']);
    sortOrder = json['sort_order'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['quote'] = quote.toJson();
    _data['sort_order'] = sortOrder;
    _data['error'] = error;
    return _data;
  }
}

class Quote {
  Quote({
    required this.flat,
  });
  late final Flat flat;

  Quote.fromJson(Map<String, dynamic> json) {
    flat = Flat.fromJson(json['flat']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['flat'] = flat.toJson();
    return _data;
  }
}
