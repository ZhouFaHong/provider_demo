import 'package:flutter/material.dart' show ChangeNotifier, PageController;

class IndexProvider with ChangeNotifier {
  
  int _index = 0;
  PageController pageController;

  int get index => _index;


  set index(int value) {
    _index = value;
    pageController.jumpToPage(this._index);
    notifyListeners(); // 当调用此方法时，会广播
  }

  IndexProvider() {
    pageController = PageController(initialPage: _index);
  }

  //使用ChangeNotifierProvider会在销毁时调用dispose()方法释放资源
  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }
}