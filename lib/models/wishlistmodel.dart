class WishListModel {
  String? success;
  List<Products>? products;
  String? logged;

  WishListModel({this.success, this.products, this.logged});

  WishListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    logged = json['logged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['logged'] = this.logged;
    return data;
  }
}

class Products {
  String? wishlistId;
  String? customerId;
  String? apiId;
  String? productId;
  String? thumb;
  String? name;
  String? model;
  String? stock;
  String? productPrice;
  String? special;
  String? productOptionId;
  String? productOptionValueId;
  String? optionValueId;
  String? optionValue;
  String? optionName;
  bool? addToCart;
  String? image;
  String? optionQuantity;
  String? offerPrice;
  String? price;
  List<Options>? options;

  Products(
      {this.wishlistId,
      this.customerId,
      this.apiId,
      this.productId,
      this.thumb,
      this.name,
      this.model,
      this.stock,
      this.productPrice,
      this.special,
      this.productOptionId,
      this.productOptionValueId,
      this.optionValueId,
      this.optionValue,
      this.optionName,
      this.addToCart = false,
      this.image,
      this.optionQuantity,
      this.offerPrice,
      this.price,
      this.options});

  Products.fromJson(Map<String, dynamic> json) {
    wishlistId = json['wishlist_id'];
    customerId = json['customer_id'];
    apiId = json['api_id'];
    productId = json['product_id'];
    thumb = json['thumb'];
    name = json['name'];
    model = json['model'];
    stock = json['stock'];
    productPrice = json['product_price'];
    special = json['special'];
    productOptionId = json['product_option_id'];
    productOptionValueId = json['product_option_value_id'];
    optionValueId = json['option_value_id'];
    optionValue = json['option_value'];
    optionName = json['option_name'];
    image = json['image'];
    optionQuantity = json['option_quantity'];
    offerPrice = json['offer_price'];
    price = json['price'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wishlist_id'] = this.wishlistId;
    data['customer_id'] = this.customerId;
    data['api_id'] = this.apiId;
    data['product_id'] = this.productId;
    data['thumb'] = this.thumb;
    data['name'] = this.name;
    data['model'] = this.model;
    data['stock'] = this.stock;
    data['product_price'] = this.productPrice;
    data['special'] = this.special;
    data['product_option_id'] = this.productOptionId;
    data['product_option_value_id'] = this.productOptionValueId;
    data['option_value_id'] = this.optionValueId;
    data['option_value'] = this.optionValue;
    data['option_name'] = this.optionName;
    data['image'] = this.image;
    data['option_quantity'] = this.optionQuantity;
    data['offer_price'] = this.offerPrice;
    data['price'] = this.price;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  String? productOptionId;
  List<ProductOptionValue>? productOptionValue;
  String? optionId;
  String? name;
  String? type;
  String? value;
  String? required;

  Options(
      {this.productOptionId,
      this.productOptionValue,
      this.optionId,
      this.name,
      this.type,
      this.value,
      this.required});

  Options.fromJson(Map<String, dynamic> json) {
    productOptionId = json['product_option_id'];
    if (json['product_option_value'] != null) {
      productOptionValue = <ProductOptionValue>[];
      json['product_option_value'].forEach((v) {
        productOptionValue!.add(new ProductOptionValue.fromJson(v));
      });
    }
    optionId = json['option_id'];
    name = json['name'];
    type = json['type'];
    value = json['value'];
    required = json['required'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_option_id'] = this.productOptionId;
    if (this.productOptionValue != null) {
      data['product_option_value'] =
          this.productOptionValue!.map((v) => v.toJson()).toList();
    }
    data['option_id'] = this.optionId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['value'] = this.value;
    data['required'] = this.required;
    return data;
  }
}

class ProductOptionValue {
  String? productOptionValueId;
  String? optionValueId;
  String? name;
  String? image;
  String? quantity;
  String? offer;
  String? priceDefault;
  String? subtract;
  String? price;
  String? pricePrefix;
  String? weight;
  String? weightPrefix;

  ProductOptionValue(
      {this.productOptionValueId,
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
      this.weightPrefix});

  ProductOptionValue.fromJson(Map<String, dynamic> json) {
    productOptionValueId = json['product_option_value_id'];
    optionValueId = json['option_value_id'];
    name = json['name'];
    image = json['image'];
    quantity = json['quantity'];
    offer = json['offer'];
    priceDefault = json['price_default'];
    subtract = json['subtract'];
    price = json['price'];
    pricePrefix = json['price_prefix'];
    weight = json['weight'];
    weightPrefix = json['weight_prefix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_option_value_id'] = this.productOptionValueId;
    data['option_value_id'] = this.optionValueId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['quantity'] = this.quantity;
    data['offer'] = this.offer;
    data['price_default'] = this.priceDefault;
    data['subtract'] = this.subtract;
    data['price'] = this.price;
    data['price_prefix'] = this.pricePrefix;
    data['weight'] = this.weight;
    data['weight_prefix'] = this.weightPrefix;
    return data;
  }
}
