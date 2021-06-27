import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hobo_test/views/step2createtour_view.dart';
import 'package:hobo_test/widgets/add_tour/counter_widget.dart';
import 'package:hobo_test/widgets/add_tour/inputfieldnewtour_widget.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/login_register/inputFieldStandard_widget.dart';
import 'package:hobo_test/widgets/provider/navigationbar_provider.dart';
import 'package:hobo_test/widgets/provider/newtour_provider.dart';

class Step1CreateTour extends StatefulWidget {
  final PageController pageController;

  const Step1CreateTour(this.pageController);

  @override
  _Step1CreateTourState createState() => _Step1CreateTourState();
}

class _Step1CreateTourState extends State<Step1CreateTour> {
  final _formKey = GlobalKey<FormState>();

  FocusNode focusNodeTourName;
  FocusNode focusNodeTourPlace;
  FocusNode focusNodeContinue;

  @override
  void initState() {
    super.initState();

    focusNodeTourName = FocusNode();
    focusNodeTourPlace = FocusNode();
    focusNodeContinue = FocusNode();

    focusNodeTourName.addListener(() {
      setState(() {
        if (focusNodeTourName.hasFocus) {
          focusNodeTourName.requestFocus();
        } else {
          focusNodeTourName.unfocus();
        }
      });
    });

    focusNodeTourPlace.addListener(() {
      setState(() {
        if (focusNodeTourPlace.hasFocus) {
          focusNodeTourPlace.requestFocus();
        } else {
          focusNodeTourPlace.unfocus();
        }
      });
    });

    focusNodeContinue.addListener(() {
      setState(() {
        if (focusNodeContinue.hasFocus) {
          focusNodeContinue.requestFocus();
        } else {
          focusNodeContinue.unfocus();
        }
      });
    });
  }

  @override
  void dispose() {
    focusNodeTourName.dispose();
    focusNodeTourPlace.dispose();
    focusNodeContinue.dispose();

    super.dispose();
  }

   void _updateCounter(int value) {
    setState(() {
      _maxPeople = value;
    });
  }

