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
    return isDarkTheme ?  Colors.white : Color.fromRGBO(0, 0, 0, 1);
  }

  static Color onboarding_subheading_color(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Color.fromRGBO(255, 255, 255, 0.7) : Color.fromRGBO(92, 96, 113, 1);
  }

  static Color onboarding_skip(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Color.fromRGBO(255, 255, 255, 0.32) : Color.fromRGBO(190, 190, 190, 1);
  }

  static Color loginregister_background(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Color.fromRGBO(41, 41, 41, 1) : Color.fromRGBO(245, 252, 255, 1);
  }

  static Color loginregister_google(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Colors.white : Color.fromRGBO(164, 164, 164, .1);
  }

  static Color loginregister_fb(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Colors.white : Color.fromRGBO(25, 119, 243, .15);
  }

  static Color whiteblack(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Colors.white : Colors.black;
  }

  static Color blackwhite(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Colors.black : Colors.white;
  }

  static Color loginregister_subheadingandform(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Color.fromRGBO(255, 255, 255, .5) : Color.fromRGBO(138, 138, 138, 1);
  }

  static Color loginregister_or(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Colors.white : Color.fromRGBO(51, 51, 51, 1);
  }

  static Color loginregister_forgot(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Color.fromRGBO(116, 142, 243, 1) : Color.fromRGBO(36, 65, 187, 1);
  }

  static Color loginregister_topbar(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Color.fromRGBO(233, 233, 233, .15) : Color.fromRGBO(233, 233, 233, 1);
  }

  static Color loginregister_disablewindowcolor(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Color.fromRGBO(255, 255, 255, .3) : Color.fromRGBO(220, 220, 220, 1);
  }

  static Color home_buttonnavigator(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Color.fromRGBO(116, 142, 243, 1) : Color.fromRGBO(82, 110, 219, 1);
  }

  static Color home_buttonnavigatordisable(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Color.fromRGBO(136, 136, 136, 1) : Color.fromRGBO(185, 212, 220, 1);
  }

  static Color home_navigatorbackground(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Color.fromRGBO(65, 65, 65, 1) : Colors.white;
  }

  static Color searchBar_text(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Colors.white : Color.fromRGBO(40, 39, 79, 1);
  }

  static Color categories_text(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Colors.white : Color.fromRGBO(23, 33, 42, 1);
  }

  static Color shadow_map(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ?  Colors.black.withOpacity(0) : Color.fromRGBO(241, 248, 251, 0);
  }

  static Color cardtour_map(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ? Color.fromRGBO(58, 58, 58, 1): Colors.white;
  }

  static Color tourpreview_datebottom(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ? Colors.white.withOpacity(.5) : Color.fromRGBO(177, 177, 177, 1);
  }

  static Color tourpreview_colorprice(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ? Color.fromRGBO(116, 142, 243, 1) : Color.fromRGBO(36, 65, 187, 1);
  }

  static Color tourpreview_colordescription(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ? Colors.white.withOpacity(.7) : Colors.black;
  }

  static Color tourpreview_bar(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ? Color.fromRGBO(235, 235, 235, .24) : Color.fromRGBO(235, 235, 235, 1);
  }

  static Color tourpreview_stars(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ? Color.fromRGBO(123, 123, 123, 1) : Colors.black.withOpacity(.28);
  }
}