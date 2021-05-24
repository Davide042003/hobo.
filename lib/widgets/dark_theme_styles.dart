import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {

  static LinearGradient onboarding_gradient(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  LinearGradient(
        begin: Alignment(Alignment.topCenter.x, Alignment.topCenter.y),
        end: Alignment(Alignment.bottomCenter.x, Alignment.bottomCenter.y * 1.2),
        colors: [Color.fromRGBO(41, 41, 41, 1), Color.fromRGBO(84, 204, 255, 1)]) :LinearGradient(
        begin: Alignment(Alignment.topCenter.x, Alignment.topCenter.y),
        end: Alignment(Alignment.bottomCenter.x, Alignment.bottomCenter.y * 2),
        colors: [Colors.white, Color.fromRGBO(84, 204, 255, 1)]);
  }

  static Color onboarding_color_dot(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Color.fromRGBO(255, 255, 255, 0.17) : Color.fromRGBO(0, 0, 0, 0.17);
  }

  static Color onboarding_active_color_dot(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Colors.white : Color.fromRGBO(116, 142, 243, 1);
  }

  static Color onboarding_heading_color(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Colors.white : Color.fromRGBO(0, 0, 0, 0.17);
  }

  static Color onboarding_subheading_color(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Color.fromRGBO(255, 255, 255, 0.7) : Color.fromRGBO(92, 96, 113, 1);
  }

  static Color onboarding_skip(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Color.fromRGBO(255, 255, 255, 0.7) : Color.fromRGBO(92, 96, 113, 1);
  }

}