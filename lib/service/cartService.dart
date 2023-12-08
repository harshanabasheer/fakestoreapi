import 'dart:convert';
import 'package:http/http.dart' as http;

class CartService {
  Future<void> addToCart(int userId, int productId, int quantity) async {
    var data={
      'userId': userId,
      'date': DateTime.now().toIso8601String(),
      'products': [
        {'productId': productId, 'quantity': quantity}
      ],
    };
    final response = await http.post(
      Uri.parse('https://fakestoreapi.com/carts'),
      body: jsonEncode(<String, dynamic>{
        'userId': userId,
        'date': DateTime.now().toIso8601String(),
        'products': [
          {'productId': productId, 'quantity': quantity}
        ],
      }),
    );
   if(response.statusCode != 200){
      throw Exception('Failed to add to cart');
    }
  }
}
