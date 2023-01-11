// To parse this JSON data, do
//
//     final ProductDetailsModel = ProductDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel ProductDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String ProductDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  ProductDetailsModel({
    // this.breadcrumbs,
    // this.headingTitle,
    // this.textMinimum,
    // this.textLogin,
    // this.tabReview,
    // this.productId,
    // this.manufacturers,
    // this.model,
    this.productName,
    this.productNameTamil,
    this.productNameEnglish,
    // this.benefits,
    // this.points,
    this.description,
    this.quantity,
    this.iswishlist,
    this.stock,
    // this.popup,
    this.thumb,
    this.images,
    this.price,
    this.special,
    this.tax,
    this.percent,
    this.percentOff,
    this.options,
    // this.minimum,
    // this.reviewStatus,
    // this.reviewGuest,
    // this.customerName,
    // this.reviews,
    // this.rating,
    this.captcha,
    this.share,
    this.attributeGroups,
    this.products,
    // this.tags,
    // this.recurrings,
    // this.joptions,
    this.logged
  });

  // List<Breadcrumb>? breadcrumbs;
  // String? headingTitle;
  // String? textMinimum;
  // String? textLogin;
  // String? tabReview;
  int? productId;
  // String? manufacturers;
  // String? model;
  String? productName;
  String? productNameTamil;
  String? productNameEnglish;
  // String? benefits;
  // String? points;
  String? description;
  String? quantity;
  bool? iswishlist;
  String? stock;
  // String? popup;
  String? thumb;
  List<CarousalImage>? images;
  String? price;
  String? special;
  String? tax;
  String? percent;
  String? percentOff;
  List<Option>? options;
  // String? minimum;
  // String? reviewStatus;
  // bool? reviewGuest;
  // String? customerName;
  // String? reviews;
  // int? rating;
  String? captcha;
  String? share;
  List<dynamic>? attributeGroups;
  List<Product>? products;
  // List<dynamic>? tags;
  // List<dynamic>? recurrings;
  // List<Option>? joptions;
  dynamic logged;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        // breadcrumbs: json["breadcrumbs"] == null
        //     ? null
        //     : List<Breadcrumb>.from(
        //         json["breadcrumbs"].map((x) => Breadcrumb.fromJson(x))),
        // headingTitle:
        //     json["heading_title"] == null ? null : json["heading_title"],
        // textMinimum: json["text_minimum"] == null ? null : json["text_minimum"],
        // textLogin: json["text_login"] == null ? null : json["text_login"],
        // tabReview: json["tab_review"] == null ? null : json["tab_review"],
        // productId: json["product_id"] == null ? null : json["product_id"],
        productName: json["product_name"] == null ? null : json["product_name"],
        productNameTamil: json["product_name_tamil"] == null
            ? null
            : json["product_name_tamil"],
        productNameEnglish: json["product_name_english"] == null
            ? null
            : json["product_name_english"],
        // benefits: json["benefits"] == null ? null : json["benefits"],
        // manufacturers:
        //     json["manufacturers"] == null ? null : json["manufacturers"],
        // model: json["model"] == null ? null : json["model"],
        // points: json["points"] == null ? null : json["points"],
        description: json["description"] == null ? null : json["description"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        iswishlist: json["iswishlist"] == null ? null : json["iswishlist"],
        stock: json["stock"] == null ? null : json["stock"],
        // popup: json["popup"] == null ? null : json["popup"],
        thumb: json["thumb"] == null ? null : json["thumb"],
        images: json["images"] == null
            ? null
            : List<CarousalImage>.from(
                json["images"].map((x) => CarousalImage.fromJson(x))),
        price: json["price"] == null ? null : json["price"],
        special: json["special"] == null ? null : json["special"].toString(),
        tax: json["tax"] == null ? null : json["tax"],
        percent: json["percent"] == null ? null : json["percent"],
        percentOff: json["percent_off"] == null ? null : json["percent_off"],
        options: json["options"] == null
            ? null
            : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        // minimum: json["minimum"] == null ? null : json["minimum"],
        // reviewStatus:
        //     json["review_status"] == null ? null : json["review_status"],
        // reviewGuest: json["review_guest"] == null ? null : json["review_guest"],
        // customerName:
        //     json["customer_name"] == null ? null : json["customer_name"],
        // reviews: json["reviews"] == null ? null : json["reviews"],
        // rating: json["rating"] == null ? null : json["rating"],
        captcha: json["captcha"] == null ? null : json["captcha"],
        share: json["share"] == null ? null : json["share"],
        attributeGroups: json["attribute_groups"] == null
            ? null
            : List<dynamic>.from(json["attribute_groups"].map((x) => x)),
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
        // tags: json["tags"] == null
        //     ? null
        //     : List<dynamic>.from(json["tags"].map((x) => x)),
        // recurrings: json["recurrings"] == null
        //     ? null
        //     : List<dynamic>.from(json["recurrings"].map((x) => x)),
        // joptions: json["joptions"] == null
        //     ? null
        //     : List<Option>.from(
        //         json["joptions"].map((x) => Option.fromJson(x))),
        logged: json["logged"],
      );

  Map<String, dynamic> toJson() => {
        // "breadcrumbs": breadcrumbs == null
        //     ? null
        //     : List<dynamic>.from(breadcrumbs!.map((x) => x.toJson())),
        // "heading_title": headingTitle == null ? null : headingTitle,
        // "text_minimum": textMinimum == null ? null : textMinimum,
        // "text_login": textLogin == null ? null : textLogin,
        // "tab_review": tabReview == null ? null : tabReview,
        "product_id": productId == null ? null : productId,
        "product_name": productName == null ? null : productName,
        "product_name_english":
            productNameEnglish == null ? null : productNameEnglish,
        "product_name_tamil":
            productNameTamil == null ? null : productNameTamil,
        // "benefits": benefits == null ? null : benefits,
        // "manufacturers": manufacturers == null ? null : manufacturers,
        // "model": model == null ? null : model,
        // "points": points == null ? null : points,
        "description": description == null ? null : description,
        "quantity": quantity == null ? null : quantity,
        "iswishlist": iswishlist == null ? null : iswishlist,
        "stock": stock == null ? null : stock,
        // "popup": popup == null ? null : popup,
        "thumb": thumb == null ? null : thumb,
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "price": price == null ? null : price,
        "special": special == null ? null : special,
        "tax": tax == null ? null : tax,
        "percent": percent == null ? null : percent,
        "percent_off": percentOff == null ? null : percentOff,
        "options": options == null
            ? null
            : List<dynamic>.from(options!.map((x) => x.toJson())),
        // "minimum": minimum == null ? null : minimum,
        // "review_status": reviewStatus == null ? null : reviewStatus,
        // "review_guest": reviewGuest == null ? null : reviewGuest,
        // "customer_name": customerName == null ? null : customerName,
        // "reviews": reviews == null ? null : reviews,
        // "rating": rating == null ? null : rating,
        "captcha": captcha == null ? null : captcha,
        "share": share == null ? null : share,
        "attribute_groups": attributeGroups == null
            ? null
            : List<dynamic>.from(attributeGroups!.map((x) => x)),
        "products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        // "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
        // "recurrings": recurrings == null
        //     ? null
        //     : List<dynamic>.from(recurrings!.map((x) => x)),
        // "joptions": joptions == null
        //     ? null
        //     : List<dynamic>.from(joptions!.map((x) => x.toJson())),
    "logged": logged,
      };
}

