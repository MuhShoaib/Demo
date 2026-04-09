// lib/services/firestore_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/product_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get currentUserId => _auth.currentUser?.uid ?? '';

  CollectionReference get productsCollection =>
      _firestore.collection('products');

  // Add Product
  Future<String> addProduct(ProductModel product) async {
    try {
      final docRef = await productsCollection.add({
        'name': product.name,
        'price': product.price,
        'quantity': product.quantity,
        'userId': currentUserId,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
      return docRef.id;
    } catch (e) {
      throw Exception('Failed to add product: $e');
    }
  }

  // Get all products for current user (Real-time)
  Stream<List<ProductModel>> getUserProducts() {
    return productsCollection
        .where('userId', isEqualTo: currentUserId)
        // .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProductModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  // Get single product
  Future<ProductModel?> getProduct(String productId) async {
    try {
      final doc = await productsCollection.doc(productId).get();
      if (doc.exists && doc.data() != null) {
        return ProductModel.fromMap(
            doc.id, doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get product: $e');
    }
  }

  // Update Product
  Future<void> updateProduct(ProductModel product) async {
    try {
      await productsCollection.doc(product.id).update({
        'name': product.name,
        'price': product.price,
        'quantity': product.quantity,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to update product: $e');
    }
  }

  // Delete Product
  Future<void> deleteProduct(String productId) async {
    try {
      await productsCollection.doc(productId).delete();
    } catch (e) {
      throw Exception('Failed to delete product: $e');
    }
  }

  // Search products by name
  Stream<List<ProductModel>> searchProducts(String searchTerm) {
    return productsCollection
        .where('userId', isEqualTo: currentUserId)
        .where('name', isGreaterThanOrEqualTo: searchTerm)
        .where('name', isLessThanOrEqualTo: '$searchTerm\uf8ff')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProductModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}