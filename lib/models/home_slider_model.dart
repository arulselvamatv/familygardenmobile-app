class HomeSliderModel {
  List<Modules>? modules;

  HomeSliderModel({this.modules});

  HomeSliderModel.fromJson(Map<String, dynamic> json) {
    if (json['modules'] != null) {
      modules = <Modules>[];
      json['modules'].forEach((v) {
        modules!.add(new Modules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.modules != null) {
      data['modules'] = this.modules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Modules {
  List<Banners>? banners;
  int? module;

  Modules({this.banners, this.module});

  Modules.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
    module = json['module'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    data['module'] = this.module;
    return data;
  }
}

class Banners {
  String? title;
  String? link;
  String? productid;
  String? image;

  Banners({this.title, this.link, this.productid, this.image});

  Banners.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    productid = json['productid'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['link'] = this.link;
    data['productid'] = this.productid;
    data['image'] = this.image;
    return data;
  }
}