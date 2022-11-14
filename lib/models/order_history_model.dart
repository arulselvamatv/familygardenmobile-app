class OrderHistoryModel {
  List<Breadcrumbs>? breadcrumbs;
  List<Orders>? orders;
  dynamic logged;
  OrderHistoryModel({this.breadcrumbs, this.orders,this.logged});

  OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['breadcrumbs'] != null) {
      breadcrumbs = <Breadcrumbs>[];
      json['breadcrumbs'].forEach((v) {
        breadcrumbs!.add(new Breadcrumbs.fromJson(v));
      });
    }
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }

    if (json['logged'] != null) {
      logged = json["logged"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.breadcrumbs != null) {
      data['breadcrumbs'] = this.breadcrumbs!.map((v) => v.toJson()).toList();
    }
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    if (logged != null) {
      data['logged'] = logged;
    }
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

class Orders {
  String? orderId;
  String? name;
  String? status;
  String? dateAdded;
  int? products;
  String? total;

  Orders(
      {this.orderId,
      this.name,
      this.status,
      this.dateAdded,
      this.products,
      this.total});

  Orders.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    name = json['name'];
    status = json['status'];
    dateAdded = json['date_added'];
    products = json['products'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['name'] = this.name;
    data['status'] = this.status;
    data['date_added'] = this.dateAdded;
    data['products'] = this.products;
    data['total'] = this.total;
    return data;
  }
}
