// lib/providers/product_provider.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];
  List<Category> _categories = [];
  List<Product> _productsByCategory = [];
  String? _selectedCategory;
  bool _isLoading = false;
  String? _error;

  // Getters
  List<Product> get allProducts => _allProducts;
  List<Product> get filteredProducts => _filteredProducts;
  List<Category> get categories => _categories;
  List<Product> get productsByCategory => _productsByCategory;
  String? get selectedCategory => _selectedCategory;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Fetch all products
  Future<void> fetchProducts() async {
    _setLoading(true);
    _clearError();

    try {
      final response = await http.get(
        Uri.parse('https://dummyjson.com/products'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final productsResponse = ProductsResponse.fromJson(data);
        _allProducts = productsResponse.products;
        _filteredProducts = _allProducts;
        notifyListeners();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Fetch categories
  Future<void> fetchCategories() async {
    _setLoading(true);
    _clearError();

    try {
      final response = await http.get(
        Uri.parse('https://dummyjson.com/products/categories'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> data = jsonDecode(response.body);
        _categories = data.map((e) {
          if (e is String) {
            // If API returns just strings
            return Category(
              name: e,
              slug: e.toLowerCase().replaceAll(' ', '-'),
              url: 'https://dummyjson.com/products/category/$e',
            );
          } else {
            // If API returns objects
            return Category.fromJson(e as Map<String, dynamic>);
          }
        }).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Fetch products by category
  Future<void> fetchProductsByCategory(String category) async {
    _setLoading(true);
    _clearError();
    _selectedCategory = category;

    try {
      final response = await http.get(
        Uri.parse('https://dummyjson.com/products/category/$category'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final productsResponse = ProductsResponse.fromJson(data);
        _productsByCategory = productsResponse.products;
        notifyListeners();
      } else {
        throw Exception('Failed to load products for category: $category');
      }
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Search products
  void searchProducts(String query) {
    if (query.isEmpty) {
      _filteredProducts = _allProducts;
    } else {
      _filteredProducts = _allProducts.where((product) {
        return product.title.toLowerCase().contains(query.toLowerCase()) ||
            product.description.toLowerCase().contains(query.toLowerCase()) ||
            product.brand.toLowerCase().contains(query.toLowerCase()) ||
            product.category.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  // Reset filters
  void resetFilters() {
    _filteredProducts = _allProducts;
    _selectedCategory = null;
    _productsByCategory = [];
    notifyListeners();
  }

  // Select category for filtering
  void selectCategory(String category) {
    _selectedCategory = category;
    fetchProductsByCategory(category);
  }

  // Helper methods
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String value) {
    _error = value;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
  }
}
