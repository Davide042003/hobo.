import 'package:flutter/material.dart';
import 'package:hobo_test/views/step2createtour_view.dart';
import 'package:hobo_test/widgets/add_tour/inputfieldnewtour_widget.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/login_register/inputFieldStandard_widget.dart';
import 'package:hobo_test/widgets/provider/navigationbar_provider.dart';
import 'package:hobo_test/widgets/provider/newtour_provider.dart';

class Step1CreateTour extends StatefulWidget {
  @override
  _Step1CreateTourState createState() => _Step1CreateTourState();
}

class _Step1CreateTourState extends State<Step1CreateTour> {
  final _formKey = GlobalKey<FormState>();

  FocusNode focusNodeTourName;
  FocusNode focusNodeTourPlace;
  FocusNode focusNodeMaxPeople;
  FocusNode focusNodeContinue;

  @override
  void initState() {
    super.initState();

    focusNodeTourName = FocusNode();
    focusNodeTourPlace = FocusNode();
    focusNodeMaxPeople = FocusNode();
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

    focusNodeMaxPeople.addListener(() {
      setState(() {
        if (focusNodeMaxPeople.hasFocus) {
          focusNodeMaxPeople.requestFocus();
        } else {
          focusNodeMaxPeople.unfocus();
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
    focusNodeMaxPeople.dispose();
    focusNodeContinue.dispose();

    super.dispose();
  }

  void _trySubmitForm() async {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Step2CreateTour()),
      );
    }
  }

  String _tourName = '';
  String _tourPlace = '';
  String _maxPeople = '';
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
                              color: Styles.whiteblack(themeChange.darkTheme, context)),
                            )),
                        Expanded(
                            child: GestureDetector(
                          child: Container(
                            height: SizeConfig.screenHeight * 0.04,
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  CustomIcons.close,
                                  color: Styles.publishtour_close(themeChange.darkTheme, context),
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
                          color: Styles.publishtour_bar(themeChange.darkTheme, context),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
                        CircleAvatar(
                          radius: SizeConfig.screenWidth * 0.016,
                          backgroundColor: Styles.publishtour_bar(themeChange.darkTheme, context),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
                        Container(
                          width: SizeConfig.screenWidth * 0.13,
                          height: SizeConfig.screenHeight * 0.006,
                          color: Styles.publishtour_bar(themeChange.darkTheme, context),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
                        CircleAvatar(
                          radius: SizeConfig.screenWidth * 0.016,
                          backgroundColor: Styles.publishtour_bar(themeChange.darkTheme, context),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
                        Container(
                          width: SizeConfig.screenWidth * 0.13,
                          height: SizeConfig.screenHeight * 0.006,
                          color: Styles.publishtour_bar(themeChange.darkTheme, context),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
                        CircleAvatar(
                          radius: SizeConfig.screenWidth * 0.016,
                          backgroundColor: Styles.publishtour_bar(themeChange.darkTheme, context),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
                        Container(
                          width: SizeConfig.screenWidth * 0.13,
                          height: SizeConfig.screenHeight * 0.006,
                          color: Styles.publishtour_bar(themeChange.darkTheme, context),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
                        CircleAvatar(
                          radius: SizeConfig.screenWidth * 0.016,
                          backgroundColor: Styles.publishtour_bar(themeChange.darkTheme, context),
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
                          color: Styles.whiteblack(themeChange.darkTheme, context)),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.09),
                        Text(
                          "Step 2",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 12,
                          color: Styles.publishtour_inactive(themeChange.darkTheme, context)),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.085),
                        Text(
                          "Step 3",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 12, color: Styles.publishtour_inactive(themeChange.darkTheme, context)),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.085),
                        Text(
                          "Step 4",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 12, color: Styles.publishtour_inactive(themeChange.darkTheme, context)),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.085),
                        Text(
                          "Step 5",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 12, color: Styles.publishtour_inactive(themeChange.darkTheme, context)),
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
                            color: Styles.whiteblack(themeChange.darkTheme, context)
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.0465,
                    ),
                    child: InputFieldNewTour("Tour name", (value) => _tourName = value, focusNodeTourName, focusNodeTourPlace),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.015),
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
                              color: Styles.whiteblack(themeChange.darkTheme, context)
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.0465,
                    ),
                    child: InputFieldNewTour("Tour place", (value) => _tourPlace = value, focusNodeTourName, focusNodeTourPlace),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.05),
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
                            boxShadow: [
                              themeChange.darkTheme
                                  ? BoxShadow()
                                  : BoxShadow(
                                      color: Color.fromRGBO(62, 109, 255, 0.39),
                                      offset: Offset(0, 9),
                                      blurRadius: 15)
                            ],
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
