import 'dart:async';

import 'package:demo/fastfood/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../demo/utils/size_utils.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
      child: Scaffold(backgroundColor: Colors.transparent),
    );
  }
}
