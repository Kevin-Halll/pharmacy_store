// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Product productsFromJson(String str) => Product.fromJson(json.decode(str));

String productsToJson(Product? data) => json.encode(data!.toJson());

// Not a good way to define an entity. Do not pluralize since as the class represents an abstract form of the entity.
class Product {
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.categoryId,
  });
  String id = "";
  String name = "";
  String description = "";
  num price = 0.0;
  int rating = 0;
  String categoryId = "";


  factory Product.fromJson(Map<String, dynamic> json){
    return Product(

      id: json["_id"],
      name: json["name"],
      description: json["description"],
      price: json["price"].toDouble(),
      rating: json["rating"],
      categoryId: json["categoryId"] ?? "CatID",

    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "price": price,
    "rating": rating,
    "categoryId": categoryId,
  };
}

