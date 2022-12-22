class HomeFeatureModel {
  String? code;
  List<Vegetables>? vegetables;
  List<Fruits>? fruits;
  dynamic logged;

  HomeFeatureModel({this.code, this.vegetables, this.fruits});

  HomeFeatureModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['Vegetables'] != null) {
      vegetables = <Vegetables>[];
      json['Vegetables'].forEach((v) {
        vegetables!.add(Vegetables.fromJson(v));
      });
    }
    if (json['Fruits'] != null) {
      fruits = <Fruits>[];
      json['Fruits'].forEach((v) {
        fruits!.add(Fruits.fromJson(v));
      });
    }
    logged = null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = this.code;
    if (this.vegetables != null) {
      data['Vegetables'] = this.vegetables!.map((v) => v.toJson()).toList();
    }
    if (this.fruits != null) {
      data['Fruits'] = this.fruits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vegetables {
  String? productId;
  String? model;
  String? quantity;
  String? image;
  String? price;
  String? offerPrice;
  String? productOptionId;
  String? optionId;
  String? value;
  String? name;
  String? description;
  String? moduleId;
  String? productName;
  String? productTamilName;
  List<Options>? options;

  Vegetables(
      {this.productId,
      this.model,
      this.quantity,
      this.image,
      this.price,
      this.offerPrice,
      this.productOptionId,
      this.optionId,
      this.value,
      this.name,
      this.description,
      this.moduleId,
      this.productName,
      this.productTamilName,
      this.options});

  Vegetables.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    model = json['model'];
    quantity = json['quantity'];
    image = json['image'];
    price = json['price'];
    offerPrice = json['offer_price'];
    productOptionId = json['product_option_id'];
    optionId = json['option_id'];
    value = json['value'];
    name = json['name'];
    description = json['description'];
    moduleId = json['module_id'];
    productName = json['product_name'];
    productTamilName = json['product_tamil_name'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['model'] = this.model;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    data['price'] = this.price;
    data['offer_price'] = this.offerPrice;
    data['product_option_id'] = this.productOptionId;
    data['option_id'] = this.optionId;
    data['value'] = this.value;
    data['name'] = this.name;
    data['description'] = this.description;
    data['module_id'] = this.moduleId;
    data['product_name'] = this.productName;
    data['product_tamil_name'] = this.productTamilName;
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

class Fruits {
  String? productId;
  String? model;
  String? quantity;
  String? image;
  String? price;
  String? offerPrice;
  String? productOptionId;
  String? optionId;
  String? value;
  String? name;
  String? description;
  String? moduleId;
  String? productName;
  String? productTamilName;
  List<Options>? options;

  Fruits(
      {this.productId,
      this.model,
      this.quantity,
      this.image,
      this.price,
      this.offerPrice,
      this.productOptionId,
      this.optionId,
      this.value,
      this.name,
      this.description,
      this.moduleId,
      this.productName,
      this.productTamilName,
      this.options});

  Fruits.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    model = json['model'];
    quantity = json['quantity'];
    image = json['image'];
    price = json['price'];
    offerPrice = json['offer_price'];
    productOptionId = json['product_option_id'];
    optionId = json['option_id'];
    value = json['value'];
    name = json['name'];
    description = json['description'];
    moduleId = json['module_id'];
    productName = json['product_name'];
    productTamilName = json['product_tamil_name'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['model'] = this.model;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    data['price'] = this.price;
    data['offer_price'] = this.offerPrice;
    data['product_option_id'] = this.productOptionId;
    data['option_id'] = this.optionId;
    data['value'] = this.value;
    data['name'] = this.name;
    data['description'] = this.description;
    data['module_id'] = this.moduleId;
    data['product_name'] = this.productName;
    data['product_tamil_name'] = this.productTamilName;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
