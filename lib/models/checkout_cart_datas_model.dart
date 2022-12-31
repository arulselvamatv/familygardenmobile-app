class CheckoutCartDatasModel {
  List<Products>? products;
  Vouchers? vouchers;
  Vouchers? subTotals;
  Vouchers? shipping;
  Vouchers? coupon;
  Vouchers? totals;
  String? logged;

  CheckoutCartDatasModel(
      {this.products,
        this.vouchers,
        this.subTotals,
        this.shipping,
        this.coupon,
        this.totals,
        this.logged});

  CheckoutCartDatasModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    vouchers = (json["vouchers"] is Map<String, dynamic>) ? Vouchers.fromJson(json["vouchers"]) : Vouchers(title: "", value: "0.00");
    subTotals = json['sub_totals'] != null
        ? new Vouchers.fromJson(json['sub_totals'])
        : null;
    shipping = (json["shipping"] is Map<String, dynamic>) ? Vouchers.fromJson(json["shipping"]) : Vouchers(title: "", value: "0.00");
    coupon =
    (json["coupon"] is Map<String, dynamic>) ? Vouchers.fromJson(json["coupon"]) : Vouchers(title: "", value: "0.00");
    totals =
    json['totals'] != null ? new Vouchers.fromJson(json['totals']) : null;
    logged = json['logged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.vouchers != null) {
      data['vouchers'] = this.vouchers!.toJson();
    }
    if (this.subTotals != null) {
      data['sub_totals'] = this.subTotals!.toJson();
    }
    if (this.shipping != null) {
      data['shipping'] = this.shipping!.toJson();
    }
    if (this.coupon != null) {
      data['coupon'] = this.coupon!.toJson();
    }
    if (this.totals != null) {
      data['totals'] = this.totals!.toJson();
    }
    data['logged'] = this.logged;
    return data;
  }
}

class Products {
  String? cartId;
  String? productId;
  String? thumb;
  String? name;
  String? model;
  // List<Null>? option;
  String? recurring;
  String? quantity;
  String? subtract;
  String? price;
  String? total;
  String? href;

  Products(
      {this.cartId,
        this.productId,
        this.thumb,
        this.name,
        this.model,
        // this.option,
        this.recurring,
        this.quantity,
        this.subtract,
        this.price,
        this.total,
        this.href});

  Products.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    productId = json['product_id'];
    thumb = json['thumb'];
    name = json['name'];
    model = json['model'];
    // if (json['option'] != null) {
    //   option = <Null>[];
    //   json['option'].forEach((v) {
    //     option!.add(new Null.fromJson(v));
    //   });
    // }
    recurring = json['recurring'];
    quantity = json['quantity'];
    subtract = json['subtract'];
    price = json['price'];
    total = json['total'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['product_id'] = this.productId;
    data['thumb'] = this.thumb;
    data['name'] = this.name;
    data['model'] = this.model;
    // if (this.option != null) {
    //   data['option'] = this.option!.map((v) => v.toJson()).toList();
    // }
    data['recurring'] = this.recurring;
    data['quantity'] = this.quantity;
    data['subtract'] = this.subtract;
    data['price'] = this.price;
    data['total'] = this.total;
    data['href'] = this.href;
    return data;
  }
}

class Vouchers {
  String? title;
  String? value;

  Vouchers({this.title, this.value});

  Vouchers.fromJson(Map<String, dynamic> json) {
    title = json["title"] == null ? null : json["title"];
    value = json["value"] == null ? null : json["value"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title == null ? null : title;
    data['value'] = value == null ? null : value;
    return data;
  }
}
