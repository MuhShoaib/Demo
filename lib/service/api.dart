// Future<List<Album>> fetchAlbum() async {
//   final response = await http.get(
//     Uri.parse('https://jsonplaceholder.typicode.com/albums'),
//     headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
//   );
//
//   if (response.statusCode == 200) {
//     final List<dynamic> data = json.decode(response.body);
//     return data.map((item) => Album.fromJson(item)).toList();
//   } else {
//     throw Exception('Failed to load albums');
//   }
// }

import 'dart:convert';

import 'package:demo/model/product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProducts() async {
  final response = await http.get(
    Uri.parse("https://api.escuelajs.co/api/v1/products"),
    headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((e) => Product.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
