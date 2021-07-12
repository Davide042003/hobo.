import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/add_tour/descriptionnewtour_widget.dart';
import 'package:hobo_test/widgets/add_tour/inputfieldnewtour_widget.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/provider/newtour_provider.dart';

class AddActivity extends StatefulWidget {
  final PageController pageController;

  const AddActivity(this.pageController);

  @override
  _AddActivityState createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {
  final _formKey = GlobalKey<FormState>();

  FocusNode focusNodeDescription;
  FocusNode focusNodePlace;
  FocusNode focusNodePrice;

  @override
  void initState() {
    super.initState();

    focusNodeDescription = FocusNode();

    focusNodeDescription.addListener(() {
      setState(() {
        if (focusNodeDescription.hasFocus) {
          focusNodeDescription.requestFocus();
        } else {
          focusNodeDescription.unfocus();
        }
      });
    });

    focusNodePrice = FocusNode();

    focusNodePrice.addListener(() {
      setState(() {
        if (focusNodePrice.hasFocus) {
          focusNodePrice.requestFocus();
        } else {
          focusNodePrice.unfocus();
        }
      });
    });

    focusNodePlace = FocusNode();

    focusNodePlace.addListener(() {
      setState(() {
        if (focusNodePlace.hasFocus) {
          focusNodePlace.requestFocus();
        } else {
          focusNodePlace.unfocus();
        }
      });
    });
  }

  @override
  void dispose() {
    focusNodeDescription.dispose();
    focusNodePrice.dispose();
    focusNodePlace.dispose();

    super.dispose();
  }

  void _trySubmitForm() async {
    final isValid = _formKey.currentState.validate();
    if (isValid) {}
  }

  bool _onlyAdult = false;
  bool _luxury = false;
  String _description = "";
  String _place = "";
  String _price = "";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final addNewTour = Provider.of<NewTourProvider>(context);

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
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
                          vertical: SizeConfig.screenHeight * 0.01),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Container(
                              height: SizeConfig.screenHeight * 0.04,
                              width: SizeConfig.screenWidth * 0.1,
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: SizeConfig.screenHeight * 0.005),
                                    child: Icon(
                                      CustomIcons.backarrow,
                                      color: Styles.publishtour_close(
                                          themeChange.darkTheme, context),
                                      size: 13,
                                    ),
                                  )),
                            ),
                            onTap: () {
                              setState(() {
                                widget.pageController.jumpToPage(3);
                              });
                            },
                          ),
                          SizedBox(width: SizeConfig.screenWidth * 0.1),
                          Container(
                              height: SizeConfig.screenHeight * 0.04,
                              child: Text(
                                "NEW ACTIVITY",
                                style: TextStyle(
                                    fontFamily: Constants.POPPINS,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Styles.whiteblack(
                                        themeChange.darkTheme, context),
                                    letterSpacing: 4),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.015),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.0465,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Description",
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
                      child: DescriptionNewTour(
                          "Description",
                          (value) => _description = value,
                          focusNodeDescription,
                          null),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: _onlyAdult
                                          ? Color.fromRGBO(245, 95, 185, 1)
                                          : Colors.transparent,
                                      border: _onlyAdult
                                          ? null
                                          : Border.all(
                                              color: Styles.publishtour_check(
                                                  themeChange.darkTheme, context),
                                              width: 1)),
                                  child: _onlyAdult
                                      ? Icon(
                                          CustomIcons.check,
                                          size: 9,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                                onTap: () {
                                  setState(() {
                                    if (_onlyAdult == false) {
                                      _onlyAdult = true;
                                    } else {
                                      _onlyAdult = false;
                                    }
                                  });
                                }),
                            SizedBox(
                              width: SizeConfig.screenWidth * 0.025,
                            ),
                            Text(
                              "Only 18+",
                              style: TextStyle(
                                  fontFamily: Constants.POPPINS,
                                  fontSize: 15,
                                  color: Styles.whiteblack(
                                      themeChange.darkTheme, context)),
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth * 0.12,
                            ),
                            GestureDetector(
                                child: Container(
                                  width: SizeConfig.screenWidth * 0.06,
                                  height: SizeConfig.screenHeight * 0.027,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: _luxury
                                          ? Color.fromRGBO(245, 95, 185, 1)
                                          : Colors.transparent,
                                      border: _luxury
                                          ? null
                                          : Border.all(
                                              color: Styles.publishtour_check(
                                                  themeChange.darkTheme, context),
                                              width: 1)),
                                  child: _luxury
                                      ? Icon(
                                          CustomIcons.check,
                                          size: 9,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                                onTap: () {
                                  setState(() {
                                    if (_luxury == false) {
                                      _luxury = true;
                                    } else {
                                      _luxury = false;
                                    }
                                  });
                                }),
                            SizedBox(
                              width: SizeConfig.screenWidth * 0.025,
                            ),
                            Text(
                              "Luxury",
                              style: TextStyle(
                                  fontFamily: Constants.POPPINS,
                                  fontSize: 15,
                                  color: Styles.whiteblack(
                                      themeChange.darkTheme, context)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.05),
                      child: Container(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight * 0.0015,
                        color: Styles.tourpreview_barlight(
                            themeChange.darkTheme, context),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.0465,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Activity Place",
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
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          FocusScopeNode currentFocus = FocusScope.of(context);

                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          widget.pageController.jumpToPage(8);
                        });
                      },
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.0465,
                          ),
                          child: Theme(
                            data: new ThemeData(
                              primaryColor: Color.fromRGBO(116, 142, 243, 1),
                              hintColor: Styles.loginregister_subheadingandform(
                                  themeChange.darkTheme, context),
                            ),
                            child: Container(
                              width: SizeConfig.screenWidth,
                              height: SizeConfig.screenHeight * 0.055,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5)),
                                color: Styles.publishtour_backgroundinputfield(
                                    themeChange.darkTheme, context),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                      SizeConfig.screenWidth * 0.035,
                                      vertical:
                                      SizeConfig.screenHeight * 0.015),
                                  child: Text(
                                    addNewTour.tourPlaceNameActivity.isNotEmpty
                                        ? addNewTour.tourPlaceNameActivity
                                        : "Activity Place",
                                    style: TextStyle(
                                      fontFamily: Constants.POPPINS,
                                      fontSize: 15,
                                      color: addNewTour.tourPlaceNameActivity.isNotEmpty
                                          ? Styles.whiteblack(
                                          themeChange.darkTheme, context)
                                          : Styles.publishtour_hintText(
                                          themeChange.darkTheme, context),
                                    ),
                                  )),
                            ),
                          )),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.0465,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Price per person",
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
                      child: Row(
                        children: [
                          Container(
                            width: SizeConfig.screenWidth * 0.1,
                            height: SizeConfig.screenHeight * 0.055,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: Styles.publishtour_backgroundinputfield(
                                  themeChange.darkTheme, context),
                            ),
                            child: Center(
                              child: Text("\$", style: TextStyle(
                                fontFamily: Constants.POPPINS,
                                fontSize: 20,
                                color: Styles.whiteblack(themeChange.darkTheme, context)
                              ),),
                            ),
                          ),
                          SizedBox(width: SizeConfig.screenWidth * 0.01,),
                          Expanded(
                            child: InputFieldNewTour("Price per person",
                                (value) => _price = value, focusNodePrice, null, true, null),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.05),
                      child: Container(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight * 0.0015,
                        color: Styles.tourpreview_barlight(
                            themeChange.darkTheme, context),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.04),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.27),
                      child: GestureDetector(
                        onTap: (){
                          saveStep4(addNewTour);
                          // todo: _trySubmitForm doesn't work
                          _trySubmitForm();
                          widget.pageController.jumpToPage(3);
                        },
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
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                    fontFamily: Constants.POPPINS,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.015,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void saveStep4 (NewTourProvider newTourProvider) {
    newTourProvider.setActivityDescription = _description;
    newTourProvider.setOnly18 = _onlyAdult;
    newTourProvider.setLuxury = _luxury;
    newTourProvider.setPrice = _price;

    newTourProvider.createActivity();

    newTourProvider.initVariablesStep4Save();

    print(newTourProvider.activityDescription);
    print(newTourProvider.only18);
    print(newTourProvider.luxury);
    print(newTourProvider.price);
  }
}
