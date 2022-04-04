import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/views/map_view.dart';
import 'package:hobo_test/widgets/home/map_widget.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

/// READ ME:
/// lat e lng e placeId usati sia per lo step 1 che per le activity dello step 4

class NewTourProvider with ChangeNotifier {

  bool _addNewTourVisible = false;

  bool _refreshMarkers = false;

  // Ids
  var uuid = Uuid();
  var _tourId = "";
  var activityId;
  var vehicleId;

  bool _isGuide = false;
  String _nameGuide = "";
  String _surname = "";
  String _birthday = "";
  String _gender = "";
  String _spokenLanguages = "";
  bool _certifiedGuide = false;
  String _nationality = "";

  // step 1
  String _tourName = "";
  String _tourPlaceName = "";
  String _tourPlaceId = "";
  int _numberOfPeople = 0;
  bool _isForChildren = false;
  bool _isPrivate = false;
  String _lat = "";
  String _lng = "";
  String _placeId = "";
  bool _completedCreation = false;

  // step 2
  String _tourUrlImage1 = "";
  String _tourUrlImage2 = "";
  String _tourUrlImage3 = "";
  List<String> tourImages = List<String>.filled(0, "", growable: true);
  String _tourDescription = "";
  String _tourLanguage = "";

  // step 3
  String _tourDate = "";
  String _tourTimeStart = "";
  String _tourTimeEnd = "";

  // step 4
  String _activityDescription = "";
  bool _only18 = false;
  bool _luxury = false;
  String _price = "";
  String _tourPlaceNameActivity = "";
  String _tourPlaceIdActivity = "";
  String _activityPlace = "";

  // step 5
  int _numberOfPeopleVehicle = 0;
  String _priceVehicle = "";
  int _currentPeopleOfVehicle = 0;
  String _typeOfVehicle = "";

  List<String> activities = List<String>.filled(5, "", growable: true);

  bool get addNewTourVisible => _addNewTourVisible;

  bool get refreshMarkers => _refreshMarkers;

  String get tourId => _tourId;

  // ---
  bool get isGuide => _isGuide;

  String get username => _nameGuide;

  String get surname => _surname;

  String get birthday => _birthday;

  String get gender => _gender;

  String get spokenLanguages => _spokenLanguages;

  bool get certifiedGuide => _certifiedGuide;

  String get nationality => _nationality;

  // ---


  // step 1
  String get tourName => _tourName;

  String get tourPlaceName => _tourPlaceName;

  String get tourPlaceId => _tourPlaceId;

  int get numberOfPeople => _numberOfPeople;

  bool get isForChildren => _isForChildren;

  bool get isPrivate => _isPrivate;

  String get lat => _lat;

  String get lng => _lng;

  String get placeId => _placeId;

  bool get completedCreation => _completedCreation;
  // step 2
  String get tourUrlImage1 => _tourUrlImage1;

  String get tourUrlImage2 => _tourUrlImage2;

  String get tourUrlImage3 => _tourUrlImage3;

  String get tourDescription => _tourDescription;

  String get tourLanguage => _tourLanguage;

  // step 3
  String get tourDate => _tourDate;

  String get tourTimeStart => _tourTimeStart;

  String get tourTimeEnd => _tourTimeEnd;

  // step 4
  String get activityDescription => _activityDescription;

  bool get only18 => _only18;

  bool get luxury => _luxury;

  String get price => _price;

  String get tourPlaceNameActivity => _tourPlaceNameActivity;

  String get tourPlaceIdActivity => _tourPlaceIdActivity;

  String get activityPlace => _activityPlace;

  // step 5
  int get numberOfPeopleVehicle => _numberOfPeopleVehicle;

  String get priceVehicle => _priceVehicle;

  int get currentPeopleOfVehicle => _currentPeopleOfVehicle;

  String get typeOfVehicle => _typeOfVehicle;

  set addNewTourVisible(bool value) {
    _addNewTourVisible = value;
    notifyListeners();
  }

  set refreshMarkersFunction (bool value) {
    _refreshMarkers = value;
    notifyListeners();
  }
  set setTourId(String tourID) {
    _tourId = tourID;
    print("ID del tour: " + _tourId);
    notifyListeners();
  }

  // GUIDE
  set setIsGuide(bool value) {
    _isGuide = value;
    registrationChoice(_isGuide);
    notifyListeners();
  }

