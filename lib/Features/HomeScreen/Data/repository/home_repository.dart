import 'dart:convert';
import 'package:ecommerce/Features/HomeScreen/Data/models/product_model.dart';
import 'package:ecommerce/data/connection.dart';
import 'package:ecommerce/data/data_provider.dart';

class HomeRepository {
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await DataProvider.getRequest(endpoint: "$conn/product");
      if (response.statusCode == 200) {
        final result = json.decode(response.body)['data'] as List;
        final List<ProductModel> productModel =
            result.map((e) => ProductModel.fromJson(e)).toList();
        return productModel;
      } else {
        throw "Error fetching products";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> addToWishList(Map<String, dynamic> body) async {
    try {
      final response = await DataProvider.postRequest(
          endpoint: "$conn/wishlist", body: body);
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        return result;
      } else {
        throw "Error fetching products";
      }
    } catch (e) {
      rethrow;
    }
  }
}
