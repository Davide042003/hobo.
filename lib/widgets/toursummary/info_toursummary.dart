import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/provider/dark_theme_provider.dart';
import 'package:hobo_test/widgets/styles/constants.dart';
import 'package:hobo_test/widgets/styles/dark_theme_styles.dart';
import 'package:hobo_test/widgets/home/profileimagehome_widget.dart';

class InfoTourSummaryWidget extends StatefulWidget {
  @override
  _InfoTourSummaryWidgetState createState() => _InfoTourSummaryWidgetState();
}

class _InfoTourSummaryWidgetState extends State<InfoTourSummaryWidget> {
  final SwiperController _controller = new SwiperController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.015),
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * 0.06,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.065),
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Color.fromRGBO(116, 142, 243, 1), width: 2),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(116, 142, 243, .64),
                              blurRadius: 6,
                              offset: Offset(0, 3))
                        ]),
                    child: ProfileImageHomeWidget(
                        image: AssetImage("assets/images/provaSocial.jpeg"),
                        initials: "TT")),
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.03),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Jessie Williams",
                            style: TextStyle(
                                fontFamily: Constants.POPPINS,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Styles.whiteblack(
                                    themeChange.darkTheme, context))),
                        Row(
                          children: [
                            RatingBarIndicator(
                              rating: 4.1,
                              itemBuilder: (context, index) => Icon(
                                LineIcons.starAlt,
                                color: Color.fromRGBO(55, 199, 117, 1),
                              ),
                              unratedColor: Styles.tourpreview_stars(themeChange.darkTheme, context),
                              itemCount: 5,
                              itemSize: 12,
                              direction: Axis.horizontal,
                              itemPadding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.screenWidth * 0.003),
                            ),
                            SizedBox(width: SizeConfig.screenWidth * 0.02),
                            Text(
                              "4.1" + " (" + "220" + ")",
                              style: TextStyle(
                                  fontFamily: Constants.POPPINS,
                                  fontSize: 12,
                                  color: Color.fromRGBO(184, 184, 184, 1),
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.015,
        ),
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * 0.22,
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.05),
                    width: SizeConfig.screenWidth * 0.9,
                    height: SizeConfig.screenHeight * 0.22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Stack(children: [
                      Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return new Image.asset(
                            "assets/images/Paris-Tour.png",
                            fit: BoxFit.fill,
                          );
                        },
                        itemCount: 10,
                        layout: SwiperLayout.DEFAULT,
                        controller: _controller,
                        loop: true,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            width: SizeConfig.screenWidth,
                            height: SizeConfig.screenHeight * 0.1,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0),
                                      Colors.black
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.screenWidth * 0.07,
                                bottom: SizeConfig.screenHeight * 0.018),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Stack(
                                    children: [
                                      Text(
                                        "Paris",
                                        style: TextStyle(
                                            fontFamily: Constants.POPPINS,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top:
                                                SizeConfig.screenHeight * 0.03),
                                        child: Text(
                                          "France",
                                          style: TextStyle(
                                              fontFamily: Constants.POPPINS,
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: SizeConfig.screenHeight * 0.155),
                            child: GestureDetector(
                              child: Container(
                                  height: SizeConfig.screenHeight * 0.025,
                                  width: SizeConfig.screenWidth * 0.08,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                        colors: [
                                          Color.fromRGBO(84, 204, 255, 1),
                                          Color.fromRGBO(0, 119, 255, 1)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(.1),
                                              blurRadius: 2.0,
                                              offset: Offset(0, 3)),
                                        ]),
                                    child: Icon(
                                      Ionicons.map_outline,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                  )),
                              onTap: () {},
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(left: SizeConfig.screenWidth *0.17, bottom: SizeConfig.screenHeight *0.022),
                              child: RatingBarIndicator(
                                rating: 4.1,
                                itemBuilder: (context, index) => Icon(
                                  LineIcons.starAlt,
                                  color: Color.fromRGBO(255, 196, 0, 1),
                                ),
                                unratedColor: Color.fromRGBO(203, 203, 203, 1),
                                itemCount: 5,
                                itemSize: 12,
                                direction: Axis.horizontal,
                                itemPadding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.screenWidth * 0.005),
                              ),
                            ),
                          ),
                          SizedBox(width: SizeConfig.screenWidth * 0.02),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: SizeConfig.screenHeight *0.018),
                              child: Text(
                                "4.1" + " (" + "220" + ")",
                                style: TextStyle(
                                    fontFamily: Constants.POPPINS,
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ]),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      child: Container(
                        width: SizeConfig.screenWidth * 0.08,
                        height: SizeConfig.screenHeight * 0.06,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.33),
                                  blurRadius: 6)
                            ]),
                      ),
                      onTap: () => _controller.previous(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.035,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.065),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Description",
                style: TextStyle(
                  fontFamily: Constants.POPPINS,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Styles.whiteblack(themeChange.darkTheme, context),
                )),
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.005,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.065),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
                "Neque porro quisquam est qui dolorem ip sum quia dolor sit amet, consectetur, adi pisci velit. Neque porro quisquam est qui dolorem ip sum quia dolor sit amet, consectetur, adi pisci velit.",
                style: TextStyle(
                  fontFamily: Constants.POPPINS,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Styles.tourpreview_colordescription(themeChange.darkTheme, context),
                ),
                textAlign: TextAlign.left),
          ),
        )
      ],
    );
  }
}
