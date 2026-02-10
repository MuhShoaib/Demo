import 'dart:async';

import 'package:demo/fastfood/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../demo/utils/size_utils.dart';
import 'login.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return LoginView();
      },));

    },);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [primary, secondary],
          stops: [
            0.57, // 57%
            0.93, // 93%
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/logo.png", scale: 4),
              Image.asset("assets/fast.png", width: 200.h),
            ],
          ),
        ),
      ),
    );
  }
}
