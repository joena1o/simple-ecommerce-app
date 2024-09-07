import 'dart:convert';

FavoriteProductModel favoriteProductModelFromJson(String str) =>
    FavoriteProductModel.fromJson(json.decode(str));

String favoriteProductModelToJson(FavoriteProductModel data) =>
    json.encode(data.toJson());

class FavoriteProductModel {
  String id;
  String userId;
  ItemId itemId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  FavoriteProductModel({
    required this.id,
    required this.userId,
    required this.itemId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory FavoriteProductModel.fromJson(Map<String, dynamic> json) =>
      FavoriteProductModel(
        id: json["_id"],
        userId: json["userId"],
        itemId: ItemId.fromJson(json["itemId"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "itemId": itemId.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class ItemId {
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

  ItemId({
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

  factory ItemId.fromJson(Map<String, dynamic> json) => ItemId(
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
