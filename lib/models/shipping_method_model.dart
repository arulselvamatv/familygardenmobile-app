// To parse this JSON data, do
//
//     final shippingMethodModel = shippingMethodModelFromJson(jsonString);

import 'dart:convert';

ShippingMethodModel shippingMethodModelFromJson(String str) =>
    ShippingMethodModel.fromJson(json.decode(str));

String shippingMethodModelToJson(ShippingMethodModel data) =>
    json.encode(data.toJson());

class ShippingMethodModel {
  ShippingMethodModel({
    this.errorWarning,
    this.shippingMethods,
    this.code,
    this.comment,
    this.logged,
  });

  final String? errorWarning;
  final ShippingMethods? shippingMethods;
  final String? code;
  final String? comment;
  final String? logged;

  factory ShippingMethodModel.fromJson(Map<String, dynamic> json) =>
      ShippingMethodModel(
        errorWarning:
            json["error_warning"] == null ? null : json["error_warning"],
        shippingMethods: json["shipping_methods"] == null
            ? null
            : ShippingMethods.fromJson(json["shipping_methods"]),
        code: json["code"] == null ? null : json["code"],
        comment: json["comment"] == null ? null : json["comment"],
        logged: json["logged"] == null ? null : json["logged"],
      );

  Map<String, dynamic> toJson() => {
        "error_warning": errorWarning == null ? null : errorWarning,
        "shipping_methods":
            shippingMethods == null ? null : shippingMethods?.toJson(),
        "code": code == null ? null : code,
        "comment": comment == null ? null : comment,
        "logged": logged == null ? null : logged,
      };
}

class ShippingMethods {
  ShippingMethods({
    this.flat,
  });

  final ShippingMethodsFlat? flat;

  factory ShippingMethods.fromJson(Map<String, dynamic> json) =>
      ShippingMethods(
        flat: json["flat"] == null
            ? null
            : ShippingMethodsFlat.fromJson(json["flat"]),
      );

  Map<String, dynamic> toJson() => {
        "flat": flat == null ? null : flat?.toJson(),
      };
}

class ShippingMethodsFlat {
  ShippingMethodsFlat({
    this.title,
    this.quote,
    this.sortOrder,
    this.error,
  });

  final String? title;
  final Quote? quote;
  final String? sortOrder;
  final bool? error;

  factory ShippingMethodsFlat.fromJson(Map<String, dynamic> json) =>
      ShippingMethodsFlat(
        title: json["title"] == null ? null : json["title"],
        quote: json["quote"] == null ? null : Quote.fromJson(json["quote"]),
        sortOrder: json["sort_order"] == null ? null : json["sort_order"],
        error: json["error"] == null ? null : json["error"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "quote": quote == null ? null : quote?.toJson(),
        "sort_order": sortOrder == null ? null : sortOrder,
        "error": error == null ? null : error,
      };
}

class Quote {
  Quote({
    this.flat,
  });

  final QuoteFlat? flat;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        flat: json["flat"] == null ? null : QuoteFlat.fromJson(json["flat"]),
      );

  Map<String, dynamic> toJson() => {
        "flat": flat == null ? null : flat?.toJson(),
      };
}

class QuoteFlat {
  QuoteFlat({
    this.code,
    this.title,
    this.cost,
    this.taxClassId,
    this.text,
  });

  final String? code;
  final String? title;
  final int? cost;
  final String? taxClassId;
  final String? text;

  factory QuoteFlat.fromJson(Map<String, dynamic> json) => QuoteFlat(
        code: json["code"] == null ? null : json["code"],
        title: json["title"] == null ? null : json["title"],
        cost: json["cost"] == null ? null : json["cost"],
        taxClassId: json["tax_class_id"] == null ? null : json["tax_class_id"],
        text: json["text"] == null ? null : json["text"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "title": title == null ? null : title,
        "cost": cost == null ? null : cost,
        "tax_class_id": taxClassId == null ? null : taxClassId,
        "text": text == null ? null : text,
      };
}
