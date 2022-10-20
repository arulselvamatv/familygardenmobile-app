class CheckoutConfirmModel {
  CheckoutConfirmModel({
    required this.products,
    required this.vouchers,
    required this.totals,
    required this.payment,
  });
  late final List<Products> products;
  late final List<dynamic> vouchers;
  late final List<Totals> totals;
  late final Payment payment;

  CheckoutConfirmModel.fromJson(Map<String, dynamic> json) {
    products =
        List.from(json['products']).map((e) => Products.fromJson(e)).toList();
    vouchers = List.castFrom<dynamic, dynamic>(json['vouchers']);
    totals = List.from(json['totals']).map((e) => Totals.fromJson(e)).toList();
    payment = Payment.fromJson(json['payment']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['products'] = products.map((e) => e.toJson()).toList();
    _data['vouchers'] = vouchers;
    _data['totals'] = totals.map((e) => e.toJson()).toList();
    _data['payment'] = payment.toJson();
    return _data;
  }
}

class Products {
  Products({
    required this.cartId,
    required this.productId,
    required this.thumb,
    required this.name,
    required this.model,
    required this.option,
    required this.recurring,
    required this.quantity,
    required this.subtract,
    required this.price,
    required this.total,
    required this.href,
  });
  late final String cartId;
  late final String productId;
  late final String thumb;
  late final String name;
  late final String model;
  late final List<Option> option;
  late final String recurring;
  late final String quantity;
  late final String subtract;
  late final String price;
  late final String total;
  late final String href;

  Products.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    productId = json['product_id'];
    thumb = json['thumb'];
    name = json['name'];
    model = json['model'];
    option = List.from(json['option']).map((e) => Option.fromJson(e)).toList();
    recurring = json['recurring'];
    quantity = json['quantity'];
    subtract = json['subtract'];
    price = json['price'];
    total = json['total'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cart_id'] = cartId;
    _data['product_id'] = productId;
    _data['thumb'] = thumb;
    _data['name'] = name;
    _data['model'] = model;
    _data['option'] = option.map((e) => e.toJson()).toList();
    _data['recurring'] = recurring;
    _data['quantity'] = quantity;
    _data['subtract'] = subtract;
    _data['price'] = price;
    _data['total'] = total;
    _data['href'] = href;
    return _data;
  }
}

class Option {
  Option({
    required this.name,
    required this.value,
  });
  late final String name;
  late final String value;

  Option.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['value'] = value;
    return _data;
  }
}

class Totals {
  Totals({
    required this.title,
    required this.text,
  });
  late final String title;
  late final String text;

  Totals.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['text'] = text;
    return _data;
  }
}

class Payment {
  Payment({
    required this.buttonConfirm,
    required this.accessCode,
    required this.action,
    required this.tclink,
    required this.policylink,
    required this.encRequest,
  });
  late final String buttonConfirm;
  late final String accessCode;
  late final String action;
  late final String tclink;
  late final String policylink;
  late final String encRequest;

  Payment.fromJson(Map<String, dynamic> json) {
    buttonConfirm = json['button_confirm'];
    accessCode = json['access_code'];
    action = json['action'];
    tclink = json['tclink'];
    policylink = json['policylink'];
    encRequest = json['encRequest'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['button_confirm'] = buttonConfirm;
    _data['access_code'] = accessCode;
    _data['action'] = action;
    _data['tclink'] = tclink;
    _data['policylink'] = policylink;
    _data['encRequest'] = encRequest;
    return _data;
  }
}
