import 'dart:developer';

import 'package:flutter/widgets.dart';

class CounterProvider extends ChangeNotifier {
  int count = 0;

  void increment() {
    count = count + 1;
    log(count.toString());
    notifyListeners();
  }

  void decrement() {
    if (count > 0) {
      count = count - 1;
      log(count.toString());
      notifyListeners();
    }
  }
}
