class HomeFeatureModel {
  String? code;
  List<BestSellers>? bestSellers;
  List<Fruits>? fruits;
  List<Vegetables>? vegetables;

  HomeFeatureModel({this.code, this.bestSellers, this.fruits, this.vegetables});

  HomeFeatureModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['Best Sellers'] != null) {
      bestSellers = <BestSellers>[];
      json['Best Sellers'].forEach((v) {
        bestSellers!.add(BestSellers.fromJson(v));
      });
    }
    if (json['Fruits'] != null) {
      fruits = <Fruits>[];
      json['Fruits'].forEach((v) {
        fruits!.add(Fruits.fromJson(v));
      });
    }
    if (json['Vegetables'] != null) {
      vegetables = <Vegetables>[];
      json['Vegetables'].forEach((v) {
        vegetables!.add(Vegetables.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = this.code;
    if (this.bestSellers != null) {
      data['Best Sellers'] = this.bestSellers!.map((v) => v.toJson()).toList();
    }
    if (this.fruits != null) {
      data['Fruits'] = this.fruits!.map((v) => v.toJson()).toList();
    }
    if (this.vegetables != null) {
      data['Vegetables'] = this.vegetables!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BestSellers {
  String? productId;
  String? model;
  String? quantity;
  String? image;
  String? price;
  String? offer;

  BestSellers(
      {this.productId,
      this.model,
      this.quantity,
      this.image,
      this.price,
      this.offer});

  BestSellers.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    model = json['model'];
    quantity = json['quantity'];
    image = json['image'];
    price = json['price'];
    offer = json['offer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['model'] = this.model;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    data['price'] = this.price;
    data['offer'] = this.offer;
    return data;
  }
}

class Fruits {
  String? productId;
  String? model;
  String? quantity;
  String? image;
  String? price;
  String? offer;

  Fruits(
      {this.productId,
      this.model,
      this.quantity,
      this.image,
      this.price,
      this.offer});

  Fruits.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    model = json['model'];
    quantity = json['quantity'];
    image = json['image'];
    price = json['price'];
    offer = json['offer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['model'] = this.model;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    data['price'] = this.price;
    data['offer'] = this.offer;
    return data;
  }
}

class Vegetables {
  String? productId;
  String? model;
  String? quantity;
  String? image;
  String? price;
  String? offer;

  Vegetables(
      {this.productId,
      this.model,
      this.quantity,
      this.image,
      this.price,
      this.offer});

  Vegetables.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    model = json['model'];
    quantity = json['quantity'];
    image = json['image'];
    price = json['price'];
    offer = json['offer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['model'] = this.model;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    data['price'] = this.price;
    data['offer'] = this.offer;
    return data;
  }
}
