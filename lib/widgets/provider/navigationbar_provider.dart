import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class NavigationBarProvider with ChangeNotifier {
  bool _scrollingDown = false;

  bool get scrollingDown => _scrollingDown;

  set navigationdown(bool value) {
    _scrollingDown = value;
    notifyListeners();
  }
}