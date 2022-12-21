class ProductCategoryModel {
  List<Breadcrumbs>? breadcrumbs;
  String? headingTitle;
  String? textCompare;
  String? thumb;
  String? description;
  String? compare;
  List<Null>? categories;
  List<Products>? products;
  List<Options>? options;
  List<Sorts>? sorts;
  List<Limits>? limits;
  Pagination? pagination;
  String? results;
  String? sort;
  String? order;
  int? limit;
  dynamic? logged;

  ProductCategoryModel(
      {this.breadcrumbs,
      this.headingTitle,
      this.textCompare,
      this.thumb,
      this.description,
      this.compare,
      this.categories,
      this.products,
      this.options,
      this.sorts,
      this.limits,
      this.pagination,
      this.results,
      this.sort,
      this.order,
      this.limit,
      this.logged});

  ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['breadcrumbs'] != null) {
      breadcrumbs = <Breadcrumbs>[];
      json['breadcrumbs'].forEach((v) {
        breadcrumbs!.add(Breadcrumbs.fromJson(v));
      });
    }
    headingTitle = json['heading_title'];
    textCompare = json['text_compare'];
    thumb = json['thumb'];
    description = json['description'];
    compare = json['compare'];
    if (json['categories'] != null) {
      categories = <Null>[];
      // json['categories'].forEach((v) {
      //   categories!.add(Null.fromJson(v));
      // });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
    if (json['sorts'] != null) {
      sorts = <Sorts>[];
      json['sorts'].forEach((v) {
        sorts!.add(Sorts.fromJson(v));
      });
    }
    if (json['limits'] != null) {
      limits = <Limits>[];
      json['limits'].forEach((v) {
        limits!.add(Limits.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    results = json['results'];
    sort = json['sort'];
    order = json['order'];
    limit = json['limit'];
    logged = json['logged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.breadcrumbs != null) {
      data['breadcrumbs'] = this.breadcrumbs!.map((v) => v.toJson()).toList();
    }
    data['heading_title'] = this.headingTitle;
    data['text_compare'] = this.textCompare;
    data['thumb'] = this.thumb;
    data['description'] = this.description;
    data['compare'] = this.compare;
    // if (this.categories != null) {
    //   data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    // }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    if (this.sorts != null) {
      data['sorts'] = this.sorts!.map((v) => v.toJson()).toList();
    }
    if (this.limits != null) {
      data['limits'] = this.limits!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    data['results'] = this.results;
    data['sort'] = this.sort;
    data['order'] = this.order;
    data['limit'] = this.limit;
    data['logged'] = this.logged;
    return data;
  }
}

class Breadcrumbs {
  String? text;
  String? href;

  Breadcrumbs({this.text, this.href});

  Breadcrumbs.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['text'] = this.text;
    data['href'] = this.href;
    return data;
  }
}

class Products {
  String? productId;
  List<Option>? option;
  String? thumb;
  String? name;
  String? pnameTamil;
  String? description;
  String? productOptionId;
  String? productOptionValueId;
  String? price;
  String? special;
  String? tax;
  int? counter;
  String? minimum;
  int? rating;
  String? percentOff;
  String? quantity;
  String? href;

  Products(
      {this.productId,
      this.option,
      this.counter,
      this.thumb,
      this.name,
      this.productOptionId,
      this.productOptionValueId,
      this.pnameTamil,
      this.description,
      this.price,
      this.special,
      this.tax,
      this.minimum,
      this.rating,
      this.percentOff,
      this.quantity,
      this.href});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    if (json['option'] != null) {
      option = <Option>[];
      json['option'].forEach((v) {
        option!.add(Option.fromJson(v));
      });
    }
    thumb = json['thumb'];
    name = json['name'];
    pnameTamil = json['pname_tamil'];
    description = json['description'];
    productOptionId = "";
    productOptionValueId = "";
    counter = 0;
    price = json['price'];
    special = json['special'];
    tax = json['tax'];
    minimum = json['minimum'];
    rating = json['rating'];
    percentOff = json['percent_off'];
    quantity = json['quantity'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['product_id'] = this.productId;
    if (this.option != null) {
      data['option'] = this.option!.map((v) => v.toJson()).toList();
    }
    data['thumb'] = this.thumb;
    data['name'] = this.name;
    data['pname_tamil'] = this.pnameTamil;
    data['description'] = this.description;
    data['price'] = this.price;
    data['special'] = this.special;
    data['tax'] = this.tax;
    data['minimum'] = this.minimum;
    data['rating'] = this.rating;
    data['percent_off'] = this.percentOff;
    data['quantity'] = this.quantity;
    data['href'] = this.href;
    return data;
  }
}

class Option {
  String? productOptionId;
  List<ProductOptionValue>? productOptionValue;
  String? selectedProductOptionId;
  String? optionId;
  String? name;
  String? type;
  String? value;
  String? required;

  Option(
      {this.productOptionId,
      this.productOptionValue,
      this.optionId,
      this.name,
      this.type,
      this.value,
      this.required});

  Option.fromJson(Map<String, dynamic> json) {
    productOptionId = json['product_option_id'];
    if (json['product_option_value'] != null) {
      productOptionValue = <ProductOptionValue>[];
      json['product_option_value'].forEach((v) {
        productOptionValue!.add(ProductOptionValue.fromJson(v));
      });
    }
    optionId = json['option_id'];
    name = json['name'];
    type = json['type'];
    value = json['value'];
    required = json['required'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
  String? selectedProductOptionValueId;
  String? optionValueId;
  String? name;
  Null? image;
  String? price;
  String? offer;
  String? priceDefault;
  String? percentOff;
  String? pricePrefix;

  ProductOptionValue(
      {this.productOptionValueId,
      this.selectedProductOptionValueId,
      this.optionValueId,
      this.name,
      this.image,
      this.price,
      this.offer,
      this.priceDefault,
      this.percentOff,
      this.pricePrefix});

  ProductOptionValue.fromJson(Map<String, dynamic> json) {
    productOptionValueId = json['product_option_value_id'];
    selectedProductOptionValueId = "";
    optionValueId = json['option_value_id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    offer = json['offer'];
    priceDefault = json['price_default'];
    percentOff = json['percent_off'];
    pricePrefix = json['price_prefix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['product_option_value_id'] = this.productOptionValueId;
    data['option_value_id'] = this.optionValueId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['offer'] = this.offer;
    data['price_default'] = this.priceDefault;
    data['percent_off'] = this.percentOff;
    data['price_prefix'] = this.pricePrefix;
    return data;
  }
}

class Sorts {
  String? text;
  String? value;
  String? href;

  Sorts({this.text, this.value, this.href});

  Sorts.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['text'] = this.text;
    data['value'] = this.value;
    data['href'] = this.href;
    return data;
  }
}

class Limits {
  int? text;
  int? value;
  String? href;

  Limits({this.text, this.value, this.href});

  Limits.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['text'] = this.text;
    data['value'] = this.value;
    data['href'] = this.href;
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
        productOptionValue!.add(ProductOptionValue.fromJson(v));
      });
    }
    optionId = json['option_id'];
    name = json['name'];
    type = json['type'];
    value = json['value'];
    required = json['required'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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

class Pagination {
  int? total;
  int? page;
  int? limit;
  int? numLinks;
  String? url;
  String? textFirst;
  String? textLast;
  String? textNext;
  String? textPrev;
  int? numPages;

  Pagination(
      {this.total,
      this.page,
      this.limit,
      this.numLinks,
      this.url,
      this.textFirst,
      this.textLast,
      this.textNext,
      this.textPrev,
      this.numPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
    numLinks = json['num_links'];
    url = json['url'];
    textFirst = json['text_first'];
    textLast = json['text_last'];
    textNext = json['text_next'];
    textPrev = json['text_prev'];
    numPages = json['num_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['num_links'] = this.numLinks;
    data['url'] = this.url;
    data['text_first'] = this.textFirst;
    data['text_last'] = this.textLast;
    data['text_next'] = this.textNext;
    data['text_prev'] = this.textPrev;
    data['num_pages'] = this.numPages;
    return data;
  }
}
