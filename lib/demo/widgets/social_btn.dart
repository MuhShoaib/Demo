import 'package:flutter/material.dart';

import '../utils/size_utils.dart';

class SocialBtn extends StatelessWidget {
  final String image;
  final String text;
  final Function() onTap;

  const SocialBtn({super.key, required this.image, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.h),
        height: 55.v,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            SizedBox(width: 30.h),
            Image.asset(image, height: 30.h, width: 30.h),

            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14.fSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            SizedBox(width: 30.h + 35.h),
          ],
        ),
      ),
    );
  }
}
