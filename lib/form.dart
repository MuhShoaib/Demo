import 'dart:developer';

import 'package:demo/service/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Decide initial screen based on SharedPreferences
class SplashDecider extends StatefulWidget {
  const SplashDecider({super.key});

  @override
  State<SplashDecider> createState() => _SplashDeciderState();
}

class _SplashDeciderState extends State<SplashDecider> {
  bool? isLoggedIn;

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool('isLogin') ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return isLoggedIn! ? const HomeScreen() : const AuthScreen();
  }
}




class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  bool isLoading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  Future<void> _handleAuth() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Fields cannot be empty")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      if (isLogin) {
        final value = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        log(value.user!.uid);
      } else {
        final value = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        await value.user?.updateDisplayName(nameController.text.trim());
      }

      _goToHome();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Auth Error")),
      );
    }

    setState(() => isLoading = false);
  }

  void _goToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  Future<void> _handleGoogleLogin() async {
    setState(() => isLoading = true);

    try {
      final user = await GoogleAuthService().signInWithGoogle();

      if (user != null) {
        log("Name: ${user.phoneNumber}");
        log("Email: ${user.email}");
        log("Photo: ${user.photoURL}");

        _goToHome();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Google Sign-In Failed")),
      );
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                isLogin ? "Login" : "Sign Up",
                style: const TextStyle(fontSize: 28),
              ),

              const SizedBox(height: 20),

              if (!isLogin)
                _buildField(nameController, "Name", Icons.person),

              _buildField(emailController, "Email", Icons.email),
              _buildField(passwordController, "Password", Icons.lock, isPassword: true),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: isLoading ? null : _handleAuth,
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(isLogin ? "Login" : "Sign Up"),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: isLoading ? null : _handleGoogleLogin,
                child: const Text("Sign In with Google"),
              ),

              TextButton(
                onPressed: () {
                  setState(() => isLogin = !isLogin);
                },
                child: Text(
                  isLogin
                      ? "Don't have account? Sign Up"
                      : "Already have account? Login",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(
      TextEditingController controller,
      String hint,
      IconData icon, {
        bool isPassword = false,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
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
//   Future<void> _saveLogin() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isLogin', true);
//   }
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
//         await _saveLogin();
//
//         _goToHome();
//       } else {
//         final value = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(
//               email: emailController.text.trim(),
//               password: passwordController.text.trim(),
//             );
//
//         await value.user?.updateDisplayName(nameController.text.trim());
//         await _saveLogin();
//
//         _goToHome();
//       }
//     } on FirebaseAuthException catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text(e.message ?? "Auth Error")));
//     } catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("Something went wrong")));
//     }
//
//     setState(() => isLoading = false);
//   }
//
//   void _goToHome() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (_) => const HomeScreen()),
//     );
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
//                 style: const TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
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
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 50),
//                 ),
//                 child: isLoading
//                     ? const CircularProgressIndicator(color: Colors.white)
//                     : Text(isLogin ? "Login" : "Sign Up"),
//               ),
//
//               const SizedBox(height: 10),
//
//               ElevatedButton(
//                 onPressed: () async {
//                   await GoogleAuthService().signInWithGoogle().then((val) {
//                     log(val!.displayName!);
//                     log(val.photoURL!);
//                   });
//                 },
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 50),
//                 ),
//                 child: isLoading
//                     ? const CircularProgressIndicator(color: Colors.white)
//                     : Text("Sign In with Google"),
//               ),
//               TextButton(
//                 onPressed: () {
//                   setState(() {
//                     isLogin = !isLogin;
//                   });
//                 },
//                 child: Text(
//                   isLogin
//                       ? "Don't have an account? Sign Up"
//                       : "Already have an account? Login",
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



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const AuthScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 👇 Profile Image
            CircleAvatar(
              radius: 50,
              backgroundImage: user?.photoURL != null
                  ? NetworkImage(user!.photoURL!)
                  : null,
              child: user?.photoURL == null
                  ? const Icon(Icons.person, size: 50)
                  : null,
            ),

            const SizedBox(height: 20),

            /// 👇 Name
            Text(
              user?.displayName ?? "No Name",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            /// 👇 Email
            Text(
              user?.email ?? "",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
