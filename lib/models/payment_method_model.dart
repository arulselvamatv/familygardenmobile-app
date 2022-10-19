class PaymentMethodModel {
  PaymentMethodModel({
    this.errorWarning,
    this.paymentMethods,
    this.code,
    this.comment,
    this.scripts,
    this.textAgree,
    this.agree,
  });
  late final String? errorWarning;
  late final PaymentMethods? paymentMethods;
  late final String? code;
  late final String? comment;
  late final List<dynamic>? scripts;
  late final String? textAgree;
  late final String? agree;

  PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    errorWarning = json['error_warning'];
    paymentMethods = PaymentMethods.fromJson(json['payment_methods']);
    code = json['code'];
    comment = json['comment'];
    scripts = List.castFrom<dynamic, dynamic>(json['scripts']);
    textAgree = json['text_agree'];
    agree = json['agree'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['error_warning'] = errorWarning;
    _data['payment_methods'] = paymentMethods?.toJson();
    _data['code'] = code;
    _data['comment'] = comment;
    _data['scripts'] = scripts;
    _data['text_agree'] = textAgree;
    _data['agree'] = agree;
    return _data;
  }
}

class PaymentMethods {
  PaymentMethods({
    required this.ccavenuepay,
    required this.cod,
  });
  late final Ccavenuepay ccavenuepay;
  late final Cod cod;

  PaymentMethods.fromJson(Map<String, dynamic> json) {
    ccavenuepay = Ccavenuepay.fromJson(json['ccavenuepay']);
    cod = Cod.fromJson(json['cod']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ccavenuepay'] = ccavenuepay.toJson();
    _data['cod'] = cod.toJson();
    return _data;
  }
}

class Ccavenuepay {
  Ccavenuepay({
    required this.code,
    required this.title,
    required this.sortOrder,
    required this.terms,
  });
  late final String code;
  late final String title;
  late final String sortOrder;
  late final String terms;

  Ccavenuepay.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    title = json['title'];
    sortOrder = json['sort_order'];
    terms = json['terms'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['title'] = title;
    _data['sort_order'] = sortOrder;
    _data['terms'] = terms;
    return _data;
  }
}

class Cod {
  Cod({
    required this.code,
    required this.title,
    required this.terms,
    required this.sortOrder,
  });
  late final String code;
  late final String title;
  late final String terms;
  late final String sortOrder;

  Cod.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    title = json['title'];
    terms = json['terms'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['title'] = title;
    _data['terms'] = terms;
    _data['sort_order'] = sortOrder;
    return _data;
  }
}