  void _trySubmitForm() async {
    final isValid = _formKey.currentState.validate();
    if (isValid && _maxPeople>0) {
       widget.pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  String _tourName = '';
  String _tourPlace = '';
  int _maxPeople = 0;
  bool _allowChildren = false;
  bool _private = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final addNewTour = Provider.of<NewTourProvider>(context);
    final downScroll = Provider.of<NavigationBarProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(
          vertical: SizeConfig.screenHeight * 0.14,
          horizontal: SizeConfig.screenWidth * 0.035),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Styles.publishtour_background(themeChange.darkTheme, context),
      ),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(bottom: bottom),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight * 0.025),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.05,
                    ),
                    child: Row(
                      children: [
                        Container(
                            height: SizeConfig.screenHeight * 0.04,
                            child: Text(
                              "Let's Publish a New Tour",
                              style: TextStyle(
                                  fontFamily: Constants.POPPINS,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Styles.whiteblack(
                                      themeChange.darkTheme, context)),
                            )),
                        Expanded(
                            child: GestureDetector(
                          child: Container(
                            height: SizeConfig.screenHeight * 0.04,
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  CustomIcons.close,
                                  color: Styles.publishtour_close(
                                      themeChange.darkTheme, context),
                                  size: 22,
                                )),
                          ),
                          onTap: () {
                            setState(() {
                              addNewTour.addNewTourVisible = false;
                              downScroll.navigationdown = false;
                            });
                          },
                        ))
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.085),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: SizeConfig.screenWidth * 0.016,
                          backgroundColor: Color.fromRGBO(245, 95, 185, 1),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
                        Container(
                          width: SizeConfig.screenWidth * 0.13,
                          height: SizeConfig.screenHeight * 0.006,
                          color: Styles.publishtour_bar(
                              themeChange.darkTheme, context),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
                        CircleAvatar(
                          radius: SizeConfig.screenWidth * 0.016,
                          backgroundColor: Styles.publishtour_bar(
                              themeChange.darkTheme, context),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
                        Container(
                          width: SizeConfig.screenWidth * 0.13,
                          height: SizeConfig.screenHeight * 0.006,
                          color: Styles.publishtour_bar(
                              themeChange.darkTheme, context),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
                        CircleAvatar(
                          radius: SizeConfig.screenWidth * 0.016,
                          backgroundColor: Styles.publishtour_bar(
                              themeChange.darkTheme, context),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
                        Container(
                          width: SizeConfig.screenWidth * 0.13,
                          height: SizeConfig.screenHeight * 0.006,
                          color: Styles.publishtour_bar(
                              themeChange.darkTheme, context),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
                        CircleAvatar(
                          radius: SizeConfig.screenWidth * 0.016,
                          backgroundColor: Styles.publishtour_bar(
                              themeChange.darkTheme, context),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
                        Container(
                          width: SizeConfig.screenWidth * 0.13,
                          height: SizeConfig.screenHeight * 0.006,
                          color: Styles.publishtour_bar(
                              themeChange.darkTheme, context),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
                        CircleAvatar(
                          radius: SizeConfig.screenWidth * 0.016,
                          backgroundColor: Styles.publishtour_bar(
                              themeChange.darkTheme, context),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.013),
                  Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.screenWidth * 0.06,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Step 1",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 12,
                              color: Styles.whiteblack(
                                  themeChange.darkTheme, context)),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.09),
                        Text(
                          "Step 2",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 12,
                              color: Styles.publishtour_inactive(
                                  themeChange.darkTheme, context)),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.085),
                        Text(
                          "Step 3",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 12,
                              color: Styles.publishtour_inactive(
                                  themeChange.darkTheme, context)),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.085),
                        Text(
                          "Step 4",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 12,
                              color: Styles.publishtour_inactive(
                                  themeChange.darkTheme, context)),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.085),
                        Text(
                          "Step 5",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 12,
                              color: Styles.publishtour_inactive(
                                  themeChange.darkTheme, context)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.0015,
                    color: Styles.tourpreview_barlight(
                        themeChange.darkTheme, context),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.015),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.0465,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Tour Name",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Styles.whiteblack(
                                  themeChange.darkTheme, context)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.0465,
                    ),
                    child: InputFieldNewTour(
                        "Tour name",
                        (value) => _tourName = value,
                        focusNodeTourName,
                        focusNodeTourPlace, false),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.0465,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Tour Place",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Styles.whiteblack(
                                  themeChange.darkTheme, context)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.0465,
                    ),
                    child: InputFieldNewTour(
                        "Tour place",
                        (value) => _tourPlace = value,
                        focusNodeTourPlace,
                        null, false),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.0465,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "No. of People",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Styles.whiteblack(
                                  themeChange.darkTheme, context)),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.32),
                        Text(
                          "Children",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 15,
                              color: Styles.whiteblack(themeChange.darkTheme, context)),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.025,
                        ),
                        GestureDetector(
                          child: Container(
                            width: SizeConfig.screenWidth * 0.06,
                            height: SizeConfig.screenHeight * 0.027,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: _allowChildren
                                    ? Color.fromRGBO(245, 95, 185, 1)
                                    : Colors.transparent,
                                border: _allowChildren
                                    ? null
                                    : Border.all(
                                    color: Styles.publishtour_check(themeChange.darkTheme, context),
                                    width: 1)),
                            child: _allowChildren
                                ? Icon(
                              Icons.check,
                              size: 18,
                              color: Colors.white,
                            )
                                : null,
                          ),
                          onTap: () {
                            setState(() {
                              if (_allowChildren == false) {
                                _allowChildren = true;
                              } else {
                                _allowChildren = false;
                              }
                            });
                          }
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.0465,
                      ),
                      child: Row(
                        children: [
                         CounterWidget((value) { _updateCounter(value);})
                        ],
                      )),
                  SizedBox(height: SizeConfig.screenHeight * 0.03,),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.0465,
                    ),
                    child: Container(
                      child: Row(
                        children: [
                          GestureDetector(
                              child: Container(
                                width: SizeConfig.screenWidth * 0.06,
                                height: SizeConfig.screenHeight * 0.027,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: _private
                                        ? Color.fromRGBO(245, 95, 185, 1)
                                        : Colors.transparent,
                                    border: _private
                                        ? null
                                        : Border.all(
                                        color: Color.fromRGBO(213, 213, 213, 1),
                                        width: 1)),
                                child: _private
                                    ? Icon(
                                  Icons.check,
                                  size: 18,
                                  color: Colors.white,
                                )
                                    : null,
                              ),
                              onTap: () {
                                setState(() {
                                  if (_private == false) {
                                    _private = true;
                                  } else {
                                    _private = false;
                                  }
                                });
                              }
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth * 0.025,
                          ),
                          Text(
                            "Private",
                            style: TextStyle(
                                fontFamily: Constants.POPPINS,
                                fontSize: 15,
                                color: Styles.whiteblack(themeChange.darkTheme, context)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.05),
                    child: GestureDetector(
                      onTap: _trySubmitForm,
                      child: Container(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(116, 142, 243, 1),
                                  Color.fromRGBO(36, 65, 187, 1)
                                ]),
                          ),
                          child: TextButton(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Continue",
                                    style: TextStyle(
                                      fontFamily: Constants.POPPINS,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right_outlined,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.015,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
