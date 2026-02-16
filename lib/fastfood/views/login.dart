import 'dart:async';

import 'package:demo/demo/widgets/item.dart';
import 'package:demo/fastfood/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../demo/utils/size_utils.dart';

List<String> images = [
  "assets/f1.png",
  "assets/f2.png",
  "assets/f3.png",
  "assets/f4.png",
];

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
      // child: Scaffold(
      //   appBar: AppBar(),
      //   backgroundColor: Colors.transparent,
      //
      //   body: GridView.builder(
      //     padding: .symmetric(horizontal: 10.h, vertical: 10.v),
      //     itemCount: images.length,
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       childAspectRatio: 1.0,
      //       mainAxisSpacing: 10.v,
      //       crossAxisSpacing: 30.h,
      //       crossAxisCount: 2,
      //     ),
      //     itemBuilder: (context, index) {
      //       return FoodItemCard(
      //         image: images[index],
      //         title: "Food 1",
      //         rating: 4.9,
      //         subtitle: '',
      //       );
      //     },
      //   ),
      //   // body: Padding(
      //   //   padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.v),
      //   //   child: Column(children: []),
      //   // ),
      // ),
    );
  }
}

class FoodGridScreen extends StatelessWidget {
  FoodGridScreen({super.key});

  final List<int> numbers = [1, 2, 3, 4];
  // final List<FoodModel> foodList = [
  //   FoodModel(
  //     image: "assets/f1.png",
  //     title: "Cheeseburger",
  //     subtitle: "Fast",
  //     rating: 4.9,
  //   ),
  //   FoodModel(
  //     image: "assets/f2.png",
  //     title: "Pudding",
  //     subtitle: "Fast pudding",
  //     rating: 4.9,
  //   ),
  //   FoodModel(
  //     image: "assets/f3.png",
  //     title: "Hot Dog",
  //     subtitle: "Fast Hot Dog",
  //     rating: 4.9,
  //   ),
  //   FoodModel(
  //     image: "assets/f4.png",
  //     title: "French Fries",
  //     subtitle: "Fast frise",
  //     rating: 4.9,
  //   ),
  // ];

  final List<Map<String, dynamic>> foodList = [
    {
      "image": "assets/f1.png",
      "title": "Cheeseburger",
      "subtitle": "Fast",
      "rating": "4.9",
    },

    {
      "image": "assets/f2.png",
      "title": "Pudding",
      "subtitle": "Fast pudding",
      "rating": "4.9",
    },
    {
      "image": "assets/f3.png",
      "title": "Hot Dog",
      "subtitle": "Fast Hot Dog",
      "rating": "4.9",
    },
    {
      "image": "assets/f4.png",
      "title": "French Fries",
      "subtitle": "Fast frise",
      "rating": "4.9",
    },

    {
      "image": "assets/f5.png",
      "title": "Pizza",
      "subtitle": "Fast Pizza",
      "rating": "4.9",
    },

    {
      "image": "assets/f1.png",
      "title": "Cheeseburger",
      "subtitle": "Fast",
      "rating": "4.9",
    },

    {
      "image": "assets/f2.png",
      "title": "Pudding",
      "subtitle": "Fast pudding",
      "rating": "4.9",
    },
    {
      "image": "assets/f3.png",
      "title": "Hot Dog",
      "subtitle": "Fast Hot Dog",
      "rating": "4.9",
    },
    {
      "image": "assets/f4.png",
      "title": "French Fries",
      "subtitle": "Fast frise",
      "rating": "4.9",
    },

    {
      "image": "assets/f5.png",
      "title": "Pizza",
      "subtitle": "Fast Pizza",
      "rating": "4.9",
    },

    {
      "image": "assets/f1.png",
      "title": "Cheeseburger",
      "subtitle": "Fast",
      "rating": "4.9",
    },

    {
      "image": "assets/f2.png",
      "title": "Pudding",
      "subtitle": "Fast pudding",
      "rating": "4.9",
    },
    {
      "image": "assets/f3.png",
      "title": "Hot Dog",
      "subtitle": "Fast Hot Dog",
      "rating": "4.9",
    },
    {
      "image": "assets/f4.png",
      "title": "French Fries",
      "subtitle": "Fast frise",
      "rating": "4.9",
    },

    {
      "image": "assets/f5.png",
      "title": "Pizza",
      "subtitle": "Fast Pizza",
      "rating": "4.9",
    },
  ];

