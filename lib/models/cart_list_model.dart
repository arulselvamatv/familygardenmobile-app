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

  final List<Breadcrumb>? breadcrumbs;
  final String? errorWarning;
  final String? attention;
  final String? success;
  final String? action;
  final String? weight;
  final List<Product>? products;
  final List<dynamic>? vouchers;
  final List<Total>? totals;
  final String? cartListModelContinue;
  final String? checkout;
  final dynamic logged;

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

  final String? href;
  final String? text;

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
    this.option,
    this.recurring,
    this.quantity,
    this.stock,
    this.reward,
    this.offerPrice,
    this.actualPrice,
    this.total,
    this.href,
    this.options,
  });

  final String? productId;
  final String? cartId;
  final String? thumb;
  final String? name;
  final String? pnameTamil;
  final String? model;
  final List<dynamic>? option;
  final String? recurring;
  final String? quantity;
  final bool? stock;
  final String? reward;
  final String? offerPrice;
  final String? actualPrice;
  final String? total;
  final String? href;
  final List<Option>? options;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"] == null ? null : json["product_id"],
        cartId: json["cart_id"] == null ? null : json["cart_id"],
        thumb: json["thumb"] == null ? null : json["thumb"],
        name: json["name"] == null ? null : json["name"],
        pnameTamil: json["pname_tamil"] == null ? null : json["pname_tamil"],
        model: json["model"] == null ? null : json["model"],
        option: json["option"] == null
            ? null
            : List<dynamic>.from(json["option"].map((x) => x)),
        recurring: json["recurring"] == null ? null : json["recurring"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        stock: json["stock"] == null ? null : json["stock"],
        reward: json["reward"] == null ? null : json["reward"],
        offerPrice: json["offer_price"] == null ? null : json["offer_price"],
        actualPrice: json["actual_price"] == null ? null : json["actual_price"],
        total: json["total"] == null ? null : json["total"],
        href: json["href"] == null ? null : json["href"],
        options: json["options"] == null
            ? null
            : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId == null ? null : productId,
        "cart_id": cartId == null ? null : cartId,
        "thumb": thumb == null ? null : thumb,
        "name": name == null ? null : name,
        "pname_tamil": pnameTamil == null ? null : pnameTamil,
        "model": model == null ? null : model,
        "option":
            option == null ? null : List<dynamic>.from(option!.map((x) => x)),
        "recurring": recurring == null ? null : recurring,
        "quantity": quantity == null ? null : quantity,
        "stock": stock == null ? null : stock,
        "reward": reward == null ? null : reward,
        "offer_price": offerPrice == null ? null : offerPrice,
        "actual_price": actualPrice == null ? null : actualPrice,
        "total": total == null ? null : total,
        "href": href == null ? null : href,
        "options": options == null
            ? null
            : List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}

class Option {
  Option({
    this.productOptionId,
    this.productOptionValue,
    this.optionId,
    this.name,
    this.type,
    this.value,
    this.required,
  });

  final String? productOptionId;
  final List<ProductOptionValue>? productOptionValue;
  final String? optionId;
  final String? name;
  final String? type;
  final String? value;
  final String? required;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        productOptionId: json["product_option_id"] == null
            ? null
            : json["product_option_id"],
        productOptionValue: json["product_option_value"] == null
            ? null
            : List<ProductOptionValue>.from(json["product_option_value"]
                .map((x) => ProductOptionValue.fromJson(x))),
        optionId: json["option_id"] == null ? null : json["option_id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        value: json["value"] == null ? null : json["value"],
        required: json["required"] == null ? null : json["required"],
      );

  Map<String, dynamic> toJson() => {
        "product_option_id": productOptionId == null ? null : productOptionId,
        "product_option_value": productOptionValue == null
            ? null
            : List<dynamic>.from(productOptionValue!.map((x) => x.toJson())),
        "option_id": optionId == null ? null : optionId,
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "value": value == null ? null : value,
        "required": required == null ? null : required,
      };
}

class ProductOptionValue {
  ProductOptionValue({
    this.productOptionValueId,
    this.optionValueId,
    this.name,
    this.image,
    this.quantity,
    this.offer,
    this.priceDefault,
    this.subtract,
    this.price,
    this.pricePrefix,
    this.weight,
    this.weightPrefix,
  });

  final String? productOptionValueId;
  final String? optionValueId;
  final String? name;
  final String? image;
  final String? quantity;
  final String? offer;
  final String? priceDefault;
  final String? subtract;
  final String? price;
  final String? pricePrefix;
  final String? weight;
  final String? weightPrefix;

  factory ProductOptionValue.fromJson(Map<String, dynamic> json) =>
      ProductOptionValue(
        productOptionValueId: json["product_option_value_id"] == null
            ? null
            : json["product_option_value_id"],
        optionValueId:
            json["option_value_id"] == null ? null : json["option_value_id"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        offer: json["offer"] == null ? null : json["offer"],
        priceDefault:
            json["price_default"] == null ? null : json["price_default"],
        subtract: json["subtract"] == null ? null : json["subtract"],
        price: json["price"] == null ? null : json["price"],
        pricePrefix: json["price_prefix"] == null ? null : json["price_prefix"],
        weight: json["weight"] == null ? null : json["weight"],
        weightPrefix:
            json["weight_prefix"] == null ? null : json["weight_prefix"],
      );

  Map<String, dynamic> toJson() => {
        "product_option_value_id":
            productOptionValueId == null ? null : productOptionValueId,
        "option_value_id": optionValueId == null ? null : optionValueId,
        "name": name == null ? null : name,
        "image": image == null ? null : image,
        "quantity": quantity == null ? null : quantity,
        "offer": offer == null ? null : offer,
        "price_default": priceDefault == null ? null : priceDefault,
        "subtract": subtract == null ? null : subtract,
        "price": price == null ? null : price,
        "price_prefix": pricePrefix == null ? null : pricePrefix,
        "weight": weight == null ? null : weight,
        "weight_prefix": weightPrefix == null ? null : weightPrefix,
      };
}

class Total {
  Total({
    this.title,
    this.text,
  });

  final String? title;
  final String? text;

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        title: json["title"] == null ? null : json["title"],
        text: json["text"] == null ? null : json["text"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "text": text == null ? null : text,
      };
}
