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
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.categoryId,
  });
  String id = "";
  String name = "";
  String description = "";
  num price = 0.0;
  int rating = 0;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  int v = 0;
  String categoryId = "";


  factory Product.fromJson(Map<String, dynamic> json){
    return Product(

      id: json["_id"],
      name: json["name"],
      description: json["description"],
      price: json["price"].toDouble(),
      rating: json["rating"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      v: json["__v"],
      categoryId: json["categoryId"] ?? "CatID",

    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "price": price,
    "rating": rating,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "categoryId": categoryId,
  };
}


// You going around the world with this. Why not have these inside the products, since they are the product's properties.
// class Datum {
//   Datum({
//     this.id,
//     this.name,
//     this.description,
//     this.price,
//     this.rating,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.categoryId,
//   });
//
//   String? id;
//   String? name;
//   String? description;
//   double? price;
//   int? rating;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;
//   String? categoryId;
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     id: json["_id"],
//     name: json["name"],
//     description: json["description"],
//     price: json["price"].toDouble(),
//     rating: json["rating"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//     categoryId: json["categoryId"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "name": name,
//     "description": description,
//     "price": price,
//     "rating": rating,
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "__v": v,
//     "categoryId": categoryId,
//   };
// }

enum CategoryId { THE_63_BB098246_FEF0_B188_F40_C69, THE_63_BB09_E946_FEF0_B188_F40_C6_F, THE_63_BB0_A2146_FEF0_B188_F40_C73, THE_63_BB09_C946_FEF0_B188_F40_C6_D, THE_63_BB09_AB46_FEF0_B188_F40_C6_B, THE_63_BB09_FA46_FEF0_B188_F40_C71, THE_63_BB3_F033_B89_DC64_EDB4_EAA7, THE_63_BB43_B5_A165873251068_ECB }

final categoryIdValues = EnumValues({
  "63bb098246fef0b188f40c69": CategoryId.THE_63_BB098246_FEF0_B188_F40_C69,
  "63bb09ab46fef0b188f40c6b": CategoryId.THE_63_BB09_AB46_FEF0_B188_F40_C6_B,
  "63bb09c946fef0b188f40c6d": CategoryId.THE_63_BB09_C946_FEF0_B188_F40_C6_D,
  "63bb09e946fef0b188f40c6f": CategoryId.THE_63_BB09_E946_FEF0_B188_F40_C6_F,
  "63bb09fa46fef0b188f40c71": CategoryId.THE_63_BB09_FA46_FEF0_B188_F40_C71,
  "63bb0a2146fef0b188f40c73": CategoryId.THE_63_BB0_A2146_FEF0_B188_F40_C73,
  "63bb3f033b89dc64edb4eaa7": CategoryId.THE_63_BB3_F033_B89_DC64_EDB4_EAA7,
  "63bb43b5a165873251068ecb": CategoryId.THE_63_BB43_B5_A165873251068_ECB
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
