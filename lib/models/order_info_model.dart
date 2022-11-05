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
    this.dateAdded,
    this.paymentAddress,
    this.paymentMethod,
    this.shippingAddress,
    this.shippingMethod,
    this.products,
    this.vouchers,
    this.totals,
    this.comment,
    this.histories,
    this.logged,
  });

  final List<Breadcrumb>? breadcrumbs;
  final String? errorWarning;
  final String? success;
  final String? invoiceNo;
  final String? orderId;
  final String? dateAdded;
  final String? paymentAddress;
  final String? paymentMethod;
  final String? shippingAddress;
  final String? shippingMethod;
  final List<Product>? products;
  final List<dynamic>? vouchers;
  final List<Total>? totals;
  final String? comment;
  final List<History>? histories;
  final String? logged;

  factory OrderInfoModel.fromJson(Map<String, dynamic> json) => OrderInfoModel(
        breadcrumbs: json["breadcrumbs"] == null
            ? null
            : List<Breadcrumb>.from(
                json["breadcrumbs"].map((x) => Breadcrumb.fromJson(x))),
        errorWarning: json["error_warning"] == null
            ? null
            : json["error_warning"].toString(),
        success: json["success"] == null ? null : json["success"].toString(),
        invoiceNo:
            json["invoice_no"] == null ? null : json["invoice_no"].toString(),
        orderId: json["order_id"] == null ? null : json["order_id"].toString(),
        dateAdded:
            json["date_added"] == null ? null : json["date_added"].toString(),
        paymentAddress: json["payment_address"] == null
            ? null
            : json["payment_address"].toString(),
        paymentMethod: json["payment_method"] == null
            ? null
            : json["payment_method"].toString(),
        shippingAddress: json["shipping_address"] == null
            ? null
            : json["shipping_address"].toString(),
        shippingMethod: json["shipping_method"] == null
            ? null
            : json["shipping_method"].toString(),
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
        comment: json["comment"] == null ? null : json["comment"].toString(),
        histories: json["histories"] == null
            ? null
            : List<History>.from(
                json["histories"].map((x) => History.fromJson(x))),
        logged: json["logged"] == null ? null : json["logged"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "breadcrumbs": breadcrumbs == null
            ? null
            : List<dynamic>.from(breadcrumbs!.map((x) => x.toJson())),
        "error_warning": errorWarning == null ? null : errorWarning,
        "success": success == null ? null : success,
        "invoice_no": invoiceNo == null ? null : invoiceNo,
        "order_id": orderId == null ? null : orderId,
        "date_added": dateAdded == null ? null : dateAdded,
        "payment_address": paymentAddress == null ? null : paymentAddress,
        "payment_method": paymentMethod == null ? null : paymentMethod,
        "shipping_address": shippingAddress == null ? null : shippingAddress,
        "shipping_method": shippingMethod == null ? null : shippingMethod,
        "products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "vouchers": vouchers == null
            ? null
            : List<dynamic>.from(vouchers!.map((x) => x)),
        "totals": totals == null
            ? null
            : List<dynamic>.from(totals!.map((x) => x.toJson())),
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
        text: json["text"] == null ? null : json["text"].toString(),
        href: json["href"] == null ? null : json["href"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
        "href": href == null ? null : href,
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
        dateAdded:
            json["date_added"] == null ? null : json["date_added"].toString(),
        status: json["status"] == null ? null : json["status"].toString(),
        comment: json["comment"] == null ? null : json["comment"].toString(),
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
        name: json["name"] == null ? null : json["name"].toString(),
        model: json["model"] == null ? null : json["model"].toString(),
        option: json["option"] == null
            ? null
            : List<Option>.from(json["option"].map((x) => Option.fromJson(x))),
        quantity: json["quantity"] == null ? null : json["quantity"].toString(),
        price: json["price"] == null ? null : json["price"].toString(),
        total: json["total"] == null ? null : json["total"].toString(),
        reorder: json["reorder"] == null ? null : json["reorder"].toString(),
        productReturn:
            json["return"] == null ? null : json["return"].toString(),
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
        name: json["name"] == null ? null : json["name"].toString(),
        value: json["value"] == null ? null : json["value"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "value": value == null ? null : value,
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
        title: json["title"] == null ? null : json["title"].toString(),
        text: json["text"] == null ? null : json["text"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "text": text == null ? null : text,
      };
}
