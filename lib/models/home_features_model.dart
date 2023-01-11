class HomeFeaturesModel {
  String? code;
  List<Categories>? categories;
  dynamic logged;

  HomeFeaturesModel({this.code, this.categories});

  HomeFeaturesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    logged = null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? module;
  List<Products>? products;

  Categories({this.module, this.products});

  Categories.fromJson(Map<String, dynamic> json) {
    module = json['module'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['module'] = this.module;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? productId;
  String? model;
  String? quantity;
  String? image;
  String? price;
  int? percentage;
  String? offerPrice;
  String? productOptionId;
  String? optionId;
  String? name;
  String? description;
  String? moduleId;
  String? productName;
  String? productTamilName;
  List<Options>? options;
  int? count;
  int? prodCartCount;

  Products({
    this.productId,
    this.model,
    this.quantity,
    this.image,
    this.price,
    this.percentage = 0,
    this.offerPrice,
    this.productOptionId,
    this.optionId,
    this.name,
    this.description,
    this.moduleId,
    this.productName,
    this.productTamilName,
    this.options,
    this.count = 0,
    this.prodCartCount = 0,
  });

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    model = json['model'];
    quantity = json['quantity'];
    image = json['image'];
    price = json['price'];
    offerPrice = json['offer_price'];
    productOptionId = json['product_option_id'];
    optionId = json['option_id'];
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
    ;
    count = json['count'] ?? 0;
    prodCartCount = json['prod_cart_count'] ?? 0;
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
    data['name'] = this.name;
    data['description'] = this.description;
    data['module_id'] = this.moduleId;
    data['product_name'] = this.productName;
    data['product_tamil_name'] = this.productTamilName;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    ;
    data['count'] = this.count;
    data['prod_cart_count'] = this.prodCartCount;
    return data;
  }
}

class Options {
  String? productOptionId;
  String? selectedDropdownValue;
  List<ProductOptionValue>? productOptionValue;
  String? optionId;
  String? name;
  String? type;
  String? value;
  String? required;

  Options(
      {this.productOptionId,
      this.selectedDropdownValue = "",
      this.productOptionValue,
      this.optionId,
      this.name,
      this.type,
      this.value,
      this.required});

  Options.fromJson(Map<String, dynamic> json) {
    productOptionId = json['product_option_id'];
    selectedDropdownValue = json['selectedDropdownValue'] ?? "";
    if (json['product_option_value'] != null) {
      productOptionValue = <ProductOptionValue>[];
      json['product_option_value'].forEach((v) {
        productOptionValue!.add(new ProductOptionValue.fromJson(v));
      });
    }
    optionId = json['option_id'];
    selectedDropdownValue = json['selectedDropdownValue'] ?? "";
    name = json['name'];
    type = json['type'];
    value = json['value'];
    required = json['required'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_option_id'] = this.productOptionId;
    data['selectedDropdownValue'] = this.selectedDropdownValue;
    if (this.productOptionValue != null) {
      data['product_option_value'] =
          this.productOptionValue!.map((v) => v.toJson()).toList();
    }
    data['option_id'] = this.optionId;
    data['selectedDropdownValue'] = this.selectedDropdownValue;
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
  Null? image;
  String? quantity;
  String? offer;
  String? priceDefault;
  String? percentageOff;
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
      this.percentageOff,
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
    percentageOff = json['percentage_off'];
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
    data['percentage_off'] = this.percentageOff;
    data['subtract'] = this.subtract;
    data['price'] = this.price;
    data['price_prefix'] = this.pricePrefix;
    data['weight'] = this.weight;
    data['weight_prefix'] = this.weightPrefix;
    return data;
  }
}
