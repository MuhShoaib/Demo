import 'dart:developer';

import 'package:demo/demo/state/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/size_utils.dart';
import 'color_provider.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    // final counterProvider = Provider.of<CounterProvider>(context);
    return Consumer<CounterProvider>(
      builder: (context, value, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              value.increment();
            },
            child: Icon(Icons.add),
          ),

          body: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Text(value.count.toString(), style: TextStyle(fontSize: 30)),

                FloatingActionButton(
                  onPressed: () {
                    value.decrement();
                  },
                  child: Icon(Icons.minimize),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// class ColorView extends StatelessWidget {
//   const ColorView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final colorProvider = Provider.of<ColorProvider>(context);
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: .center,
//           children: [
//             Container(
//               height: 100,
//               width: 200,
//               color: colorProvider.selectedColor,
//             ),
//
//             SizedBox(
//               height: 100,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: colorProvider.colors.length,
//                 itemBuilder: (context, index) {
//                   return Center(
//                     child: InkWell(
//                       onTap: () {
//                         colorProvider.updateColor(index);
//                       },
//                       child: Container(
//                         margin: .symmetric(horizontal: 5.h),
//                         width: 30,
//                         height: 30,
//                         decoration: BoxDecoration(
//                           border:
//                               colorProvider.selectedColor ==
//                                   colorProvider.colors[index]
//                               ? Border.all(color: Colors.black)
//                               : null,
//                           shape: BoxShape.circle,
//                           color: colorProvider.colors[index],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ColorView extends StatelessWidget {
  const ColorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Color Picker")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Only this container listens to color change
          Consumer<ColorProvider>(
            builder: (context, provider, _) {
              return Container(
                height: 120,
                width: 220,
                decoration: BoxDecoration(
                  color: provider.selectedColor,
                  borderRadius: BorderRadius.circular(12),
                ),
              );
            },
          ),

          const SizedBox(height: 40),

          /// Color List
          SizedBox(
            height: 70,
            child: Consumer<ColorProvider>(
              builder: (context, provider, _) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.colors.length,
                  itemBuilder: (context, index) {
                    final isSelected = provider.selectedIndex == index;

                    return GestureDetector(
                      onTap: () => provider.updateColor(index),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: provider.colors[index],
                          border: isSelected
                              ? Border.all(color: Colors.black, width: 3)
                              : null,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
