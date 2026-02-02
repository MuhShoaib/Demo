import 'package:demo/demo/home.dart';
import 'package:flutter/material.dart';

import '../utils/size_utils.dart';

class AppBtn extends StatelessWidget {
  final double? radius;

  final Color? color;
  final String text;
  final double? fontSize;
  final Function()? onTap;

  final bool? isFill;
  const AppBtn({
    super.key,
    this.radius,
    this.color,
    required this.text,
    this.fontSize,
    required this.onTap,
    this.isFill = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: .symmetric(horizontal: 15.h),
        height: 55.v,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: appColor),
          color: isFill == true ? color : null,
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),

        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isFill == true ? Colors.white : Colors.black,
              fontSize: fontSize ?? 16.fSize,
            ),
          ),
        ),
      ),
    );
  }
}
