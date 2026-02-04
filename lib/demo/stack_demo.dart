import 'dart:developer';

import 'package:demo/demo/utils/size_utils.dart';
import 'package:flutter/material.dart';

class StackDemo extends StatefulWidget {
  const StackDemo({super.key});

  @override
  State<StackDemo> createState() => _StackDemoState();
}

class _StackDemoState extends State<StackDemo> {
  bool? isCheck = false;
  bool isSwitch = false;

  DateTime? date;
  TimeOfDay? time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Center(
        child: Column(
          children: [
            Checkbox(
              activeColor: Colors.red,
              value: isCheck,
              onChanged: (value) {
                setState(() {
                  isCheck = value!;
                });
              },
            ),

            Switch(
              value: isSwitch,
              onChanged: (value) {
                setState(() {
                  isSwitch = value;
                });
              },
            ),

            ElevatedButton(
              onPressed: () async {
                await _selectDate(context);
                // date = await showDatePicker(
                //   context: context,
                //   firstDate: DateTime.now(),
                //   lastDate: DateTime(2050),
                // );
                //
                // setState(() {});
              },
              child: Text("Pick Date"),
            ),

            Gap.v(10),
            ElevatedButton(
              onPressed: () async {
                await _selectTime(context);
                // time = await showTimePicker(
                //   context: context,
                //   initialTime: TimeOfDay.now(),
                // );
                //
                // setState(() {});
              },
              child: Text("Pick Time"),
            ),

            date == null ? SizedBox() : Text("Date is $date"),
            time == null ? SizedBox() : Text("Time is $time"),
          ],
        ),
      ),

      // body: Stack(
      //   clipBehavior: Clip.none,
      //   // alignment: Alignment.center,
      //   children: [
      //     Container(height: 300, width: 300, color: Colors.red),
      //     Container(height: 200, width: 200, color: Colors.green),
      //
      //     Positioned(
      //       bottom: 0,
      //       right: -50,
      //       child: Container(height: 100, width: 100, color: Colors.pink),
      //     ),
      //   ],
      // ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Current date
      firstDate: DateTime(2000), // Earliest date
      lastDate: DateTime(2101), // Latest date
    );

    if (pickedDate != null && pickedDate != date) {
      setState(() {
        date = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedDate = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedDate != null && pickedDate != time) {
      setState(() {
        time = pickedDate;
      });
    }
  }
}
