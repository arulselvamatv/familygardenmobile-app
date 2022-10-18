// To parse this JSON data, do
//
//     final cartListModel = cartListModelFromJson(jsonString);

import 'dart:convert';

CartListModel cartListModelFromJson(String str) =>
    CartListModel.fromJson(json.decode(str));

String cartListModelToJson(CartListModel data) => json.encode(data.toJson());

class CartListModel {
  CartListModel({
    this.breadcrumbs,
    this.errorWarning,
    this.attention,
    this.success,
    this.action,
    this.weight,
    this.products,
    this.vouchers,
    this.totals,
    this.cartListModelContinue,
    this.checkout,
    this.logged,
  });

  List<Breadcrumb>? breadcrumbs;
  String? errorWarning;
  String? attention;
  String? success;
  String? action;
  String? weight;
  List<Product>? products;
  List<dynamic>? vouchers;
  List<Total>? totals;
  String? cartListModelContinue;
  String? checkout;
  dynamic logged;

  factory CartListModel.fromJson(Map<String, dynamic> json) => CartListModel(
        breadcrumbs: json["breadcrumbs"] == null
            ? null
            : List<Breadcrumb>.from(
                json["breadcrumbs"].map((x) => Breadcrumb.fromJson(x))),
        errorWarning:
            json["error_warning"] == null ? null : json["error_warning"],
        attention: json["attention"] == null ? null : json["attention"],
        success: json["success"] == null ? null : json["success"],
        action: json["action"] == null ? null : json["action"],
        weight: json["weight"] == null ? null : json["weight"],
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
        vouchers: json["vouchers"] == null
            ? null
            : List<dynamic>.from(json["vouchers"].map((x) => x)),
        totals: json["totals"] == null
            ? null
            : List<Total>.from(json["totals"].map((x) => Total.fromJson(x))),
        cartListModelContinue:
            json["continue"] == null ? null : json["continue"],
        checkout: json["checkout"] == null ? null : json["checkout"],
        logged: json["logged"],
      );

  Map<String, dynamic> toJson() => {
        "breadcrumbs": breadcrumbs == null
            ? null
            : List<dynamic>.from(breadcrumbs!.map((x) => x.toJson())),
        "error_warning": errorWarning == null ? null : errorWarning,
        "attention": attention == null ? null : attention,
        "success": success == null ? null : success,
        "action": action == null ? null : action,
        "weight": weight == null ? null : weight,
        "products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "vouchers": vouchers == null
            ? null
            : List<dynamic>.from(vouchers!.map((x) => x)),
        "totals": totals == null
            ? null
            : List<dynamic>.from(totals!.map((x) => x.toJson())),
        "continue":
            cartListModelContinue == null ? null : cartListModelContinue,
        "checkout": checkout == null ? null : checkout,
        "logged": logged,
      };
}

class Breadcrumb {
  Breadcrumb({
    this.href,
    this.text,
  });

  String? href;
  String? text;

  factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
        href: json["href"] == null ? null : json["href"],
        text: json["text"] == null ? null : json["text"],
      );

  Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
        "text": text == null ? null : text,
      };
}

class Product {
  String? productId;
  String? cartId;
  String? thumb;
  String? name;
  String? pnameTamil;
  String? model;
  List<Null>? option;
  String? recurring;
  String? quantity;
  bool? stock;
  String? reward;
  String? offerPrice;
  String? actualPrice;
  String? total;
  String? href;

  Product(
      {this.productId,
      this.cartId,
      this.thumb,
      this.name,
      this.pnameTamil,
      this.model,
      this.option,
      this.recurring,
      this.quantity,
      this.stock,
      this.reward,
      this.offerPrice,
      this.actualPrice,
      this.total,
      this.href});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    cartId = json['cart_id'];
    thumb = json['thumb'];
    name = json['name'];
    pnameTamil = json['pname_tamil'];
    model = json['model'];
    // if (json['option'] != null) {
    //   option = <Null>[];
    //   json['option'].forEach((v) {
    //     option!.add(new Null.fromJson(v));
    //   });
    // }
    recurring = json['recurring'];
    quantity = json['quantity'];
    stock = json['stock'];
    reward = json['reward'];
    offerPrice = json['offer_price'];
    actualPrice = json['actual_price'];
    total = json['total'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['cart_id'] = this.cartId;
    data['thumb'] = this.thumb;
    data['name'] = this.name;
    data['pname_tamil'] = this.pnameTamil;
    data['model'] = this.model;
    // if (this.option != null) {
    //   data['option'] = this.option!.map((v) => v?.toJson()).toList();
    // }
    data['recurring'] = this.recurring;
    data['quantity'] = this.quantity;
    data['stock'] = this.stock;
    data['reward'] = this.reward;
    data['offer_price'] = this.offerPrice;
    data['actual_price'] = this.actualPrice;
    data['total'] = this.total;
    data['href'] = this.href;
    return data;
  }
}

class Total {
  Total({
    this.title,
    this.text,
  });

  String? title;
  String? text;

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        title: json["title"] == null ? null : json["title"],
        text: json["text"] == null ? null : json["text"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "text": text == null ? null : text,
      };
}