  set setUsernameGuide(String usernameGuide) {
    _nameGuide = usernameGuide;
    notifyListeners();
  }

  set setSurnameGuide(String surnameGuide) {
    _surname = surnameGuide;
    notifyListeners();
  }

  set setBirthday(String birthD) {
    _birthday = birthD;
    notifyListeners();
  }

  set setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  void publishAddExtraInfo1() {

  }

  set setSpokenLanguages(String spoken) {
    _spokenLanguages = spoken;
    notifyListeners();
  }

  set setCertifiedGuide(bool certifiedG) {
    _certifiedGuide = certifiedG;
    notifyListeners();
  }

  set setNationality(String nation) {
    _nationality = nation;
    notifyListeners();
  }

  void publishAddExtraInfo2() {

  }

  // ---

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

  set setLat(String la) {
    _lat = la;
    notifyListeners();
  }

  set setLng(String ln) {
    _lng = ln;
    notifyListeners();
  }

  set setPlaceId(String plcId) {
    _placeId = plcId;
    notifyListeners();
  }

  set setCompleteCreation (bool created) {
    _completedCreation = created;
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
    _tourDate = date;
    notifyListeners();
  }

  set setTourTimeStart(String time) {
    _tourTimeStart = time;
    notifyListeners();
  }

  set setTourTimeEnd(String time) {
    _tourTimeEnd = time;
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

  set setPlaceNameActivity(String namePlaceActivity) {
    _tourPlaceNameActivity = namePlaceActivity;
    notifyListeners();
  }

  set setPlaceIdActivity(String tourPlaceActivityIdSet) {
    _tourPlaceIdActivity = tourPlaceActivityIdSet;
    notifyListeners();
  }

  set setActivityPlace(String tourPlaceActivityIdSet) {
    _activityPlace = activityPlace;
    notifyListeners();
  }

  // step 5
  set setNumberOfPeopleVehicle(int numberOfPeopleVehicleSet) {
    _numberOfPeopleVehicle = numberOfPeopleVehicleSet;
    notifyListeners();
  }

  set setPriceVehicle(String priceV) {
    _priceVehicle = priceV;
    notifyListeners();
  }

  // step 4
  void createActivity(String activityPl) {
    activityId = uuid.v1();

  }

  void createVehicleInfo() {
    vehicleId = uuid.v1();
  }

  // registration choice
  void registrationChoice(choice) {

  }

  // publish step 1
  void publishTourStep1() {
    // tourId was set in: createActivity function (step 4)
    //tourId = uuid.v1();



  }

  // publish step 2
  void publishTourStep2() {
    // tourId was set in: createActivity function (step 4)
    //tourId = uuid.v1();



    print("Tour: Step 2 Saved!");
  }

  // publish step 3
  void publishTourStep3() {
    // tourId was set in: createActivity function (step 4)
    //tourId = uuid.v1();



    print("Tour: Step 3 Saved!");
  }

  // step 5 - publish tour
  void publishTour() {
    /*
    tourImages.forEach((element) {
      _repository.addTourImage(_auth.currentUser.uid, _tourId, element);
    });
    */

    // todo: clean all the variables from this script after publish a tour!
    initVariables();
  }

  void initVariablesStep4Save() {
    // step 4
    _activityDescription = "";
    _only18 = false;
    _luxury = false;
    _price = "";
    _activityPlace = "";
    _lat = "";
    _lng = "";
    _placeId = "";

    print("--- tour id --- " + _tourId);

    notifyListeners();
  }

  void initVariables() {
    // step 1
    _tourName = "";
    _tourPlaceName = "";
    _tourPlaceId = "";
    _numberOfPeople = 0;
    _isForChildren = false;
    _isPrivate = false;
    _lat = "";
    _lng = "";
    _placeId = "";

    // step 2
    tourImages.clear();
    _tourDescription = "";
    _tourLanguage = "";

    // step 3
    _tourDate = "";
    _tourTimeStart = "";
    _tourTimeEnd = "";

    // step 4
    _activityDescription = "";
    _only18 = false;
    _luxury = false;
    _price = "";
    _activityPlace = "";

    // step 5
    _numberOfPeopleVehicle = 0;
    _priceVehicle = "";

    _tourId = "";
    _completedCreation = false;

    notifyListeners();
  }
}
