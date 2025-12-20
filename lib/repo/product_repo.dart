import 'dart:convert';
import 'package:api_call/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  Future<List<ProductModel>> getProductData() async {
    final url = Uri.https('fakestoreapi.com', '/products');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      // لازم نتأكد إنه List
      final List<dynamic> list = decoded as List<dynamic>;

      return list
          .whereType<
            Map<String, dynamic>
          >() // يشيل أي null أو نوع غلط
          .map(ProductModel.fromMap)
          .toList();
    } else {
      throw Exception(
        'Failed to load products (status: ${response.statusCode})',
      );
    }
  }
}
