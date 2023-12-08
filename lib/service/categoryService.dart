import 'dart:convert';
import 'package:http/http.dart' as http;

class Categories {
  Future<List<dynamic>> getAllCategory() async {
    final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products/categories'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to load products');
    }
  }

}
