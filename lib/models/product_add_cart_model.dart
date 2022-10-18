class ProductCartAddModel {
  List<ProductInfo>? productInfo;

  ProductCartAddModel({this.productInfo});

  ProductCartAddModel.fromJson(Map<String, dynamic> json) {
    if (json['product_info'] != null) {
      productInfo = <ProductInfo>[];
      json['product_info'].forEach((v) {
        productInfo!.add(new ProductInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productInfo != null) {
      data['product_info'] = this.productInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductInfo {
  int? productId;
  int? qty;
  int? productOptionId;
  int? prodcutOptionValueId;
  String? action;

  ProductInfo(
      {this.productId,
      this.qty,
      this.productOptionId,
      this.prodcutOptionValueId,
      this.action});

  ProductInfo.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    qty = json['qty'];
    productOptionId = json['product_option_id'];
    prodcutOptionValueId = json['prodcut_option_value_id'];
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['qty'] = this.qty;
    data['product_option_id'] = this.productOptionId;
    data['prodcut_option_value_id'] = this.prodcutOptionValueId;
    data['action'] = this.action;
    return data;
  }
}
