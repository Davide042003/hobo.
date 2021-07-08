import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hobo_test/methods/firestore_service.dart';
import 'package:provider/provider.dart';

class NewTourProvider with ChangeNotifier {
  final FirestoreService _repository = FirestoreService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _addNewTourVisible = false;

  // step 1
  String _tourName = "";
  String _tourPlace = "";
  int _numberOfPeople = 0;
  bool _isForChildren;
  bool _isPrivate;

  // step 2
  String _tourUrlImage1 = "";
  String _tourUrlImage2 = "";
  String _tourUrlImage3 = "";
  String _tourDescription = "";
  String _tourLanguage = "";

  // step 3
  String _tourDate;
  String _tourTime;

  bool get addNewTourVisible => _addNewTourVisible;

  // step 1
  String get tourName => _tourName;

  String get tourPlace => _tourPlace;

  int get numberOfPeople => _numberOfPeople;

  bool get isForChildren => _isForChildren;

  bool get isPrivate => _isPrivate;

  // step 2
  String get tourUrlImage1 => _tourUrlImage1;

  String get tourUrlImage2 => _tourUrlImage2;

  String get tourUrlImage3 => _tourUrlImage3;

  String get tourDescription => _tourDescription;

  String get tourLanguage => _tourLanguage;

  // step 3
  String get tourDate => _tourDate;

  String get tourTime => _tourTime;

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

  // step 2
  set setTourImageUrl1(String url1) {
    _tourUrlImage1 = url1;
    notifyListeners();
  }

  set setTourImageUrl2(String url2) {
    _tourUrlImage2 = url2;
    notifyListeners();
  }

  set setTourImageUrl3(String url3) {
    _tourUrlImage3 = url3;
    notifyListeners();
  }

  set setTourDescription(String description) {
    _tourDescription = description;
    notifyListeners();
  }

  set setTourLanguage(String language) {
    _tourLanguage = language;
    notifyListeners();
  }

  // step 3
  set setTourDate(String date) {
    _tourDate = tourDate;
    notifyListeners();
  }

  set setTourTime(String time) {
    _tourTime = time;
    notifyListeners();
  }

  // step 5 - publish tour
  void publishTour() {
    _repository.createTours(
        _auth.currentUser.uid, _tourName, null, 4, 10, 50);
    _repository.createPosts(_auth.currentUser.uid, 'post test', 'Rome', null,
        55, 'This is a caption... ', 10);
  }

}
