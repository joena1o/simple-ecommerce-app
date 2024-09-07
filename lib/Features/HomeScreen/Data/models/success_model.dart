import 'dart:convert';

SuccessMessageModel successMessageModelFromJson(String str) =>
    SuccessMessageModel.fromJson(json.decode(str));

String successMessageModelToJson(SuccessMessageModel data) =>
    json.encode(data.toJson());

class SuccessMessageModel {
  String message;

  SuccessMessageModel({
    required this.message,
  });

  factory SuccessMessageModel.fromJson(Map<String, dynamic> json) =>
      SuccessMessageModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
