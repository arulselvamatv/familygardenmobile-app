class WishListModel {
  String? success;
  int? status;
  String? total;
  String? logged;
  String? sessionName;
  List<WishlistProducts>? products;

  WishListModel(
      {this.success,
      this.status,
      this.total,
      this.logged,
      this.sessionName,
      this.products});

  WishListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    total = json['total'];
    logged = json['logged'];
    sessionName = json['session_name'];
    if (json['products'] != null) {
      products = <WishlistProducts>[];
      json['products'].forEach((v) {
        products!.add(WishlistProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['total'] = this.total;
    data['logged'] = this.logged;
    data['session_name'] = this.sessionName;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WishlistProducts {
  String? productId;
  String? thumb;
  String? name;
  String? model;
  String? stock;
  String? price;
  String? special;

  WishlistProducts(
      {this.productId,
      this.thumb,
      this.name,
      this.model,
      this.stock,
      this.price,
      this.special});

  WishlistProducts.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    thumb = json['thumb'];
    name = json['name'];
    model = json['model'];
    stock = json['stock'];
    price = json['price'];
    special = json['special'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['thumb'] = this.thumb;
    data['name'] = this.name;
    data['model'] = this.model;
    data['stock'] = this.stock;
    data['price'] = this.price;
    data['special'] = this.special;
    return data;
  }
}
