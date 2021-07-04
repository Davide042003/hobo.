import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/toursummary/mapwaypoints_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TourWaypointsView extends StatefulWidget {
  @override
  _TourWaypointsViewState createState() => _TourWaypointsViewState();
}

class _TourWaypointsViewState extends State<TourWaypointsView> {
  Completer<GoogleMapController> _controller = Completer();
  bool _selectedMarker = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateSelectedMarkerTrue(){
    setState(() {
      _selectedMarker = true;
    });
  }

  void updateSelectedMarkerFalse(){
    setState(() {
      _selectedMarker = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          MapWaypointsWidget(_controller, updateSelectedMarkerTrue, updateSelectedMarkerFalse),
          IgnorePointer(
            child: Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.4,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Styles.loginregister_background(
                            themeChange.darkTheme, context),
                        Styles.shadow_map(themeChange.darkTheme, context),
                      ],
                      begin: themeChange.darkTheme
                          ? Alignment.center * .7
                          : Alignment.center * 1.2,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.13,
              child: Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.screenWidth * 0.02,
                    top: SizeConfig.screenHeight * 0.04),
                child: Row(children: [
                  GestureDetector(
                    child: Container(
                      width: SizeConfig.screenWidth * 0.125,
                      height: SizeConfig.screenHeight,
                      child: Icon(
                        CustomIcons.backarrow,
                        color:
                        Styles.whiteblack(themeChange.darkTheme, context),
                        size: 16,
                      ),
                    ),
                  ),
                  SizedBox(width: SizeConfig.screenWidth * 0.04),
                  Text(
                    "Paris Tour",
                    style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        color:
                        Styles.whiteblack(themeChange.darkTheme, context),
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                ]),
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                transform: Matrix4.translationValues(
                    0,
                    _selectedMarker
                        ? SizeConfig.screenHeight * 0.0
                        : SizeConfig.screenHeight * 0.35,
                    0),
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.35,
                decoration: BoxDecoration(
                    color: Styles.waypoints_background(
                        themeChange.darkTheme, context),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
              )),
        ],
      ),
    );
  }
}
