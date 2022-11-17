// To parse this JSON data, do
//
//     final orderInfoModel = orderInfoModelFromJson(jsonString);

import 'dart:convert';

OrderInfoModel orderInfoModelFromJson(String str) =>
    OrderInfoModel.fromJson(json.decode(str));

String orderInfoModelToJson(OrderInfoModel data) => json.encode(data.toJson());

class OrderInfoModel {
  OrderInfoModel({
    this.breadcrumbs,
    this.errorWarning,
    this.success,
    this.invoiceNo,
    this.orderId,
    this.orderStatus,
    this.dateAdded,
    this.paymentAddress,
    this.paymentMethod,
    this.shippingAddress,
    this.shippingMethod,
    this.products,
    this.subTotals,
    this.shipping,
    this.coupon,
    this.totals,
    this.comment,
    this.histories,
    this.logged,
  });

  final List<Breadcrumb>? breadcrumbs;
  final String? errorWarning;
  final String? success;
  final String? invoiceNo;
  final int? orderId;
  final String? orderStatus;
  final String? dateAdded;
  final String? paymentAddress;
  final String? paymentMethod;
  final String? shippingAddress;
  final String? shippingMethod;
  final List<Product>? products;
  final Coupon? subTotals;
  final Coupon? shipping;
  final Coupon? coupon;
  final Coupon? totals;
  final String? comment;
  final List<History>? histories;
  final String? logged;

  factory OrderInfoModel.fromJson(Map<String, dynamic> json) => OrderInfoModel(
        breadcrumbs: json["breadcrumbs"] == null
            ? null
            : List<Breadcrumb>.from(
                json["breadcrumbs"].map((x) => Breadcrumb.fromJson(x))),
        errorWarning:
            json["error_warning"] == null ? null : json["error_warning"],
        success: json["success"] == null ? null : json["success"],
        invoiceNo: json["invoice_no"] == null ? null : json["invoice_no"],
        orderId: json["order_id"] == null ? null : json["order_id"],
        orderStatus: json["order_status"] == null ? null : json["order_status"],
        dateAdded: json["date_added"] == null ? null : json["date_added"],
        paymentAddress:
            json["payment_address"] == null ? null : json["payment_address"],
        paymentMethod:
            json["payment_method"] == null ? null : json["payment_method"],
        shippingAddress:
            json["shipping_address"] == null ? null : json["shipping_address"],
        shippingMethod:
            json["shipping_method"] == null ? null : json["shipping_method"],
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
        subTotals: json["sub_totals"] == null
            ? null
            : Coupon.fromJson(json["sub_totals"]),
        shipping:
            json["shipping"] == null ? null : Coupon.fromJson(json["shipping"]),
        coupon: (json["coupon"] is Map<String, dynamic>) ? Coupon.fromJson(json["coupon"]) : Coupon(title: "", value: "0.00"),
        totals: json["totals"] == null ? null : Coupon.fromJson(json["totals"]),
        comment: json["comment"] == null ? null : json["comment"],
        histories: json["histories"] == null
            ? null
            : List<History>.from(
                json["histories"].map((x) => History.fromJson(x))),
        logged: json["logged"] == null ? null : json["logged"],
      );

  Map<String, dynamic> toJson() => {
        "breadcrumbs": breadcrumbs == null
            ? null
            : List<dynamic>.from(breadcrumbs!.map((x) => x.toJson())),
        "error_warning": errorWarning == null ? null : errorWarning,
        "success": success == null ? null : success,
        "invoice_no": invoiceNo == null ? null : invoiceNo,
        "order_id": orderId == null ? null : orderId,
        "order_status": orderStatus == null ? null : orderStatus,
        "date_added": dateAdded == null ? null : dateAdded,
        "payment_address": paymentAddress == null ? null : paymentAddress,
        "payment_method": paymentMethod == null ? null : paymentMethod,
        "shipping_address": shippingAddress == null ? null : shippingAddress,
        "shipping_method": shippingMethod == null ? null : shippingMethod,
        "products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "sub_totals": subTotals == null ? null : subTotals!.toJson(),
        "shipping": shipping == null ? null : shipping!.toJson(),
        "coupon": coupon == null ? null : coupon?.toJson(),
        "totals": totals == null ? null : totals?.toJson(),
        "comment": comment == null ? null : comment,
        "histories": histories == null
            ? null
            : List<dynamic>.from(histories!.map((x) => x.toJson())),
        "logged": logged == null ? null : logged,
      };
}

class Breadcrumb {
  Breadcrumb({
    this.text,
    this.href,
  });

  final String? text;
  final String? href;

  factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
        text: json["text"] == null ? null : json["text"],
        href: json["href"] == null ? null : json["href"],
      );

  Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
        "href": href == null ? null : href,
      };
}

class Coupon {
  Coupon({
    this.title,
    required this.value,
  });

  late final String? title;
  late String? value;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        title: json["title"] == null ? null : json["title"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "value": value == null ? null : value,
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
        dateAdded: json["date_added"] == null ? null : json["date_added"],
        status: json["status"] == null ? null : json["status"],
        comment: json["comment"] == null ? null : json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "date_added": dateAdded == null ? null : dateAdded,
        "status": status == null ? null : status,
        "comment": comment == null ? null : comment,
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
        name: json["name"] == null ? null : json["name"],
        model: json["model"] == null ? null : json["model"],
        option: json["option"] == null
            ? null
            : List<Option>.from(json["option"].map((x) => Option.fromJson(x))),
        quantity: json["quantity"] == null ? null : json["quantity"],
        price: json["price"] == null ? null : json["price"],
        total: json["total"] == null ? null : json["total"],
        reorder: json["reorder"] == null ? null : json["reorder"],
        productReturn: json["return"] == null ? null : json["return"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "model": model == null ? null : model,
        "option": option == null
            ? null
            : List<dynamic>.from(option!.map((x) => x.toJson())),
        "quantity": quantity == null ? null : quantity,
        "price": price == null ? null : price,
        "total": total == null ? null : total,
        "reorder": reorder == null ? null : reorder,
        "return": productReturn == null ? null : productReturn,
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
        name: json["name"] == null ? null : json["name"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "value": value == null ? null : value,
      };
}
