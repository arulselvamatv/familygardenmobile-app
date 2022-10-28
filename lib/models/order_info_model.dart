class OrderInfoModel {
  List<Breadcrumbs>? breadcrumbs;
  String? errorWarning;
  String? success;
  String? invoiceNo;
  int? orderId;
  String? dateAdded;
  String? paymentAddress;
  String? paymentMethod;
  String? shippingAddress;
  String? shippingMethod;
  List<Products>? products;
  List<Totals>? totals;
  String? comment;
  List<Histories>? histories;
  String? logged;

  OrderInfoModel(
      {this.breadcrumbs,
      this.errorWarning,
      this.success,
      this.invoiceNo,
      this.orderId,
      this.dateAdded,
      this.paymentAddress,
      this.paymentMethod,
      this.shippingAddress,
      this.shippingMethod,
      this.products,
      this.totals,
      this.comment,
      this.histories,
      this.logged});

  OrderInfoModel.fromJson(Map<String, dynamic> json) {
    if (json['breadcrumbs'] != null) {
      breadcrumbs = <Breadcrumbs>[];
      json['breadcrumbs'].forEach((v) {
        breadcrumbs!.add(new Breadcrumbs.fromJson(v));
      });
    }
    errorWarning = json['error_warning'];
    success = json['success'];
    invoiceNo = json['invoice_no'];
    orderId = json['order_id'];
    dateAdded = json['date_added'] ?? "";
    paymentAddress = json['payment_address'] ?? "";
    paymentMethod = json['payment_method'];
    shippingAddress = json['shipping_address'];
    shippingMethod = json['shipping_method'];
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
    comment = json['comment'];
    if (json['histories'] != null) {
      histories = <Histories>[];
      json['histories'].forEach((v) {
        histories!.add(new Histories.fromJson(v));
      });
    }
    logged = json['logged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.breadcrumbs != null) {
      data['breadcrumbs'] = this.breadcrumbs!.map((v) => v.toJson()).toList();
    }
    data['error_warning'] = this.errorWarning;
    data['success'] = this.success;
    data['invoice_no'] = this.invoiceNo;
    data['order_id'] = this.orderId;
    data['date_added'] = this.dateAdded;
    data['payment_address'] = this.paymentAddress;
    data['payment_method'] = this.paymentMethod;
    data['shipping_address'] = this.shippingAddress;
    data['shipping_method'] = this.shippingMethod;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.totals != null) {
      data['totals'] = this.totals!.map((v) => v.toJson()).toList();
    }
    data['comment'] = this.comment;
    if (this.histories != null) {
      data['histories'] = this.histories!.map((v) => v.toJson()).toList();
    }
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['href'] = this.href;
    return data;
  }
}

class Products {
  String? name;
  String? model;
  List<Option>? option;
  String? quantity;
  String? price;
  String? total;
  String? reorder;
  String? returnUrl;

  Products(
      {this.name,
      this.model,
      this.option,
      this.quantity,
      this.price,
      this.total,
      this.reorder,
      this.returnUrl});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    model = json['model'];
    if (json['option'] != null) {
      option = <Option>[];
      json['option'].forEach((v) {
        option!.add(new Option.fromJson(v));
      });
    }
    quantity = json['quantity'];
    price = json['price'];
    total = json['total'];
    reorder = json['reorder'];
    returnUrl = json['return'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['model'] = this.model;
    if (this.option != null) {
      data['option'] = this.option!.map((v) => v.toJson()).toList();
    }
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['total'] = this.total;
    data['reorder'] = this.reorder;
    data['return'] = this.returnUrl;
    return data;
  }
}

class Option {
  String? name;
  String? value;

  Option({this.name, this.value});

  Option.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
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

class Histories {
  String? dateAdded;
  String? status;
  String? comment;

  Histories({this.dateAdded, this.status, this.comment});

  Histories.fromJson(Map<String, dynamic> json) {
    dateAdded = json['date_added'];
    status = json['status'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_added'] = this.dateAdded;
    data['status'] = this.status;
    data['comment'] = this.comment;
    return data;
  }
}
