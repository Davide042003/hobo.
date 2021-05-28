import 'package:flutter/cupertino.dart';

class HotPlaces {
  final String hotPlaceName;
  final String hotPlaceNameBackImage;
  final String hotPlaceNameFrontImage;
  final String hotPlaceNameBackImageBig;
  final String hotPlaceNameFrontImageBig;

  HotPlaces(
      {@required this.hotPlaceName,
        @required this.hotPlaceNameBackImage,
        @required this.hotPlaceNameFrontImage,
        @required this.hotPlaceNameBackImageBig,
        @required this.hotPlaceNameFrontImageBig,});
}

final hotPlacesArrayList = [
  HotPlaces(
    hotPlaceName: 'Paris',
    hotPlaceNameBackImage: "assets/images/Paris-Background.png",
    hotPlaceNameFrontImage: "assets/images/Paris-Monument.png",
    hotPlaceNameBackImageBig: "assets/images/Paris-Background_Big.png",
    hotPlaceNameFrontImageBig: "assets/images/Paris-Monument_Big.png",
  ),

  HotPlaces(
    hotPlaceName: 'Paris',
    hotPlaceNameBackImage: "assets/images/Paris-Background.png",
    hotPlaceNameFrontImage: "assets/images/Paris-Monument.png",
    hotPlaceNameBackImageBig: "assets/images/Paris-Background_Big.png",
    hotPlaceNameFrontImageBig: "assets/images/Paris-Monument_Big.png",
  ),

  HotPlaces(
    hotPlaceName: 'Paris',
    hotPlaceNameBackImage: "assets/images/Paris-Background.png",
    hotPlaceNameFrontImage: "assets/images/Paris-Monument.png",
    hotPlaceNameBackImageBig: "assets/images/Paris-Background_Big.png",
    hotPlaceNameFrontImageBig: "assets/images/Paris-Monument_Big.png",
  ),
];
