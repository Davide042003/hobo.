import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/provider/dark_theme_provider.dart';
import 'package:hobo_test/widgets/styles/constants.dart';
import 'package:hobo_test/widgets/styles/dark_theme_styles.dart';
import 'package:hobo_test/widgets/home/profileimagehome_widget.dart';
import 'package:hobo_test/widgets/home/profileimagehome_widget.dart';

class TourSummaryView extends StatefulWidget {
  @override
  _TourSummaryViewState createState() => _TourSummaryViewState();
}

class _TourSummaryViewState extends State<TourSummaryView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenHeight *0.9),
              child: Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight *1,
                color: Styles.loginregister_background(themeChange.darkTheme, context),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40)),
                color: Styles.blackwhite(themeChange.darkTheme, context),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.09),
                      blurRadius: 29,
                      offset: Offset(0, 3))
                ],
              ),
            ),
          ]),
        ),
        Column(
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.13,
              color: Styles.blackwhite(themeChange.darkTheme, context),
              child: Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.screenWidth * 0.02,
                    top: SizeConfig.screenHeight * 0.04),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        width: SizeConfig.screenWidth * 0.125,
                        height: SizeConfig.screenHeight,
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          color:
                              Styles.whiteblack(themeChange.darkTheme, context),
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.04),
                    Text(
                      "Tour Summary",
                      style: TextStyle(
                          fontFamily: Constants.POPPINS,
                          color:
                              Styles.whiteblack(themeChange.darkTheme, context),
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.18),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.26),
                                blurRadius: 7,
                                offset: Offset(0, 4))
                          ],
                        ),
                        child: ProfileImageHomeWidget(
                            image: AssetImage("assets/images/provaSocial.jpeg"),
                            initials: "DB")),
                  ],
                ),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.001,
              color: Color.fromRGBO(235, 235, 235, 1),
            ),
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.619),
              child: Stack(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.05,
                          right: SizeConfig.screenWidth * 0.05,
                          top: SizeConfig.screenHeight * 0.035),
                      child: SizedBox(
                          height: SizeConfig.screenHeight * 0.135,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Styles.blackwhite(
                                    themeChange.darkTheme, context),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(.09),
                                      blurRadius: 29,
                                      offset: Offset(0, -3))
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.screenWidth * 0.055,
                                      top: SizeConfig.screenHeight * 0.025),
                                  child: Column(
                                    children: [
                                      Text(
                                        "20 Apr     " + "18.30 - 19.30",
                                        style: TextStyle(
                                            fontFamily: Constants.POPPINS,
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal,
                                            color:
                                                Styles.tourpreview_datebottom(
                                                    themeChange.darkTheme,
                                                    context)),
                                      ),
                                      Text("Paris - France",
                                          style: TextStyle(
                                              fontFamily: Constants.POPPINS,
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                              color: Styles.whiteblack(
                                                  themeChange.darkTheme,
                                                  context))),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: SizeConfig.screenWidth * 0.28,
                                        top: SizeConfig.screenHeight * 0.026),
                                    child: Text(
                                      "250\$",
                                      style: TextStyle(
                                          fontFamily: Constants.POPPINS,
                                          fontSize: 30,
                                          color: Styles.tourpreview_colorprice(
                                              themeChange.darkTheme, context)),
                                    ))
                              ],
                            ),
                          ))),
                  Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.09,
                          right: SizeConfig.screenWidth * 0.09,
                          top: SizeConfig.screenHeight * 0.14),
                      child: SizedBox(
                          height: SizeConfig.screenHeight * 0.065,
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(116, 142, 243, 1),
                                      Color.fromRGBO(36, 65, 187, 1)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                boxShadow: [
                                 themeChange.darkTheme ? BoxShadow() : BoxShadow(
                                      color: Color.fromRGBO(62, 109, 255, .39),
                                      blurRadius: 15,
                                      offset: Offset(0, 9))
                                ]),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.screenWidth * 0.05),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Book Now",
                                    style: TextStyle(
                                        fontFamily: Constants.POPPINS,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 13,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          )))
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
