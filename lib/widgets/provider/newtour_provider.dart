import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/methods/firestore_service.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class NewTourProvider with ChangeNotifier {
  final FirestoreService _repository = FirestoreService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _addNewTourVisible = false;

  // Ids
  var uuid = Uuid();
  var tourId;
  var activityId;
  var activitiesPlacesId;

  // step 1
  String _tourName = "";
  String _tourPlaceName = "";
  String _tourPlaceId = "";
  int _numberOfPeople = 0;
  bool _isForChildren = false;
  bool _isPrivate = false;

  // step 2
  String _tourUrlImage1 = "";
  String _tourUrlImage2 = "";
  String _tourUrlImage3 = "";
  List<String> tourImages = List<String>.filled(0, "", growable: true);
  String _tourDescription = "";
  String _tourLanguage = "";

  // step 3
  String _tourDate = "";
  String _tourTime = "";

  // step 4
  String _activityDescription = "";
  bool _only18 = false;
  bool _luxury = false;
  String _price = "";

  List<String> activities = List<String>.filled(5, "", growable: true);

  bool get addNewTourVisible => _addNewTourVisible;

  // step 1
  String get tourName => _tourName;

  String get tourPlaceName => _tourPlaceName;

  String get tourPlaceId => _tourPlaceId;

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


  // step 4
  String get activityDescription => _activityDescription;
  bool get only18 => _only18;
  bool get luxury => _luxury;
  String get price => _price;

  set addNewTourVisible(bool value) {
    _addNewTourVisible = value;
    notifyListeners();
  }

  // step 1
  set setTourName(String tourNameSet) {
    _tourName = tourNameSet;
    notifyListeners();
  }

  set setTourPlaceName(String tourPlaceNameSet) {
    _tourPlaceName = tourPlaceNameSet;
    notifyListeners();
  }

  set setTourPlaceId(String tourPlaceIdSet) {
    _tourPlaceId = tourPlaceIdSet;
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
  set setTourImages(String urlImage) {
    try {
      tourImages.add(urlImage);
      int i = 0;
      tourImages.forEach((element) {
        print("Image $i " + element);
        i++;
      });
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

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


  // step 4

  set setActivityDescription(String descript) {
    _activityDescription = descript;
    notifyListeners();
  }
  set setOnly18(bool only) {
    _only18 = only;
    notifyListeners();
  }
  set setLuxury(bool lux) {
    _luxury = lux;
    notifyListeners();
  }
  set setPrice(String priceActivity) {
    _price = priceActivity;
    notifyListeners();
  }

  void createActivity() {
    if (tourId== null || tourId == "") {
      print("Generate new tour from: createActivity from newtour_provider");
      tourId = uuid.v1();
    }
    activityId = uuid.v1();
    activitiesPlacesId = uuid.v1();

    _repository.createActivity(
        _auth.currentUser.uid,
        tourId,
        activityId,
    _activityDescription,
      _only18,
      _luxury,
      activitiesPlacesId,
      _price
    );
  }

  // step 5 - publish tour
  void publishTour() {
    // tourId was set in: createActivity function (step 4)
    //tourId = uuid.v1();

    _repository.createTours(
        _auth.currentUser.uid,
        tourId,
        _tourName,
        _tourPlaceName,
        _numberOfPeople,
        _isForChildren,
        _isPrivate,
        _tourDescription,
        _tourLanguage,
        _tourUrlImage1,
        _tourDate,
        _tourTime,
        "id attività",
        "id vehicles",
        4,
        5,
        22);

    // save images
    tourImages.forEach((element) {
      _repository.addTourImage(_auth.currentUser.uid, tourId, element);
    });
    // todo: clean all the variables from this script after publish a tour!
  }
}