class Breadcrumb {
  Breadcrumb({
    this.text,
    this.href,
  });

  String? text;
  String? href;

  factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
        text: json["text"] == null ? null : json["text"],
        href: json["href"] == null ? null : json["href"],
      );

  Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
        "href": href == null ? null : href,
      };
}

class CarousalImage {
  CarousalImage({
    this.popup,
    this.thumb,
  });

  String? popup;
  String? thumb;

  factory CarousalImage.fromJson(Map<String, dynamic> json) => CarousalImage(
        popup: json["popup"] == null ? null : json["popup"],
        thumb: json["thumb"] == null ? null : json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "popup": popup == null ? null : popup,
        "thumb": thumb == null ? null : thumb,
      };
}

class Option {
  Option({
    this.productOptionId,
    this.productOptionValue,
    this.optionId,
    this.name,
    this.type,
    this.value,
    this.required,
  });

  String? productOptionId;
  List<ProductOptionValue>? productOptionValue;
  String? optionId;
  String? name;
  String? type;
  String? value;
  String? required;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        productOptionId: json["product_option_id"] == null
            ? null
            : json["product_option_id"],
        productOptionValue: json["product_option_value"] == null
            ? null
            : List<ProductOptionValue>.from(json["product_option_value"]
                .map((x) => ProductOptionValue.fromJson(x))),
        optionId: json["option_id"] == null ? null : json["option_id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        value: json["value"] == null ? null : json["value"],
        required: json["required"] == null ? null : json["required"],
      );

