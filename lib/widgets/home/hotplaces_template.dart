import 'package:flutter/cupertino.dart';

class HotPlaces {
  final String hotPlaceName;
  final String hotPlaceNameBackImage;
  final String hotPlaceNameFrontImage;
  final String hotPlaceNameBackImageBig;
  final String hotPlaceNameFrontImageBig;
  final double rating;
  final int numberRatings;
  final String description;

  HotPlaces(
      {@required this.hotPlaceName,
        @required this.hotPlaceNameBackImage,
        @required this.hotPlaceNameFrontImage,
        @required this.hotPlaceNameBackImageBig,
        @required this.hotPlaceNameFrontImageBig,
        @required this.rating,
        @required this.numberRatings,
        @required this.description});
}

final hotPlacesArrayList = [
  HotPlaces(
    hotPlaceName: 'Paris',
    hotPlaceNameBackImage: "assets/images/Paris-Background.png",
    hotPlaceNameFrontImage: "assets/images/Paris-Monument.png",
    hotPlaceNameBackImageBig: "assets/images/Paris-Background_Big.png",
    hotPlaceNameFrontImageBig: "assets/images/Paris-Monument_Big.png",
    rating: 4.1,
    numberRatings: 100,
    description: "Neque porro quisquam est qui dolorem ip sum quia dolor sit amet, consectetur, adi pisci velit."
  ),

  HotPlaces(
    hotPlaceName: 'Paris',
    hotPlaceNameBackImage: "assets/images/Paris-Background.png",
    hotPlaceNameFrontImage: "assets/images/Paris-Monument.png",
    hotPlaceNameBackImageBig: "assets/images/Paris-Background_Big.png",
    hotPlaceNameFrontImageBig: "assets/images/Paris-Monument_Big.png",
      rating: 3.5,
      numberRatings: 75,
      description: "Neque porro quisquam est qui dolorem ip sum quia dolor sit amet, consectetur, adi pisci velit."
  ),

  HotPlaces(
    hotPlaceName: 'Paris',
    hotPlaceNameBackImage: "assets/images/Paris-Background.png",
    hotPlaceNameFrontImage: "assets/images/Paris-Monument.png",
    hotPlaceNameBackImageBig: "assets/images/Paris-Background_Big.png",
    hotPlaceNameFrontImageBig: "assets/images/Paris-Monument_Big.png",
      rating: 2,
      numberRatings: 22,
      description: "Neque porro quisquam est qui dolorem ip sum quia dolor sit amet, consectetur, adi pisci velit."
  ),
];
