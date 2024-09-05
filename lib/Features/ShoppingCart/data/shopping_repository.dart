import 'dart:convert';
import 'package:ecommerce/data/connection.dart';
import 'package:ecommerce/data/data_provider.dart';

class ShoppingRepository {
  Future<dynamic> uploadCart(Map<String, dynamic> body) async {
    try {
      final response = await DataProvider.postRequest(
          endpoint: "$conn/cart", body: body, auth: false);
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
