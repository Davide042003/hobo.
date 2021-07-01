import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PageControlProvider with ChangeNotifier {
  PageController _page = new PageController(initialPage: 0);
  int _actualPage = 0;

  int get actualPage => _actualPage;
  PageController get page => _page;

  set changePage(int value) {
    _actualPage = actualPage;
    _page.jumpToPage(value);
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    page.dispose();
    super.dispose();
  }
}