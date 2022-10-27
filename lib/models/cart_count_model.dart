class cartCountModel {
  String? textItems;
  List<Products>? products;
  List<Null>? vouchers;
  List<Totals>? totals;
  String? cart;
  String? checkout;
  Null? logged;

  cartCountModel(
      {this.textItems,
      this.products,
      this.vouchers,
      this.totals,
      this.cart,
      this.checkout,
      this.logged});

  cartCountModel.fromJson(Map<String, dynamic> json) {
    textItems = json['text_items'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    // if (json['vouchers'] != null) {
    //   vouchers = <Null>[];
    //   json['vouchers'].forEach((v) {
    //     vouchers!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['totals'] != null) {
      totals = <Totals>[];
      json['totals'].forEach((v) {
        totals!.add(new Totals.fromJson(v));
      });
    }
    cart = json['cart'];
    checkout = json['checkout'];
    logged = json['logged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text_items'] = this.textItems;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    // if (this.vouchers != null) {
    //   data['vouchers'] = this.vouchers!.map((v) => v.toJson()).toList();
    // }
    if (this.totals != null) {
      data['totals'] = this.totals!.map((v) => v.toJson()).toList();
    }
    data['cart'] = this.cart;
    data['checkout'] = this.checkout;
    data['logged'] = this.logged;
    return data;
  }
}

class Products {
  String? cartId;
  String? thumb;
  String? name;
  String? pnameTamil;
  String? model;
  List<Null>? option;
  String? recurring;
  String? quantity;
  String? price;
  String? total;
  String? href;

  Products(
      {this.cartId,
      this.thumb,
      this.name,
      this.pnameTamil,
      this.model,
      this.option,
      this.recurring,
      this.quantity,
      this.price,
      this.total,
      this.href});

  Products.fromJson(Map<String, dynamic> json) {
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
    price = json['price'];
    total = json['total'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['thumb'] = this.thumb;
    data['name'] = this.name;
    data['pname_tamil'] = this.pnameTamil;
    data['model'] = this.model;
    // if (this.option != null) {
    //   data['option'] = this.option!.map((v) => v.toJson()).toList();
    // }
    data['recurring'] = this.recurring;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['total'] = this.total;
    data['href'] = this.href;
    return data;
  }
}

class Totals {
  String? title;
  String? text;

  Totals({this.title, this.text});

  Totals.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['text'] = this.text;
    return data;
  }
}
