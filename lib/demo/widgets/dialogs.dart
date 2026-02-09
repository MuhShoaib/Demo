import 'package:demo/demo/widgets/social_btn.dart';
import 'package:flutter/material.dart';

import '../utils/size_utils.dart';

class DailogView extends StatelessWidget {
  const DailogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {

                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return Dialog(
                //       child: Column(
                //         children: [
                //           Text("")
                //         ],
                //       ),
                //
                //     );
                //     // return AlertDialog(
                //     //
                //     //
                //     //   content:  Text("Do You Want to Exit App?"),
                //     //   title: Text(" Exit App?"),
                //     //   actions: [
                //     //     ElevatedButton(
                //     //       onPressed: () {
                //     //         Navigator.pop(context);
                //     //       },
                //     //       child: Text("Yes"),
                //     //     ),
                //     //
                //     //     ElevatedButton(
                //     //       onPressed: () {
                //     //         Navigator.pop(context);
                //     //       },
                //     //       child: Text("No"),
                //     //     ),
                //     //   ],
                //     // );
                //   },
                // );
              },
              child: Text("Open Dialog"),
            ),
          ),
        ],
      ),
    );
  }
}
