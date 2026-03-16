// import 'package:demo/service/api.dart';
// import 'package:demo/view/login.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../model/product.dart';
//
// class ProductView extends StatefulWidget {
//   const ProductView({super.key});
//
//   @override
//   State<ProductView> createState() => _ProductViewState();
// }
//
// class _ProductViewState extends State<ProductView> {
//   late Future<List<Product>> product;
//
//   @override
//   void initState() {
//     super.initState();
//     product = fetchProducts();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade50,
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: () async {
//               await FirebaseAuth.instance.signOut();
//
//               // Navigator.pushReplacement(
//               //   context,
//               //   MaterialPageRoute(
//               //     builder: (context) {
//               //       return LoginView();
//               //     },
//               //   ),
//               // );
//             },
//             icon: Icon(Icons.logout),
//           ),
//         ],
//         title: const Text(
//           'Products',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//         ),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//       ),
//       body: FutureBuilder<List<Product>>(
//         future: product,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 strokeWidth: 2,
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//               ),
//             );
//           }
//
//           if (snapshot.hasError) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.error_outline,
//                     size: 64,
//                     color: Colors.red.shade300,
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'Failed to load products',
//                     style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         product = fetchProducts();
//                       });
//                     },
//                     child: const Text('Retry'),
//                   ),
//                 ],
//               ),
//             );
//           }
//
//           if (snapshot.hasData) {
//             final products = snapshot.data!;
//
//             // String? image = FirebaseAuth.instance.currentUser!.photoURL;
//             String? name = FirebaseAuth.instance.currentUser!.displayName;
//             String? email = FirebaseAuth.instance.currentUser!.email;
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                      // image!=null ?CircleAvatar(backgroundImage: NetworkImage(image!)):SizedBox(),
//
//                       SizedBox(width: 10),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//
//                           // Text(name!),
//
//                           Text(email!)],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   Expanded(
//                     child: GridView.builder(
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             crossAxisSpacing: 16,
//                             mainAxisSpacing: 16,
//                             childAspectRatio: 0.7,
//                           ),
//                       itemCount: products.length,
//                       itemBuilder: (context, index) {
//                         final product = products[index];
//                         return ProductCard(product: product);
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//
//           return const Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }
//
// class ProductCard extends StatelessWidget {
//   final Product product;
//
//   const ProductCard({super.key, required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Product Image
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//             child: Container(
//               height: 120,
//               width: double.infinity,
//               color: Colors.grey.shade100,
//               child: Image.network(
//                 product.images.isNotEmpty ? product.images[0] : '',
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return const Icon(
//                     Icons.shopping_bag_outlined,
//                     size: 40,
//                     color: Colors.grey,
//                   );
//                 },
//                 loadingBuilder: (context, child, loadingProgress) {
//                   if (loadingProgress == null) return child;
//                   return Center(
//                     child: CircularProgressIndicator(
//                       value: loadingProgress.expectedTotalBytes != null
//                           ? loadingProgress.cumulativeBytesLoaded /
//                                 loadingProgress.expectedTotalBytes!
//                           : null,
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//
//           // Product Details
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Title and Category
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         product.title,
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           height: 1.3,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       const SizedBox(height: 4),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 8,
//                           vertical: 2,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Text(
//                           product.category.name,
//                           style: const TextStyle(
//                             fontSize: 10,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   // Price and Add Button
//                   Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             '\$${product.price}',
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blue,
//                             ),
//                           ),
//                           Container(
//                             width: 32,
//                             height: 32,
//                             decoration: BoxDecoration(
//                               color: Colors.blue,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: IconButton(
//                               onPressed: () {},
//                               icon: const Icon(
//                                 Icons.add,
//                                 color: Colors.white,
//                                 size: 16,
//                               ),
//                               padding: EdgeInsets.zero,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// lib/screens/product_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../demo/state/product_provider.dart';
import '../model/product.dart' show Product;

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 0, vsync: this);
    _initializeData();
  }

  Future<void> _initializeData() async {
    final productProvider = Provider.of<ProductProvider>(
      context,
      listen: false,
    );

    // Fetch products and categories
    await Future.wait([
      productProvider.fetchProducts(),
      productProvider.fetchCategories(),
    ]);

    // Update tab controller with categories count
    setState(() {
      _tabController = TabController(
        length: productProvider.categories.length + 1, // +1 for "All" tab
        vsync: this,
      );
    });

    // Add listener for tab changes
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        _onTabChanged(_tabController.index);
      }
    });
  }

  void _onTabChanged(int index) {
    final productProvider = Provider.of<ProductProvider>(
      context,
      listen: false,
    );

    if (index == 0) {
      // "All" tab selected
      productProvider.resetFilters();
    } else {
      // Category tab selected
      final category = productProvider.categories[index - 1].name;
      productProvider.selectCategory(category);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Consumer<ProductProvider>(
            builder: (context, provider, child) {
              if (provider.categories.isEmpty) {
                return const SizedBox.shrink(); // Return empty widget when no categories
              }

              return TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: [
                  const Tab(text: 'All'),
                  ...provider.categories.map(
                    (category) => Tab(text: category.name),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          Provider.of<ProductProvider>(
                            context,
                            listen: false,
                          ).searchProducts('');
                        },
                      )
                    : null,
              ),
              onChanged: (query) {
                Provider.of<ProductProvider>(
                  context,
                  listen: false,
                ).searchProducts(query);
              },
            ),
          ),

          // Products Grid
          Expanded(
            child: Consumer<ProductProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.error != null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Error: ${provider.error}',
                          style: const TextStyle(color: Colors.red),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            provider.fetchProducts();
                            provider.fetchCategories();
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }

                // Determine which products to show
                List<Product> displayProducts;
                if (_tabController.index == 0) {
                  // Show all products or search results
                  displayProducts = _searchController.text.isNotEmpty
                      ? provider.filteredProducts
                      : provider.allProducts;
                } else {
                  // Show products by selected category
                  displayProducts = provider.productsByCategory;
                }

                if (displayProducts.isEmpty) {
                  return const Center(child: Text('No products found'));
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: displayProducts.length,
                  itemBuilder: (context, index) {
                    final product = displayProducts[index];
                    return _buildProductCard(product);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.network(
                product.thumbnail,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, size: 40),
                  );
                },
              ),
            ),
          ),

          // Product Details
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.brand,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 4),
                      if (product.discountPercentage > 0)
                        Text(
                          '${product.discountPercentage.toStringAsFixed(0)}% off',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, size: 14, color: Colors.amber[700]),
                      const SizedBox(width: 2),
                      Text(
                        product.rating.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
