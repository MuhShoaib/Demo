import 'dart:convert';
import 'package:demo/demo/api/post.dart';
import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts/3'),
    headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    return Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load post');
  }
}

Future<Product> fetchProducts() async {
  final response = await http.get(
    Uri.parse('https://dummyjson.com/products'),
    headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    return Product.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load post');
  }
}

Future<List<Post>> fetchAllPost() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    final List data = jsonDecode(response.body);

    return data.map((e) => Post.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
}
