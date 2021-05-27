import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hobo_test/widgets/home/hotplaceshome_widget.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/provider/dark_theme_provider.dart';
import 'package:hobo_test/widgets/styles/constants.dart';
import 'package:hobo_test/widgets/styles/dark_theme_styles.dart';
import 'package:hobo_test/widgets/home/profileimagehome_widget.dart';
import 'package:hobo_test/widgets/home/searchbar_widget.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.01,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.07),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore",
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Styles.whiteblack(themeChange.darkTheme, context)),
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.26),
                            blurRadius: 7,
                            offset: Offset(0, 6))
                      ],
                    ),
                    child: ProfileImageHomeWidget(
                        image: AssetImage("assets/images/provaSocial.jpeg"),
                        initials: "DB"))
              ],
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.015),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.07),
            child: Container(
              width: double.infinity,
              height: SizeConfig.screenHeight * 0.23,
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(Radius.circular(30)),
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.025),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.07),
              child: SearchBarWidget()),
          SizedBox(height: SizeConfig.screenHeight * 0.032),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.07),
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hot Places",
                      style: TextStyle(
                          fontFamily: Constants.POPPINS,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Styles.whiteblack(
                              themeChange.darkTheme, context)),
                      textAlign: TextAlign.left),
                  GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        width: SizeConfig.screenWidth * 0.2,
                        child: Text(
                          "See all",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: Styles.whiteblack(
                                  themeChange.darkTheme, context)),
                          textAlign: TextAlign.right,
                        ),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.015),
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.07),
            child: Container(
              height: SizeConfig.screenHeight * 0.2,
              child: ListView(
                primary: false,
                scrollDirection: Axis.horizontal,
                children: [
                  HotPlacesHomeWidget("assets/images/Paris-Background.png",
                      "assets/images/Paris-Monument.png", "Paris"),
                  HotPlacesHomeWidget("assets/images/NewYork-Background.png",
                      "assets/images/NewYork-Monument.png", "New York")
                ],
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.032),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.07),
            child: Container(
              width: double.infinity,
              child: Text(
                "Categories",
                style: TextStyle(
                    fontFamily: Constants.POPPINS,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Styles.whiteblack(themeChange.darkTheme, context)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
