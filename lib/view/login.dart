import 'dart:developer';

import 'package:demo/view/api_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: "Enter Email"),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(hintText: "Enter Password"),
            ),
            ElevatedButton(
              onPressed: () {
                createUserwithEmail(email: email.text, password: password.text).then((
                  value,
                ) {
                  log(value.user.toString());

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProductView();
                      },
                    ),
                  );
                });
              },
              child: Text("Sign in with Email"),
            ),

            ElevatedButton(
              onPressed: () {
                signInWithGoogle().then((value) {
                  log(value.user.toString());

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProductView();
                      },
                    ),
                  );
                });
              },
              child: Text("Sign in with Google"),
            ),
          ],
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> createUserwithEmail({
    required String email,
    required String password,
  }) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

}
