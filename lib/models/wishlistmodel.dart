import 'cart_list_model.dart';
import 'category_product_model.dart';

class WishListModel {
  String? success;
  int? status;
  String? total;
  Null? logged;
  String? sessionName;
  List<Products>? products;

  WishListModel({this.success, this.status, this.total, this.logged, this.sessionName,this.products});

  WishListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    total = json['total'];
    logged = json['logged'];
    sessionName = json['session_name'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
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
