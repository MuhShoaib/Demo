import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Stack(
        clipBehavior: Clip.none,
        // alignment: Alignment.center,
        children: [
          Container(height: 300, width: 300, color: Colors.red),
          Container(height: 200, width: 200, color: Colors.green),

          Positioned(
            bottom: 0,
            right: -50,
            child: Container(height: 100, width: 100, color: Colors.pink),
          ),
        ],
      ),
    );
  }
}
