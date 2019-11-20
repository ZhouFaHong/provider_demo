import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  // 1.这里需要混入ChangeNotifier

  int _count;
  Counter(this._count);

  void add() {
    this._count++;
    notifyListeners(); /* 2.写一个增加的方法，然后需要调用notifyListeners();
                          这个方法是通知用到Counter对象的widget刷新用的。*/
  }

  get count => this._count; // 3.get方法

}


