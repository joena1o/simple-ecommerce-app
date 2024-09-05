import 'dart:convert';
import 'package:ecommerce/Features/Auth/data/models/models.dart';
import 'package:ecommerce/data/connection.dart';
import 'package:ecommerce/data/data_provider.dart';

class AuthRepository {
  Future<UserModel> signUpWithGoogle(Map<String, dynamic> body) async {
    try {
      final response = await DataProvider.postRequest(
          endpoint: "$conn/user/sign-up-google", body: body, auth: false);
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        final UserModel userModel = UserModel.fromJson(result);
        return userModel;
      } else {
        throw "Error authorizing user";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signUpManually(Map<String, dynamic> body) async {
    try {
      final response = await DataProvider.postRequest(
          endpoint: "$conn/user/sign-up", body: body, auth: false);
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        final UserModel userModel = UserModel.fromJson(result);
        return userModel;
      } else {
        throw "Error authorizing user";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signIn(Map<String, dynamic> body) async {
    try {
      final response = await DataProvider.postRequest(
          endpoint: "$conn/user/login", body: body, auth: false);
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        final UserModel userModel = UserModel.fromJson(result);
        return userModel;
      } else {
        throw "Error authorizing user";
      }
    } catch (e) {
      rethrow;
    }
  }
}
