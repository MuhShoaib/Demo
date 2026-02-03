import 'package:demo/demo/utils/size_utils.dart';
import 'package:demo/demo/widgets/appBtn.dart';
import 'package:demo/demo/widgets/social_btn.dart';
import 'package:demo/view/login.dart';
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
                style: TextStyle(
                  fontSize: 24.fSize,
                  fontWeight: FontWeight.w600,
                ),
              ),

              // SizedBox(height: 15),
              Gap.v(15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Text(
                  "Easily browse nearby takeaways and explore menus from your favorite spots — all in one place.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.fSize,
                    color: Color.fromRGBO(74, 74, 74, 1),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              Gap.v(20),
              Padding(
                padding: .symmetric(horizontal: 10.h),
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

          SocialBtn(
            image: 'assets/fb.png',
            text: 'Sign In with Facebook',
            onTap: () {
              String temp = "45.5";

              double t = double.parse(temp);
              int te = int.parse(temp);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginView(name: 'Shoaib', temp: t);
                  },
                ),
              );
            },
          ),
          Gap.v(10),
          SocialBtn(
            image: 'assets/google.png',
            text: 'Sign In with Google',
            onTap: () {},
          ),
          Gap.v(10),
          Column(
            children: [
              AppBtn(
                text: "Get Started",
                onTap: () {},
                color: appColor,
                radius: 8,
              ),
              Gap.v(15),
              AppBtn(
                isFill: false,
                text: "Continue as Guest?",
                onTap: () {},
                color: appColor,
                radius: 8,
              ),
            ],
          ),

          Gap.v(20),
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
      margin: .symmetric(horizontal: 5.h),
      padding: .symmetric(horizontal: 10.h, vertical: 10.v),
      decoration: BoxDecoration(
        color: cColor,
        borderRadius: BorderRadius.circular(8),
      ),

      child: Column(
        children: [
          Image.asset(image, height: 35.h, width: 35.h),
          Gap.v(10),
          Text(text, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
