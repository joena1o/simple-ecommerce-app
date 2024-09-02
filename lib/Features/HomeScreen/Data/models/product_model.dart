// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  List<dynamic> images;
  String id;
  String title;
  String description;
  int price;
  List<dynamic> varieties;
  String userId;
  String category;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  ProductModel({
    required this.images,
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.varieties,
    required this.userId,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    images: List<dynamic>.from(json["images"].map((x) => x)),
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    varieties: List<dynamic>.from(json["varieties"].map((x) => x)),
    userId: json["userId"],
    category: json["category"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "images": List<dynamic>.from(images.map((x) => x)),
    "_id": id,
    "title": title,
    "description": description,
    "price": price,
    "varieties": List<dynamic>.from(varieties.map((x) => x)),
    "userId": userId,
    "category": category,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
