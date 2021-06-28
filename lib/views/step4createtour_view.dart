import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/views/step5createtour_view.dart';
import 'package:hobo_test/widgets/add_tour/cardtouradd_widget.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/provider/navigationbar_provider.dart';
import 'package:hobo_test/widgets/provider/newtour_provider.dart';

class Step4CreateTour extends StatefulWidget {
  final PageController pageController;

  const Step4CreateTour(this.pageController);

  @override
  _Step4CreateTourState createState() => _Step4CreateTourState();
}

class _Step4CreateTourState extends State<Step4CreateTour> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _trySubmitForm() {
    widget.pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final addNewTour = Provider.of<NewTourProvider>(context);
    final downScroll = Provider.of<NavigationBarProvider>(context);

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
              margin:
                  EdgeInsets.symmetric(vertical: SizeConfig.screenHeight * 0.025),
              child: Column(
                children: [
                  _headerStep(themeChange, context, addNewTour, downScroll),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.0465,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Activities",
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
                  SizedBox(height: SizeConfig.screenHeight * 0.015),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: SizeConfig.screenHeight * 0.4
                    ),
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.05),
                      child: ListView.separated(
                        itemCount: 1,
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, i) {
                          if (i == 0) {
                            return GestureDetector(
                              child: Container(
                                width: SizeConfig.screenWidth * 0.86,
                                height: SizeConfig.screenHeight * 0.064,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        color: Color.fromRGBO(116, 142, 243, 1),
                                        width: 1),
                                    color: Colors.transparent),
                                child: Center(
                                    child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(116, 142, 243, 1)),
                                )),
                              ),
                              onTap: () {
                                widget.pageController.jumpToPage(5);
                              },
                            );
                          } else {
                            return CardTourAddWidget();
                          }
                        },
                        separatorBuilder: (context, i) =>
                            SizedBox(height: SizeConfig.screenHeight * 0.02),
                      )),
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.05),
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.065,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius:SizeConfig.screenWidth * 0.065,
                          backgroundColor:Styles.publishtour_noacitivity(themeChange.darkTheme, context),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.05,),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight * 0.0065),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(width: SizeConfig.screenWidth * 0.4,height: SizeConfig.screenHeight * 0.01,color:Styles.publishtour_noacitivity(themeChange.darkTheme, context),),
                              Container(width: SizeConfig.screenWidth * 0.3,height: SizeConfig.screenHeight * 0.01,color:Styles.publishtour_noacitivity(themeChange.darkTheme, context)),
                              Container(width: SizeConfig.screenWidth * 0.2, height: SizeConfig.screenHeight * 0.01,color:Styles.publishtour_noacitivity(themeChange.darkTheme, context)),
                            ],
                          ),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.14,),
                        Container(margin: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight * 0.01),width: SizeConfig.screenWidth * 0.11,height: SizeConfig.screenHeight * 0.1, color:Styles.publishtour_noacitivity(themeChange.darkTheme, context),)
                      ],
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
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

  Column _headerStep(DarkThemeProvider themeChange, BuildContext context, NewTourProvider addNewTour, NavigationBarProvider downScroll) {
    return Column(
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
                              Navigator.pop(context);
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
                          color: Color.fromRGBO(245, 95, 185, 1),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
                        CircleAvatar(
                          radius: SizeConfig.screenWidth * 0.016,
                          backgroundColor: Color.fromRGBO(245, 95, 185, 1),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
                        Container(
                          width: SizeConfig.screenWidth * 0.13,
                          height: SizeConfig.screenHeight * 0.006,
                          color: Color.fromRGBO(245, 95, 185, 1),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
                        CircleAvatar(
                          radius: SizeConfig.screenWidth * 0.016,
                          backgroundColor: Color.fromRGBO(245, 95, 185, 1),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
                        Container(
                          width: SizeConfig.screenWidth * 0.13,
                          height: SizeConfig.screenHeight * 0.006,
                          color: Color.fromRGBO(245, 95, 185, 1),
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.01),
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
                              color: Styles.publishtour_inactive(
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
                              color: Styles.whiteblack(
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
                ],
              );
  }
}
