// To parse this JSON data, do
//
//     final orderInfoModel = orderInfoModelFromJson(jsonString);

import 'dart:convert';

OrderInfoModel orderInfoModelFromJson(String str) =>
    OrderInfoModel.fromJson(json.decode(str));

String orderInfoModelToJson(OrderInfoModel data) => json.encode(data.toJson());

class OrderInfoModel {
  OrderInfoModel({
    this.errorWarning,
    this.success,
    this.invoiceNo,
    this.orderId,
    this.dateAdded,
    this.paymentAddress,
    this.paymentMethod,
    this.shippingAddress,
    this.shippingMethod,
    this.products,
    this.totals,
    this.comment,
    this.histories,
    this.logged,
  });

  final String? errorWarning;
  final String? success;
  final String? invoiceNo;
  final int? orderId;
  final String? dateAdded;
  final String? paymentAddress;
  final String? paymentMethod;
  final String? shippingAddress;
  final String? shippingMethod;
  final List<Product>? products;
  final List<Total>? totals;
  final String? comment;
  final List<History>? histories;
  final String? logged;

  factory OrderInfoModel.fromJson(Map<String, dynamic> json) => OrderInfoModel(
        errorWarning: json["error_warning"],
        success: json["success"],
        invoiceNo: json["invoice_no"],
        orderId: json["order_id"],
        dateAdded: json["date_added"],
        paymentAddress: json["payment_address"],
        paymentMethod: json["payment_method"],
        shippingAddress: json["shipping_address"],
        shippingMethod: json["shipping_method"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        totals: List<Total>.from(json["totals"].map((x) => Total.fromJson(x))),
        comment: json["comment"],
        histories: List<History>.from(
            json["histories"].map((x) => History.fromJson(x))),
        logged: json["logged"],
      );

  Map<String, dynamic> toJson() => {
        "error_warning": errorWarning,
        "success": success,
        "invoice_no": invoiceNo,
        "order_id": orderId,
        "date_added": dateAdded,
        "payment_address": paymentAddress,
        "payment_method": paymentMethod,
        "shipping_address": shippingAddress,
        "shipping_method": shippingMethod,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "totals": List<dynamic>.from(totals!.map((x) => x.toJson())),
        "comment": comment,
        "histories": List<dynamic>.from(histories!.map((x) => x.toJson())),
        "logged": logged,
      };
}

class History {
  History({
    this.dateAdded,
    this.status,
    this.comment,
  });

  final String? dateAdded;
  final String? status;
  final String? comment;

  factory History.fromJson(Map<String, dynamic> json) => History(
        dateAdded: json["date_added"],
        status: json["status"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "date_added": dateAdded,
        "status": status,
        "comment": comment,
      };
}

class Product {
  Product({
    this.name,
    this.model,
    this.option,
    this.quantity,
    this.price,
    this.total,
    this.reorder,
    this.productReturn,
  });

  final String? name;
  final String? model;
  final List<Option>? option;
  final String? quantity;
  final String? price;
  final String? total;
  final String? reorder;
  final String? productReturn;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        model: json["model"],
        option:
            List<Option>.from(json["option"].map((x) => Option.fromJson(x))),
        quantity: json["quantity"],
        price: json["price"],
        total: json["total"],
        reorder: json["reorder"],
        productReturn: json["return"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "model": model,
        "option": List<dynamic>.from(option!.map((x) => x.toJson())),
        "quantity": quantity,
        "price": price,
        "total": total,
        "reorder": reorder,
        "return": productReturn,
      };
}

class Option {
  Option({
    this.name,
    this.value,
  });

  final String? name;
  final String? value;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
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
        title: json["title"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "text": text,
      };
}
