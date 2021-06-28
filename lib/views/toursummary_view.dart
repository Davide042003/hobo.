import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/home/profileimagehome_widget.dart';
import 'package:hobo_test/widgets/toursummary/info_toursummary.dart';
import 'package:hobo_test/widgets/toursummary/peopleanddate_toursummary.dart';
import 'package:hobo_test/widgets/toursummary/cardchoosetour_toursummary.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class TourSummaryView extends StatefulWidget {
  @override
  _TourSummaryViewState createState() => _TourSummaryViewState();
}

class _TourSummaryViewState extends State<TourSummaryView> {
  bool checkboxValue = false;

  void _onChangedCheck() {
    setState(() {
      checkboxValue ? checkboxValue = false : checkboxValue = true;
    });
  }

  void _openPopUp(bool isDark) {
    showGeneralDialog(
        barrierColor: Styles.toursummary_popupbackground(isDark, context),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Material(
            type: MaterialType.transparency,
            child: Transform(
              transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
              child: Opacity(
                opacity: a1.value,
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: SizeConfig.screenHeight * 0.32,
                      horizontal: SizeConfig.screenWidth * 0.04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Styles.chat_bar(isDark, context),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.05,
                            vertical: SizeConfig.screenHeight * 0.03),
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Container(
                                height: SizeConfig.screenHeight * 0.03,
                                width: SizeConfig.screenWidth * 0.1,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom:
                                              SizeConfig.screenHeight * 0.005),
                                      child: Icon(
                                        CustomIcons.close,
                                        color: Styles.publishtour_close(
                                            isDark, context),
                                        size: 20,
                                      ),
                                    )),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(width: SizeConfig.screenWidth * 0.03),
                            Container(
                                height: SizeConfig.screenHeight * 0.03,
                                child: Text(
                                  "CHANGE VEHICLE",
                                  style: TextStyle(
                                      fontFamily: Constants.POPPINS,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Styles.whiteblack(isDark, context),
                                      letterSpacing: 4),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        width: SizeConfig.screenWidth * 0.3,
                        height: SizeConfig.screenHeight * 0.22,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Styles.toursummary_cardcar(isDark, context),
                            border: Border.all(
                              color: Color.fromRGBO(245, 95, 185, 1),
                            )),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.03,
                              vertical: SizeConfig.screenHeight * 0.0125),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    child: Container(
                                        width: SizeConfig.screenWidth * 0.037,
                                        height:
                                            SizeConfig.screenHeight * 0.0175,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2)),
                                            color: Color.fromRGBO(
                                                245, 95, 185, 1)),
                                        child: Icon(
                                          CustomIcons.check,
                                          size: 7,
                                          color: Styles.blackwhite(
                                              isDark, context),
                                        )),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              Text(
                                "+\$10",
                                style: TextStyle(
                                    fontFamily: Constants.POPPINS,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(193, 193, 193, 1)),
                              ),
                              SizedBox(height: SizeConfig.screenHeight * 0.015,),
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: SizeConfig.screenWidth * 0.08,
                                    backgroundColor: Color.fromRGBO(74, 121, 165, 1),
                                  ),
                                ],
                              ),
                              SizedBox(height: SizeConfig.screenHeight * 0.012,),
                              Text(
                                "Utility Car",
                                style: TextStyle(
                                    fontFamily: Constants.POPPINS,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Styles.toursummary_typecartext(isDark, context)),
                              ),
                              Text(
                                "5 places",
                                style: TextStyle(
                                    fontFamily: Constants.POPPINS,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Styles.publishtour_hintText(isDark, context)),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 400),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.screenHeight * 0.13,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: checkboxValue
                          ? SizeConfig.screenHeight * 0.87
                          : SizeConfig.screenHeight * .8),
                  child: Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 1,
                    color: Styles.loginregister_background(
                        themeChange.darkTheme, context),
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: SizeConfig.screenHeight * 0.1),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.17,
                            ),
                            width: SizeConfig.screenWidth,
                            height: SizeConfig.screenHeight * 0.16,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: SizeConfig.screenWidth * 0.15,
                                      height: SizeConfig.screenHeight * 0.075,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Color.fromRGBO(245, 95, 185, 1)),
                                      child: Icon(
                                        CustomIcons.guide,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    Text(
                                      "Private",
                                      style: TextStyle(
                                          fontFamily: Constants.POPPINS,
                                          fontSize: 15,
                                          color: Styles.whiteblack(
                                              themeChange.darkTheme, context)),
                                    )
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _openPopUp(themeChange.darkTheme);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: SizeConfig.screenWidth * 0.15,
                                        height: SizeConfig.screenHeight * 0.075,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Color.fromRGBO(0, 119, 255, 1)),
                                        child: Icon(
                                          CustomIcons.car,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      Text(
                                        "Vehicle",
                                        style: TextStyle(
                                            fontFamily: Constants.POPPINS,
                                            fontSize: 15,
                                            color: Styles.whiteblack(
                                                themeChange.darkTheme,
                                                context)),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: SizeConfig.screenWidth * 0.15,
                                      height: SizeConfig.screenHeight * 0.075,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Color.fromRGBO(233, 206, 32, .2)),
                                      child: Icon(
                                        CustomIcons.diamond,
                                        color: Color.fromRGBO(233, 206, 32, 1),
                                        size: 25,
                                      ),
                                    ),
                                    Text(
                                      "Luxury",
                                      style: TextStyle(
                                          fontFamily: Constants.POPPINS,
                                          fontSize: 15,
                                          color: Styles.whiteblack(
                                              themeChange.darkTheme, context)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: SizeConfig.screenWidth,
                            height: SizeConfig.screenHeight * 0.0015,
                            color: Styles.tourpreview_barlight(
                                themeChange.darkTheme, context),
                          ),
                          Container(
                            width: SizeConfig.screenWidth,
                            height: SizeConfig.screenHeight * 0.1,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.screenWidth * 0.065,
                                  vertical: SizeConfig.screenHeight * 0.03),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Activities",
                                    style: TextStyle(
                                        fontFamily: Constants.POPPINS,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Styles.whiteblack(
                                            themeChange.darkTheme, context)),
                                  ),
                                  Text(
                                    "6 selected",
                                    style: TextStyle(
                                        fontFamily: Constants.POPPINS,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromRGBO(217, 217, 217, 1)),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: SizeConfig.screenWidth,
                            height: SizeConfig.screenHeight * 0.0015,
                            color: Styles.tourpreview_barlight(
                                themeChange.darkTheme, context),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.screenHeight * 0.035),
                            width: SizeConfig.screenWidth,
                            height: SizeConfig.screenHeight * 0.4,
                            child: CupertinoScrollbar(
                                child: ListView.separated(
                              padding: EdgeInsets.only(
                                  bottom: SizeConfig.screenHeight * 0.03),
                              shrinkWrap: true,
                              primary: false,
                              itemCount: 5,
                              itemBuilder: (ctx, i) => CardChooseTourWidget(),
                              separatorBuilder: (ctx, i) => SizedBox(
                                height: SizeConfig.screenHeight * 0.02,
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 0),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: SizeConfig.screenWidth,
                  height: checkboxValue
                      ? SizeConfig.screenHeight * 0.97
                      : SizeConfig.screenHeight * .9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                    color: Styles.blackwhite(themeChange.darkTheme, context),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.09),
                          blurRadius: 29,
                          offset: Offset(0, 3))
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight * 0.0015,
                        color: Styles.tourpreview_bar(
                            themeChange.darkTheme, context),
                      ),
                      InfoTourSummaryWidget(),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.03,
                      ),
                      Container(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight * 0.0015,
                        color: Styles.tourpreview_bar(
                            themeChange.darkTheme, context),
                      ),
                      PeopleAndDateWidget(checkboxValue, _onChangedCheck)
                    ],
                  ),
                ),
              ]),
            ),
          ),
          Column(
            children: [
              TopBar(themeChange: themeChange),
              FloatingBook(themeChange: themeChange),
            ],
          ),
        ]),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key key,
    @required this.themeChange,
  }) : super(key: key);

  final DarkThemeProvider themeChange;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  CustomIcons.backarrow,
                  color: Styles.whiteblack(themeChange.darkTheme, context),
                  size: 16,
                ),
              ),
            ),
            SizedBox(width: SizeConfig.screenWidth * 0.04),
            Text(
              "Tour Summary",
              style: TextStyle(
                  fontFamily: Constants.POPPINS,
                  color: Styles.whiteblack(themeChange.darkTheme, context),
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
            Container(
                margin: EdgeInsets.only(left: SizeConfig.screenWidth * 0.15),
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
    );
  }
}

class FloatingBook extends StatelessWidget {
  const FloatingBook({
    Key key,
    @required this.themeChange,
  }) : super(key: key);

  final DarkThemeProvider themeChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                        color:
                            Styles.blackwhite(themeChange.darkTheme, context),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
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
                                    color: Styles.tourpreview_datebottom(
                                        themeChange.darkTheme, context)),
                              ),
                              Text("Paris - France",
                                  style: TextStyle(
                                      fontFamily: Constants.POPPINS,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Styles.whiteblack(
                                          themeChange.darkTheme, context))),
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
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        boxShadow: [
                          themeChange.darkTheme
                              ? BoxShadow()
                              : BoxShadow(
                                  color: Color.fromRGBO(62, 109, 255, .39),
                                  blurRadius: 15,
                                  offset: Offset(0, 9))
                        ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
