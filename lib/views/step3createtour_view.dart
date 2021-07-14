import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/provider/navigationbar_provider.dart';
import 'package:hobo_test/widgets/provider/newtour_provider.dart';
import 'package:simple_time_range_picker/simple_time_range_picker.dart';

class Step3CreateTour extends StatefulWidget {
  final PageController pageController;

  const Step3CreateTour(this.pageController);

  @override
  _Step3CreateTourState createState() => _Step3CreateTourState();
}

class _Step3CreateTourState extends State<Step3CreateTour> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _trySubmitForm() async {
    if (date != null && timeStart != null && timeEnd != null) {
      widget.pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  Timestamp nextTour;
  String _tourDate = "";
  String _tourTime = "";
  String dateInString;
  DateTime date;
  String timeStartInString;
  TimeOfDay timeStart;
  String timeEndInString;
  TimeOfDay timeEnd;

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
              margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight * 0.025),
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
                          "Date and Time",
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.0465,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            child: Container(
                              width: SizeConfig.screenWidth * 0.41,
                              height: SizeConfig.screenHeight * 0.06,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  color: Styles.tourpreview_peopleunselected(
                                      themeChange.darkTheme, context)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.screenWidth * 0.04,
                                    vertical: SizeConfig.screenHeight * 0.001),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        date == null
                                            ? "Select Date"
                                            : "$dateInString",
                                        style: TextStyle(
                                            fontFamily: Constants.POPPINS,
                                            fontSize: 16,
                                            color:
                                                Styles.publishtour_dateandtime(
                                                    themeChange.darkTheme,
                                                    context)),
                                      ),
                                      Icon(CustomIcons.calendaricon,
                                          color: Styles.publishtour_dateandtime(
                                              themeChange.darkTheme, context),
                                          size: 20)
                                    ]),
                              ),
                            ),
                            onTap: () async {
                              final datePick = await showDatePicker(
                                  context: context,
                                  initialDate: new DateTime.now(),
                                  firstDate: new DateTime.now(),
                                  lastDate:
                                      new DateTime(DateTime.now().year + 1));
                              if (datePick != null) {
                                setState(() {
                                  date = datePick;
                                  // put it here
                                  dateInString =
                                      "${date.month}/${date.day}/${date.year}";
                                  print(dateInString);

                                });
                              }
                            }),
                        GestureDetector(
                            child: Container(
                              width: SizeConfig.screenWidth * 0.41,
                              height: SizeConfig.screenHeight * 0.06,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  color: Styles.tourpreview_peopleunselected(
                                      themeChange.darkTheme, context)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.screenWidth * 0.04,
                                    vertical:
                                        SizeConfig.screenHeight * 0.001),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        timeStart != null && timeEnd != null
                                            ? "$timeStartInString - $timeEndInString"
                                            : "Time",
                                        style: TextStyle(
                                            fontFamily: Constants.POPPINS,
                                            fontSize: 16,
                                            color: Styles
                                                .publishtour_dateandtime(
                                                    themeChange.darkTheme,
                                                    context)),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Icon(
                                        CustomIcons.clockicon,
                                        color: Styles.publishtour_dateandtime(
                                            themeChange.darkTheme, context),
                                        size: 20,
                                      )
                                    ]),
                              ),
                            ),
                            onTap: () async {
                              TimeRangePicker.show(
                                context: context,
                                unSelectedEmpty: true,
                                autoAdjust: true,
                                startTime: TimeOfDay.now(),
                                endTime: TimeOfDay(hour: 00, minute: 00),
                                headerDefaultStartLabel: "START",
                                headerDefaultEndLabel: "END",
                                onSubmitted: (TimeRangeValue value) {
                                  setState(() {
                                    timeStart = value.startTime;
                                    timeEnd = value.endTime;


                                    timeStartInString =
                                        MaterialLocalizations.of(context).formatTimeOfDay(timeStart, alwaysUse24HourFormat: true);
                                    print(timeStartInString);

                                    timeEndInString = MaterialLocalizations.of(context).formatTimeOfDay(timeEnd, alwaysUse24HourFormat: true);
                                    print(timeEndInString);
                                  });
                                },
                              );
                            }),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.05),
                    child: GestureDetector(
                      onTap: null,
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
                            onPressed: () {
                              _trySubmitForm();
                              continueStep3(addNewTour);
                            },
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

  void continueStep3(NewTourProvider newTourProvider) {
    newTourProvider.setTourDate = dateInString;
    newTourProvider.setTourTimeStart = timeStartInString;
    newTourProvider.setTourTimeEnd = timeEndInString;

    print(newTourProvider.tourDate);
    print(newTourProvider.tourTimeStart);
    print(newTourProvider.tourTimeEnd);
  }

  Column _headerStep(DarkThemeProvider themeChange, BuildContext context,
      NewTourProvider addNewTour, NavigationBarProvider downScroll) {
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
                        color:
                            Styles.whiteblack(themeChange.darkTheme, context)),
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
                    addNewTour.initVariables();
                    Navigator.pop(context);
                  });
                },
              ))
            ],
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.03),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.085),
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
                color: Styles.publishtour_bar(themeChange.darkTheme, context),
              ),
              SizedBox(width: SizeConfig.screenWidth * 0.01),
              CircleAvatar(
                radius: SizeConfig.screenWidth * 0.016,
                backgroundColor:
                    Styles.publishtour_bar(themeChange.darkTheme, context),
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
                backgroundColor:
                    Styles.publishtour_bar(themeChange.darkTheme, context),
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
                    color: Styles.whiteblack(themeChange.darkTheme, context)),
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
          color: Styles.tourpreview_barlight(themeChange.darkTheme, context),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.015),
      ],
    );
  }
}
