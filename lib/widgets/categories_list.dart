import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'home/categories_widget.dart';

class CategoriesList {
  List<CategoriesWidget> tags = [
    CategoriesWidget(
        Color.fromRGBO(255, 113, 184, .11),
        Color.fromRGBO(245, 83, 163, 1),
        0.31,
        Ionicons.restaurant,
        "Restaurants"),
    CategoriesWidget(
        Color.fromRGBO(117, 149, 255, .11),
        Color.fromRGBO(75, 114, 241, 1),
        0.22,
        Ionicons.bed,
        "Hotels"),
    CategoriesWidget(
        Color.fromRGBO(80, 206, 134, .11),
        Color.fromRGBO(32, 194, 101, 1),
        0.2,
        Ionicons.earth,
        "Bars"),
    CategoriesWidget(
        Color.fromRGBO(255, 113, 184, .11),
        Color.fromRGBO(245, 83, 163, 1),
        0.31,
        Ionicons.restaurant,
        "Restaurants")
  ];
}