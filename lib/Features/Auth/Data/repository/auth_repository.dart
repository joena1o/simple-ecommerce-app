import 'dart:convert';
import 'package:ecommerce/data/connection.dart';
import 'package:ecommerce/data/data_provider.dart';

class AuthRepository {
  Future<dynamic> signUpWithGoogle(Map<String, dynamic> body) async {
    try {
      final response = await DataProvider.postRequest(
          endpoint: "$conn/user/sign-up-google", body: body);
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        return result;
      } else {
        throw "Error authorizing user";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUpManually(Map<String, dynamic> body) async {
    try {
      final response = await DataProvider.postRequest(
          endpoint: "$conn/user/sign-up", body: body);
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        return result;
      } else {
        throw "Error authorizing user";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signIn(Map<String, dynamic> body) async {
    try {
      final response = await DataProvider.postRequest(
          endpoint: "$conn/user/login", body: body);
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        return result;
      } else {
        throw "Error authorizing user";
      }
    } catch (e) {
      rethrow;
    }
  }
}