  List<String> foods = ["Pudding", "burger", "hot dog", "french fries", "All"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      // backgroundColor: const Color(0xffC41717), // red background
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
            child: ListView.builder(
              padding: .symmetric(vertical: 3.v),
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: foods.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: .symmetric(horizontal: 10.h),
                  margin: .symmetric(horizontal: 10.h),
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 0), // Shadow position
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text(foods[index])),
                );
                // return Container(
                //   height: 50.h,
                //   margin: .symmetric(horizontal: 10.h, vertical: 10.v),
                //   decoration: BoxDecoration(color: Colors.white),
                //
                //   child: Center(
                //     child: Text(
                //       textAlign: TextAlign.center,
                //       "${foodList[index]["title"]}\n ${foodList[index]["subtitle"]}",
                //     ),
                //   ),
                // );
              },
            ),
          ),

          Gap.v(10),
          Expanded(
            child: ListView.builder(
              // physics: BouncingScrollPhysics(),
              itemCount: foodList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    backgroundImage: AssetImage(foodList[index]["image"]),
                  ),
                  title: Text(foodList[index]["title"]),
                  subtitle: Text(foodList[index]["subtitle"]),
                  trailing: Text(foodList[index]["rating"]),
                );
                // return Container(
                //   height: 50.h,
                //   margin: .symmetric(horizontal: 10.h, vertical: 10.v),
                //   decoration: BoxDecoration(color: Colors.white),
                //
                //   child: Center(
                //     child: Text(
                //       textAlign: TextAlign.center,
                //       "${foodList[index]["title"]}\n ${foodList[index]["subtitle"]}",
                //     ),
                //   ),
                // );
              },
            ),
          ),
          Gap.v(10),
          SizedBox(
            height: 50.h,
            child: ListView.builder(
              padding: .symmetric(vertical: 3.v),
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: foodList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: .symmetric(horizontal: 10.h),
                  margin: .symmetric(horizontal: 10.h),
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 0), // Shadow position
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text(foodList[index]["title"])),
                );

                // return Container(
                //   height: 50.h,
                //   margin: .symmetric(horizontal: 10.h, vertical: 10.v),
                //   decoration: BoxDecoration(color: Colors.white),
                //
                //   child: Center(
                //     child: Text(
                //       textAlign: TextAlign.center,
                //       "${foodList[index]["title"]}\n ${foodList[index]["subtitle"]}",
                //     ),
                //   ),
                // );
              },
            ),
          ),

          Gap.v(20),
        ],
      ),
      // body: Padding(
      //   padding: EdgeInsets.all(16),
      //   child: Column(
      //     children: [
      //       // Wrap(
      //       //   spacing: 8, // horizontal space
      //       //   runSpacing: 8, // vertical space (next line gap)
      //       //   children: List.generate(foods.length, (index) {
      //       //     return Container(
      //       //       width: 80.h,
      //       //       height: 40.v,
      //       //       decoration: ShapeDecoration(
      //       //         color: Colors.white,
      //       //         shape: RoundedRectangleBorder(
      //       //           borderRadius: BorderRadius.circular(20),
      //       //         ),
      //       //         shadows: const [
      //       //           BoxShadow(
      //       //             color: Color(0x3F000000),
      //       //             blurRadius: 4,
      //       //             offset: Offset(1, 5),
      //       //             spreadRadius: 0,
      //       //           ),
      //       //         ],
      //       //       ),
      //       //       child: Center(
      //       //         child: Text(
      //       //           foods[index],
      //       //           style: const TextStyle(fontSize: 16),
      //       //           textAlign: TextAlign.center,
      //       //         ),
      //       //       ),
      //       //     );
      //       //   }),
      //       // ),
      //       Gap.v(20),
      //       Expanded(
      //         child: GridView.builder(
      //           itemCount: foodList.length,
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2,
      //             crossAxisSpacing: 15.h,
      //             mainAxisSpacing: 15.v,
      //             childAspectRatio: 0.75,
      //           ),
      //           itemBuilder: (context, index) {
      //             final item = foodList[index];
      //             return FoodItemCard(
      //               image: item["image"],
      //               title: item["title"],
      //               subtitle: item["subtitle"],
      //               rating: item["rating"],
      //             );
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class FoodModel {
  final String image;
  final String title;
  final String subtitle;
  final double rating;

  FoodModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.rating,
  });
}
