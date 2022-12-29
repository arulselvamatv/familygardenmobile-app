class CheckoutCartDatasModel {
  List<Products>? products;
  List<Totals>? totals;
  String? logged;

  CheckoutCartDatasModel(
      {this.products, this.totals, this.logged});

  CheckoutCartDatasModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    if (json['totals'] != null) {
      totals = <Totals>[];
      json['totals'].forEach((v) {
        totals!.add(new Totals.fromJson(v));
      });
    }
    logged = json['logged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.totals != null) {
      data['totals'] = this.totals!.map((v) => v.toJson()).toList();
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
    data['recurring'] = this.recurring;
    data['quantity'] = this.quantity;
    data['subtract'] = this.subtract;
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
