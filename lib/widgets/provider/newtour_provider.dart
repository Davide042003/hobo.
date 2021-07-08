import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class NewTourProvider with ChangeNotifier {
  bool _addNewTourVisible = false;

  // step 1
  String _tourName = "";
  String _tourPlace = "";
  int _numberOfPeople = 0;
  bool _isForChildren;
  bool _isPrivate;

  bool get addNewTourVisible => _addNewTourVisible;

  // step 1
  String get tourName => _tourName;
  String get tourPlace => _tourPlace;
  int get numberOfPeople => _numberOfPeople;
  bool get isForChildren => _isForChildren;
  bool get isPrivate => _isPrivate;

  set addNewTourVisible(bool value) {
    _addNewTourVisible = value;
    notifyListeners();
  }
  // step 1
  set setTourName(String tourNameSet) {
    _tourName = tourNameSet;
    notifyListeners();
  }
  set setTourPlace(String tourPlaceSet) {
    _tourPlace = tourPlaceSet;
    notifyListeners();
  }
  set setNumberOfPeople(int numberOfPeopleSet) {
    _numberOfPeople = numberOfPeopleSet;
    notifyListeners();
  }
  set setIsForChildren(bool isForChildrenSet) {
    _isForChildren = isForChildrenSet;
    notifyListeners();
  }
  set setIsPrivate(bool isPrivateSet) {
    _isPrivate = isPrivateSet;
    notifyListeners();
  }


}