  Map<String, dynamic> toJson() => {
        "product_option_id": productOptionId == null ? null : productOptionId,
        "product_option_value": productOptionValue == null
            ? null
            : List<dynamic>.from(productOptionValue!.map((x) => x.toJson())),
        "option_id": optionId == null ? null : optionId,
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "value": value == null ? null : value,
        "required": required == null ? null : required,
      };
}

class ProductOptionValue {
  ProductOptionValue({
    this.productOptionValueId,
    this.optionValueId,
    this.name,
    this.image,
    this.price,
    this.offer,
    this.priceDefault,
    this.percentOff,
    this.pricePrefix,
  });

  String? productOptionValueId;
  String? optionValueId;
  String? name;
  dynamic image;
  String? price;
  String? offer;
  String? priceDefault;
  String? percentOff;
  String? pricePrefix;

  factory ProductOptionValue.fromJson(Map<String, dynamic> json) =>
      ProductOptionValue(
        productOptionValueId: json["product_option_value_id"] == null
            ? null
            : json["product_option_value_id"],
        optionValueId:
            json["option_value_id"] == null ? null : json["option_value_id"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"],
        price: json["price"] == null ? null : json["price"],
        offer: json["offer"] == null ? null : json["offer"],
        priceDefault:
            json["price_default"] == null ? null : json["price_default"],
        percentOff: json["percent_off"] == null ? null : json["percent_off"],
        pricePrefix: json["price_prefix"] == null ? null : json["price_prefix"],
      );

  Map<String, dynamic> toJson() => {
        "product_option_value_id":
            productOptionValueId == null ? null : productOptionValueId,
        "option_value_id": optionValueId == null ? null : optionValueId,
        "name": name == null ? null : name,
        "image": image,
        "price": price == null ? null : price,
        "offer": offer == null ? null : offer,
        "price_default": priceDefault == null ? null : priceDefault,
        "percent_off": percentOff == null ? null : percentOff,
        "price_prefix": pricePrefix == null ? null : pricePrefix,
      };
}

class Product {
  Product({
    this.productId,
    this.thumb,
    this.name,
    this.pnameTamil,
    this.manufacturer,
    this.description,
    this.price,
    this.special,
    this.tax,
    this.minimum,
    this.rating,
    this.percentOff,
    this.quantity,
    this.href,
  });

  String? productId;
  String? thumb;
  String? name;
  String? pnameTamil;
  dynamic manufacturer;
  String? description;
  String? price;
  String? special;
  String? tax;
  String? minimum;
  int? rating;
  String? percentOff;
  String? quantity;
  String? href;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"] == null ? null : json["product_id"],
        thumb: json["thumb"] == null ? null : json["thumb"],
        name: json["name"] == null ? null : json["name"],
        pnameTamil: json["pname_tamil"] == null ? null : json["pname_tamil"],
        manufacturer: json["manufacturer"],
        description: json["description"] == null ? null : json["description"],
        price: json["price"] == null ? null : json["price"],
        special: json["special"] == null ? null : json["special"].toString(),
        tax: json["tax"] == null ? null : json["tax"],
        minimum: json["minimum"] == null ? null : json["minimum"].toString(),
        rating: json["rating"] == null ? null : json["rating"],
        percentOff: json["percent_off"] == null ? null : json["percent_off"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        href: json["href"] == null ? null : json["href"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId == null ? null : productId,
        "thumb": thumb == null ? null : thumb,
        "name": name == null ? null : name,
        "pname_tamil": pnameTamil == null ? null : pnameTamil,
        "manufacturer": manufacturer,
        "description": description == null ? null : description,
        "price": price == null ? null : price,
        "special": special == null ? null : special,
        "tax": tax == null ? null : tax,
        "minimum": minimum == null ? null : minimum,
        "rating": rating == null ? null : rating,
        "percent_off": percentOff == null ? null : percentOff,
        "quantity": quantity == null ? null : quantity,
        "href": href == null ? null : href,
      };
}
