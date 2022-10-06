// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) =>
    CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) =>
    json.encode(data.toJson());

class CategoriesModel {
  CategoriesModel({
    required this.categories,
  });

  final List<Category> categories;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.name,
    this.image,
    this.children,
    this.column,
    this.categoryId,
  });

  final String? name;
  final dynamic image;
  final List<dynamic>? children;
  final dynamic column;
  final String? categoryId;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        image: json["image"],
        children: List<dynamic>.from(json["children"].map((x) => x)),
        column: json["column"],
        categoryId: json["category-id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "children": List<dynamic>.from(children!.map((x) => x)),
        "column": column,
        "category-id": categoryId,
      };
}
