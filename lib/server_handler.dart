import 'dart:convert';

import 'package:http/http.dart' as http;

import './models/seller.dart';
import './models/product.dart';

class ServerHandler {
  final String _baseUrl = "http://whoisrishav.com/pk/better-buys/api";

  // get the list of sellers
  Future<List<Seller>> getSellers() async {
    try {
      List<Seller> sellers = [];

      http.Response response =
          await http.get(Uri.parse('$_baseUrl/gen/sellers'));

      List sellersList = (json.decode(response.body))['sellers'];

      for (Map m in sellersList) {
        sellers.add(Seller.fromMap(m));
      }

      return sellers;
    } catch (e) {
      // ignore: avoid_print
      print('Server Handler : error : ' + e.toString());
      rethrow;
    }
  }

  /// getting list of products per seller
  Future<List<Product>> getProductsPerSeller(int sellerId) async {
    try {
      List<Product> products = [];

      http.Response response = await http
          .get(Uri.parse('$_baseUrl/gen/products?seller_id=$sellerId'));

      List productsList = (json.decode(response.body))['products'];

      for (Map m in productsList) {
        products.add(Product.fromMap(m));
      }

      return products;
    } catch (e) {
      // ignore: avoid_print
      print('Server Handler : error : ' + e.toString());
      rethrow;
    }
  }
}
