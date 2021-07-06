import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/provider/navigationbar_provider.dart';
import 'package:hobo_test/widgets/provider/newtour_provider.dart';
import 'package:flag/flag.dart';

class Step2ExtraInformation extends StatefulWidget {
  final PageController pageController;

  const Step2ExtraInformation(this.pageController);

  @override
  _Step2ExtraInformationState createState() => _Step2ExtraInformationState();
}

class _Step2ExtraInformationState extends State<Step2ExtraInformation> {
  FocusNode focusNodeNationality;

  @override
  void initState() {
    super.initState();

    _selectedNationality = _nations[0];

    focusNodeNationality = FocusNode();

    focusNodeNationality.addListener(() {
      setState(() {
        if (focusNodeNationality.hasFocus) {
          focusNodeNationality.requestFocus();
        } else {
          focusNodeNationality.unfocus();
        }
      });
    });

  }

  @override
  void dispose() {
    focusNodeNationality.dispose();

    super.dispose();
  }


  void _trySubmitForm() async {
    if (_selectedNationality != null) {
      widget.pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  bool _certifiedGuide = false;
  List<String> _nations = ['us', 'it', 'es', 'fr'];
  String _selectedNationality = "";

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
                  SizedBox(height: SizeConfig.screenHeight * 0.01,),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.0465,
                    ),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Certified Guide",
                            style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Styles.whiteblack(
                                  themeChange.darkTheme, context)),
                          ),
                          GestureDetector(
                              child: Container(
                                width: SizeConfig.screenWidth * 0.1,
                                height: SizeConfig.screenHeight * 0.045,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                    color: _certifiedGuide
                                        ? Color.fromRGBO(245, 95, 185, 1)
                                        : Colors.transparent,
                                    border: _certifiedGuide
                                        ? null
                                        : Border.all(
                                        color: Styles.publishtour_check(
                                            themeChange.darkTheme, context),
                                        width: 1)),
                                child: _certifiedGuide
                                    ? Icon(
                                  CustomIcons.check,
                                  size: 12,
                                  color: Colors.white,
                                )
                                    : null,
                              ),
                              onTap: () {
                                setState(() {
                                  if (_certifiedGuide == false) {
                                    _certifiedGuide = true;
                                  } else {
                                    _certifiedGuide = false;
                                  }
                                });
                              }),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.0465,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Nationality",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Styles.whiteblack(
                                  themeChange.darkTheme, context)),
                        ),
                        Expanded(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    width: SizeConfig.screenWidth * 0.25,
                                    decoration: BoxDecoration(
                                      color: Styles.publishtour_backgroundinputfield(themeChange.darkTheme, context),
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.015, right: SizeConfig.screenWidth * 0.035),
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        icon: Icon(CustomIcons.arrowdownlanguages,size: 5.5, color: Styles.whiteblack(themeChange.darkTheme, context),),
                                        value: _selectedNationality,
                                        underline: SizedBox(),
                                        items: _nations.map((String val) {
                                          return new DropdownMenuItem<String>(
                                            value: val,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                              child: Flag(
                                                val,
                                                height: SizeConfig.screenHeight * 0.045,
                                                width: SizeConfig.screenWidth * 0.15,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (newVal) {
                                          _selectedNationality = newVal;
                                          setState(() {});
                                        }, dropdownColor: Styles.publishtour_backgroundinputfield(themeChange.darkTheme, context),
                                        focusNode: focusNodeNationality,),
                                    )
                                ))),
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

  Column _headerStep(DarkThemeProvider themeChange, BuildContext context, NewTourProvider addNewTour, NavigationBarProvider downScroll) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: SizeConfig.screenHeight * 0.04,
                  child: Text(
                    "Let's Add Extra Information",
                    style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Styles.whiteblack(
                            themeChange.darkTheme, context)),
                  )),
            ],
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.03),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 0.085),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
            ],
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.013),
        Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.screenWidth * 0.02,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    color: Styles.whiteblack(
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
