import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/add_tour/searchbaradd_widget.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/provider/tour_provider.dart';

class ChoosePlace extends StatefulWidget {
  final PageController pageController;

  ChoosePlace(this.pageController);

  @override
  _ChoosePlaceState createState() => _ChoosePlaceState();
}

class _ChoosePlaceState extends State<ChoosePlace> {

  FocusNode focusNodePlace;
  TextEditingController controllerText = new TextEditingController();

  @override
  void initState() {
    super.initState();

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
    focusNodePlace.dispose();

    super.dispose();
  }

  void changePage(){
    widget.pageController.jumpToPage(0);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final addNewTour = Provider.of<TourProvider>(context);

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
                                      bottom:
                                          SizeConfig.screenHeight * 0.005),
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
                              widget.pageController.jumpToPage(0);
                              FocusScopeNode currentFocus = FocusScope.of(context);

                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                            });
                          },
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.1),
                        Container(
                            height: SizeConfig.screenHeight * 0.04,
                            child: Text(
                              "CHOOSE PLACE",
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
                  SizedBox(height: SizeConfig.screenHeight * 0.01,),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.0465,
                    ),
                    child: SearchBarAddWidget(focusNodePlace, controllerText, changePage, 1),
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
    );
  }
}
