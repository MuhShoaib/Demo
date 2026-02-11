// import 'package:flutter/material.dart';
//
// import '../utils/size_utils.dart';
//
// class ItemFood extends StatelessWidget {
//   final String image;
//   final String text;
//   final String rating;
//
//   const ItemFood({
//     super.key,
//     required this.image,
//     required this.text,
//     required this.rating,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: .symmetric(vertical: 10),
//       // width: 150.h,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 10, top: 10),
//             child: Image.asset(image, scale: 6),
//           ),
//           Gap.v(10),
//           Padding(padding: const EdgeInsets.only(left: 6), child: Text(text)),
//           Gap.v(10),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 5, top: 2),
//                 child: Icon(Icons.star, color: Color(0xFFF8E300), size: 15),
//               ),
//               Gap.h(3),
//               Text(rating),
//               Gap.h(60),
//               Icon(Icons.favorite_border_outlined),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class FoodItemCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String rating;
  final VoidCallback? onTap;

  const FoodItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.rating,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xffEDE8E8),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.08),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            Expanded(
              child: Center(child: Image.asset(image, fit: BoxFit.contain)),
            ),

            const SizedBox(height: 10),

            /// Title
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),

            /// Subtitle
            Text(
              subtitle,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
            ),

            const SizedBox(height: 8),

            /// Rating + Favorite
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const Icon(Icons.favorite_border),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
