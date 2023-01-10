// To parse this JSON data, do
//
//     final productCategory = productCategoryFromJson(jsonString);

import 'dart:convert';

ProductCategory? productCategoryFromJson(String str) => ProductCategory.fromJson(json.decode(str));

String productCategoryToJson(ProductCategory? data) => json.encode(data!.toJson());

class ProductCategory {
  ProductCategory({
    required this.id,
    required this.name,
  });

  String id = "";
  String name = "";

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}
