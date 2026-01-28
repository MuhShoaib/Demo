import 'dart:developer';

import 'package:demo/demo/widgets/appBtn.dart';
import 'package:flutter/material.dart';

Color appColor = Color(0xFFFF3022);
Color cColor = Color(0xFFFFEAE9);

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        children: [
          Spacer(),

          Column(
            children: [
              Text(
                "Choose you!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Easily browse nearby takeaways and explore menus from your favorite spots — all in one place.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(74, 74, 74, 1),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              SizedBox(height: 25,),
              Padding(
                padding: .symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: ContainerWidget(
                        image: "assets/c1.png",
                        text: "Customer",
                      ),
                    ),
                
                    Expanded(
                      child: ContainerWidget(
                        image: "assets/c2.png",
                        text: "Merchant",
                      ),
                    ),
                
                    Expanded(
                      child: ContainerWidget(
                        image: "assets/c3.png",
                        text: "Driver",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Spacer(),

          Column(
            children: [
              AppBtn(
                text: "Get Started",
                onTap: () {},
                color: appColor,
                radius: 8,
              ),
              SizedBox(height: 15),
              AppBtn(
                isFill: false,
                text: "Continue as Guest?",
                onTap: () {},
                color: appColor,
                radius: 8,
              ),
            ],
          ),

          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  final String image;
  final String text;
  const ContainerWidget({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: .symmetric(horizontal: 5),
      padding: .symmetric(horizontal: 15,vertical: 15),
      decoration: BoxDecoration(
        color: cColor,
        borderRadius: BorderRadius.circular(8),
      ),

      child: Column(
        children: [
          Image.asset(image,height: 45,width: 45,),

          SizedBox(height: 10),
          Text(text, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
