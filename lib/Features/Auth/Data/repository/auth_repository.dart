import 'dart:convert';
import 'package:ecommerce/data/connection.dart';
import 'package:ecommerce/data/data_provider.dart';

class AuthRepository {
  Future<dynamic> signUpWithGoogle(Map<String, dynamic> body) async {
    try {
      final response = await DataProvider.postRequest(
          endpoint: "$conn/sign-up-google", body: body);
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        print(result);
        return result;
      } else {
        throw "Error authorizing user";
      }
    } catch (e) {
      rethrow;
    }
  }
}
