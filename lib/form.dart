// import 'dart:developer';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:demo/service/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// /// Decide initial screen based on SharedPreferences
// class SplashDecider extends StatefulWidget {
//   const SplashDecider({super.key});
//
//   @override
//   State<SplashDecider> createState() => _SplashDeciderState();
// }
//
// class _SplashDeciderState extends State<SplashDecider> {
//   bool? isLoggedIn;
//
//   @override
//   void initState() {
//     super.initState();
//     _checkLogin();
//   }
//
//   Future<void> _checkLogin() async {
//     final prefs = await SharedPreferences.getInstance();
//     isLoggedIn = prefs.getBool('isLogin') ?? false;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (isLoggedIn == null) {
//       return const Scaffold(body: Center(child: CircularProgressIndicator()));
//     }
//
//     return isLoggedIn! ? HomeScreen() : const AuthScreen();
//   }
// }
//
// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});
//
//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }
//
// class _AuthScreenState extends State<AuthScreen> {
//   bool isLogin = true;
//   bool isLoading = false;
//
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final nameController = TextEditingController();
//
//   Future<void> _handleAuth() async {
//     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("Fields cannot be empty")));
//       return;
//     }
//
//     setState(() => isLoading = true);
//
//     try {
//       if (isLogin) {
//         final value = await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim(),
//         );
//
//         log(value.user!.uid);
//       } else {
//         final value = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(
//               email: emailController.text.trim(),
//               password: passwordController.text.trim(),
//             );
//
//         await value.user?.updateDisplayName(nameController.text.trim());
//       }
//
//       _goToHome();
//     } on FirebaseAuthException catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text(e.message ?? "Auth Error")));
//     }
//
//     setState(() => isLoading = false);
//   }
//
//   void _goToHome() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (_) => HomeScreen()),
//     );
//   }
//
//   Future<void> _handleGoogleLogin() async {
//     setState(() => isLoading = true);
//
//     try {
//       final user = await GoogleAuthService().signInWithGoogle();
//
//       if (user != null) {
//         log("Name: ${user.phoneNumber}");
//         log("Email: ${user.email}");
//         log("Photo: ${user.photoURL}");
//
//         _goToHome();
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("Google Sign-In Failed")));
//     }
//
//     setState(() => isLoading = false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               Text(
//                 isLogin ? "Login" : "Sign Up",
//                 style: const TextStyle(fontSize: 28),
//               ),
//
//               const SizedBox(height: 20),
//
//               if (!isLogin) _buildField(nameController, "Name", Icons.person),
//
//               _buildField(emailController, "Email", Icons.email),
//               _buildField(
//                 passwordController,
//                 "Password",
//                 Icons.lock,
//                 isPassword: true,
//               ),
//
//               const SizedBox(height: 20),
//
//               ElevatedButton(
//                 onPressed: isLoading ? null : _handleAuth,
//                 child: isLoading
//                     ? const CircularProgressIndicator(color: Colors.white)
//                     : Text(isLogin ? "Login" : "Sign Up"),
//               ),
//
//               const SizedBox(height: 10),
//
//               ElevatedButton(
//                 onPressed: isLoading ? null : _handleGoogleLogin,
//                 child: const Text("Sign In with Google"),
//               ),
//
//               TextButton(
//                 onPressed: () {
//                   setState(() => isLogin = !isLogin);
//                 },
//                 child: Text(
//                   isLogin
//                       ? "Don't have account? Sign Up"
//                       : "Already have account? Login",
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildField(
//     TextEditingController controller,
//     String hint,
//     IconData icon, {
//     bool isPassword = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15),
//       child: TextField(
//         controller: controller,
//         obscureText: isPassword,
//         decoration: InputDecoration(
//           prefixIcon: Icon(icon),
//           hintText: hint,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//         ),
//       ),
//     );
//   }
// }
// // class AuthScreen extends StatefulWidget {
// //   const AuthScreen({super.key});
// //
// //   @override
// //   State<AuthScreen> createState() => _AuthScreenState();
// // }
// //
// // class _AuthScreenState extends State<AuthScreen> {
// //   bool isLogin = true;
// //   bool isLoading = false;
// //
// //   final emailController = TextEditingController();
// //   final passwordController = TextEditingController();
// //   final nameController = TextEditingController();
// //
// //   Future<void> _saveLogin() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     await prefs.setBool('isLogin', true);
// //   }
// //
// //   Future<void> _handleAuth() async {
// //     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
// //       ScaffoldMessenger.of(
// //         context,
// //       ).showSnackBar(const SnackBar(content: Text("Fields cannot be empty")));
// //       return;
// //     }
// //
// //     setState(() => isLoading = true);
// //
// //     try {
// //       if (isLogin) {
// //         final value = await FirebaseAuth.instance.signInWithEmailAndPassword(
// //           email: emailController.text.trim(),
// //           password: passwordController.text.trim(),
// //         );
// //
// //         log(value.user!.uid);
// //         await _saveLogin();
// //
// //         _goToHome();
// //       } else {
// //         final value = await FirebaseAuth.instance
// //             .createUserWithEmailAndPassword(
// //               email: emailController.text.trim(),
// //               password: passwordController.text.trim(),
// //             );
// //
// //         await value.user?.updateDisplayName(nameController.text.trim());
// //         await _saveLogin();
// //
// //         _goToHome();
// //       }
// //     } on FirebaseAuthException catch (e) {
// //       ScaffoldMessenger.of(
// //         context,
// //       ).showSnackBar(SnackBar(content: Text(e.message ?? "Auth Error")));
// //     } catch (e) {
// //       ScaffoldMessenger.of(
// //         context,
// //       ).showSnackBar(const SnackBar(content: Text("Something went wrong")));
// //     }
// //
// //     setState(() => isLoading = false);
// //   }
// //
// //   void _goToHome() {
// //     Navigator.pushReplacement(
// //       context,
// //       MaterialPageRoute(builder: (_) => const HomeScreen()),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: SingleChildScrollView(
// //           padding: const EdgeInsets.all(20),
// //           child: Column(
// //             children: [
// //               Text(
// //                 isLogin ? "Login" : "Sign Up",
// //                 style: const TextStyle(
// //                   fontSize: 28,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //
// //               if (!isLogin) _buildField(nameController, "Name", Icons.person),
// //
// //               _buildField(emailController, "Email", Icons.email),
// //               _buildField(
// //                 passwordController,
// //                 "Password",
// //                 Icons.lock,
// //                 isPassword: true,
// //               ),
// //
// //               const SizedBox(height: 20),
// //
// //               ElevatedButton(
// //                 onPressed: isLoading ? null : _handleAuth,
// //                 style: ElevatedButton.styleFrom(
// //                   minimumSize: const Size(double.infinity, 50),
// //                 ),
// //                 child: isLoading
// //                     ? const CircularProgressIndicator(color: Colors.white)
// //                     : Text(isLogin ? "Login" : "Sign Up"),
// //               ),
// //
// //               const SizedBox(height: 10),
// //
// //               ElevatedButton(
// //                 onPressed: () async {
// //                   await GoogleAuthService().signInWithGoogle().then((val) {
// //                     log(val!.displayName!);
// //                     log(val.photoURL!);
// //                   });
// //                 },
// //                 style: ElevatedButton.styleFrom(
// //                   minimumSize: const Size(double.infinity, 50),
// //                 ),
// //                 child: isLoading
// //                     ? const CircularProgressIndicator(color: Colors.white)
// //                     : Text("Sign In with Google"),
// //               ),
// //               TextButton(
// //                 onPressed: () {
// //                   setState(() {
// //                     isLogin = !isLogin;
// //                   });
// //                 },
// //                 child: Text(
// //                   isLogin
// //                       ? "Don't have an account? Sign Up"
// //                       : "Already have an account? Login",
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildField(
// //     TextEditingController controller,
// //     String hint,
// //     IconData icon, {
// //     bool isPassword = false,
// //   }) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 15),
// //       child: TextField(
// //         controller: controller,
// //         obscureText: isPassword,
// //         decoration: InputDecoration(
// //           prefixIcon: Icon(icon),
// //           hintText: hint,
// //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   Future<void> _logout(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isLogin', false);
//
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (_) => const AuthScreen()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) =>  AddProduct()),
//         );
//       },child: Icon(Icons.add),),
//       appBar: AppBar(
//         title: const Text("Home"),
//         actions: [
//           IconButton(
//             onPressed: () => _logout(context),
//             icon: const Icon(Icons.logout),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Text(
//           "Welcome\n${user?.email ?? ''}",
//           textAlign: TextAlign.center,
//           style: const TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
//
// class AddProduct extends StatefulWidget {
//   @override
//   State<AddProduct> createState() => _AddProductState();
// }
//
// class _AddProductState extends State<AddProduct> {
//   // const AddProduct({super.key});
//   final nameController = TextEditingController();
//
//   final priceController = TextEditingController();
//
//   final qtyController = TextEditingController();
//
//   bool isLoading = false;
//
//   Future<void> addProduct() async {
//     if (nameController.text.isEmpty ||
//         priceController.text.isEmpty ||
//         qtyController.text.isEmpty) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("All fields required")));
//       return;
//     }
//
//     try {
//       setState(() => isLoading = true);
//
//       final product = {
//         "name": "Brush",
//         "price": 55.5,
//         "quantity": 5,
//         "createdAt": FieldValue.serverTimestamp(),
//         "uid": FirebaseAuth.instance.currentUser!.uid,
//       };
//
//       await FirebaseFirestore.instance.collection("products").add(product);
//
//       await FirebaseFirestore.instance.collection("products").add({
//         "name": nameController.text.trim(),
//         "price": double.parse(priceController.text.trim()),
//         "quantity": int.parse(qtyController.text.trim()),
//         "createdAt": FieldValue.serverTimestamp(),
//         "uid": FirebaseAuth.instance.currentUser!.uid,
//       });
//
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("Product Added")));
//
//       nameController.clear();
//       priceController.clear();
//       qtyController.clear();
//     } catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text(e.toString())));
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }
//
//   @override
//   void dispose() {
//     nameController.dispose();
//     priceController.dispose();
//     qtyController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Add Product")),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: const InputDecoration(
//                 labelText: "Product Name",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 15),
//
//             TextField(
//               controller: priceController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: "Price",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 15),
//
//             TextField(
//               controller: qtyController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: "Quantity",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20),
//
//             isLoading
//                 ? const CircularProgressIndicator()
//                 : ElevatedButton(
//                     onPressed: addProduct,
//                     child: const Text("Add Product"),
//                   ),
//
//             ElevatedButton(
//               onPressed: () async {
//                 await FirebaseFirestore.instance
//                     .collection("products")
//                     .doc("QaU97w38QGwQ8BEgscFN")
//                     .delete();
//               },
//               child: const Text("Update Product"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
// class BottomNavBar extends StatefulWidget {
//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }
//
// class _BottomNavBarState extends State<BottomNavBar> {
//   int _page = 0;
//   GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         bottomNavigationBar: CurvedNavigationBar(
//           key: _bottomNavigationKey,
//           index: 0,
//           items: <Widget>[
//             Icon(Icons.add, size: 30),
//             Icon(Icons.list, size: 30),
//             Icon(Icons.compare_arrows, size: 30),
//             Icon(Icons.call_split, size: 30),
//             Icon(Icons.perm_identity, size: 30),
//           ],
//           color: Colors.white,
//           buttonBackgroundColor: Colors.white,
//           backgroundColor: Colors.blueAccent,
//           animationCurve: Curves.easeInOut,
//           animationDuration: Duration(milliseconds: 600),
//           onTap: (index) {
//             setState(() {
//               _page = index;
//             });
//           },
//           letIndexChange: (index) => true,
//         ),
//         body: Container(
//           color: Colors.blueAccent,
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(_page.toString(), style: TextStyle(fontSize: 160)),
//                 ElevatedButton(
//                   child: Text('Go To Page of index 1'),
//                   onPressed: () {
//                     final CurvedNavigationBarState? navBarState =
//                         _bottomNavigationKey.currentState;
//                     navBarState?.setPage(1);
//                   },
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }