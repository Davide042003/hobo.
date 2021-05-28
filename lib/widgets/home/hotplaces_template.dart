import 'package:flutter/cupertino.dart';

class HotPlaces {
  final String hotPlaceName;
  final String hotPlaceNameBackImage;
  final String hotPlaceNameFrontImage;
  final String hotPlaceNameBackImageBig;
  final String hotPlaceNameFrontImageBig;
  final double rating;
  final int numberRatings;

  HotPlaces(
      {@required this.hotPlaceName,
        @required this.hotPlaceNameBackImage,
        @required this.hotPlaceNameFrontImage,
        @required this.hotPlaceNameBackImageBig,
        @required this.hotPlaceNameFrontImageBig,
        @required this.rating,
        @required this.numberRatings});
}

final hotPlacesArrayList = [
  HotPlaces(
    hotPlaceName: 'Paris',
    hotPlaceNameBackImage: "assets/images/Paris-Background.png",
    hotPlaceNameFrontImage: "assets/images/Paris-Monument.png",
    hotPlaceNameBackImageBig: "assets/images/Paris-Background_Big.png",
    hotPlaceNameFrontImageBig: "assets/images/Paris-Monument_Big.png",
    rating: 4.1,
    numberRatings: 100
  ),

  HotPlaces(
    hotPlaceName: 'Paris',
    hotPlaceNameBackImage: "assets/images/Paris-Background.png",
    hotPlaceNameFrontImage: "assets/images/Paris-Monument.png",
    hotPlaceNameBackImageBig: "assets/images/Paris-Background_Big.png",
    hotPlaceNameFrontImageBig: "assets/images/Paris-Monument_Big.png",
      rating: 3.5,
      numberRatings: 75
  ),

  HotPlaces(
    hotPlaceName: 'Paris',
    hotPlaceNameBackImage: "assets/images/Paris-Background.png",
    hotPlaceNameFrontImage: "assets/images/Paris-Monument.png",
    hotPlaceNameBackImageBig: "assets/images/Paris-Background_Big.png",
    hotPlaceNameFrontImageBig: "assets/images/Paris-Monument_Big.png",
      rating: 2,
      numberRatings: 22

  ),
];
