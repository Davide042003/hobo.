import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class NewTourProvider with ChangeNotifier {
  bool _addNewTourVisible = false;

  bool get addNewTourVisible => _addNewTourVisible;

  set addNewTourVisible(bool value) {
    _addNewTourVisible = value;
    notifyListeners();
  }
}