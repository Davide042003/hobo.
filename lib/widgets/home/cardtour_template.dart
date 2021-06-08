import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardTour {
  final String placeName;
  final String placeImage;
  final double rating;
  final int numberRatings;
  final int price;

  CardTour(
      {@required this.placeName,
        @required this.placeImage,
        @required this.rating,
        @required this.numberRatings,
        @required this.price});
}

final cardTourArrayList = [
  CardTour(placeName: "Paris", placeImage: "assets/images/Paris-Background.png", rating: 4.9, numberRatings: 1250, price: 50),
  CardTour(placeName: "Paris", placeImage: "assets/images/Paris-Background.png", rating: 4.9, numberRatings: 1250, price: 50),
  CardTour(placeName: "Paris", placeImage: "assets/images/Paris-Background.png", rating: 4.9, numberRatings: 1250, price: 50)
];
