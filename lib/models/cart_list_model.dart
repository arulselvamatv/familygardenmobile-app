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
  Product({
    this.productId,
    this.cartId,
    this.thumb,
    this.name,
    this.pnameTamil,
    this.model,
    this.recurring,
    this.quantity,
    this.stock,
    this.reward,
    this.offerPrice,
    this.actualPrice,
    this.total,
    this.href,
    this.value,
    this.productOptionId,
    this.productOptionValueId,
    this.optionId,
    this.optionValueId,
    this.type,
    this.points,
    this.pricePrefix,
    this.offerPercentage = 0,
    this.pointsPrefix,
    this.weight,
    this.weightPrefix,
  });

  String? productId;
  String? cartId;
  String? thumb;
  String? name;
  String? pnameTamil;
  String? model;
  String? recurring;
  String? quantity;
  bool? stock;
  String? reward;
  String? offerPrice;
  String? actualPrice;
  String? total;
  String? href;
  String? value;
  String? productOptionId;
  String? productOptionValueId;
  String? optionId;
  String? optionValueId;
  String? type;
  String? points;
  String? pricePrefix;
  int? offerPercentage;
  String? pointsPrefix;
  String? weight;
  String? weightPrefix;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"] == null ? null : json["product_id"],
        cartId: json["cart_id"] == null ? null : json["cart_id"],
        thumb: json["thumb"] == null ? null : json["thumb"],
        name: json["name"] == null ? null : json["name"],
        pnameTamil: json["pname_tamil"] == null ? null : json["pname_tamil"],
        model: json["model"] == null ? null : json["model"],
        recurring: json["recurring"] == null ? null : json["recurring"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        stock: json["stock"] == null ? null : json["stock"],
        reward: json["reward"] == null ? null : json["reward"],
        offerPrice: json["offer_price"] == null ? null : json["offer_price"],
        actualPrice: json["actual_price"] == null ? null : json["actual_price"],
        total: json["total"] == null ? null : json["total"],
        href: json["href"] == null ? null : json["href"],
        value: json["value"] == null ? null : json["value"],
        productOptionId: json["product_option_id"] == null
            ? null
            : json["product_option_id"],
        productOptionValueId: json["product_option_value_id"] == null
            ? null
            : json["product_option_value_id"],
        optionId: json["option_id"] == null ? null : json["option_id"],
        optionValueId:
            json["option_value_id"] == null ? null : json["option_value_id"],
        type: json["type"] == null ? null : json["type"],
        points: json["points"] == null ? null : json["points"],
        pricePrefix: json["price_prefix"] == null ? null : json["price_prefix"],
        pointsPrefix:
            json["points_prefix"] == null ? null : json["points_prefix"],
        weight: json["weight"] == null ? null : json["weight"],
        weightPrefix:
            json["weight_prefix"] == null ? null : json["weight_prefix"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId == null ? null : productId,
        "cart_id": cartId == null ? null : cartId,
        "thumb": thumb == null ? null : thumb,
        "name": name == null ? null : name,
        "pname_tamil": pnameTamil == null ? null : pnameTamil,
        "model": model == null ? null : model,
        "recurring": recurring == null ? null : recurring,
        "quantity": quantity == null ? null : quantity,
        "stock": stock == null ? null : stock,
        "reward": reward == null ? null : reward,
        "offer_price": offerPrice == null ? null : offerPrice,
        "actual_price": actualPrice == null ? null : actualPrice,
        "total": total == null ? null : total,
        "href": href == null ? null : href,
        "value": value == null ? null : value,
        "product_option_id": productOptionId == null ? null : productOptionId,
        "product_option_value_id":
            productOptionValueId == null ? null : productOptionValueId,
        "option_id": optionId == null ? null : optionId,
        "option_value_id": optionValueId == null ? null : optionValueId,
        "type": type == null ? null : type,
        "points": points == null ? null : points,
        "price_prefix": pricePrefix == null ? null : pricePrefix,
        "points_prefix": pointsPrefix == null ? null : pointsPrefix,
        "weight": weight == null ? null : weight,
        "weight_prefix": weightPrefix == null ? null : weightPrefix,
      };
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
