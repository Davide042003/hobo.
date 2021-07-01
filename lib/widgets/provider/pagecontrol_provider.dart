import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PageControlProvider with ChangeNotifier {
  int _page = 0;

  int get page => _page;

  set changePage(int value) {
    _page = value;
    notifyListeners();
  }
}