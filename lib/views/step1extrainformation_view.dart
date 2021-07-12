import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/add_tour/inputfieldnewtour_widget.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/provider/navigationbar_provider.dart';
import 'package:hobo_test/widgets/provider/newtour_provider.dart';

class Step1ExtraInformation extends StatefulWidget {
  final PageController pageController;

  const Step1ExtraInformation(this.pageController);

  @override
  _Step1ExtraInformationState createState() => _Step1ExtraInformationState();
}

class _Step1ExtraInformationState extends State<Step1ExtraInformation> {
  final _formKey = GlobalKey<FormState>();

  FocusNode focusNodeName;
  FocusNode focusNodeSurname;
  FocusNode focusNodeGender;
  FocusNode focusNodeContinue;

  @override
  void initState() {
    super.initState();

    _selectedGender = _gender[0];

    focusNodeName = FocusNode();
    focusNodeSurname = FocusNode();
    focusNodeContinue = FocusNode();
    focusNodeGender = FocusNode();

    focusNodeName.addListener(() {
      setState(() {
        if (focusNodeName.hasFocus) {
          focusNodeName.requestFocus();
        } else {
          focusNodeName.unfocus();
        }
      });
    });

    focusNodeSurname.addListener(() {
      setState(() {
        if (focusNodeSurname.hasFocus) {
          focusNodeSurname.requestFocus();
        } else {
          focusNodeSurname.unfocus();
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

    focusNodeGender.addListener(() {
      setState(() {
        if (focusNodeGender.hasFocus) {
          focusNodeGender.requestFocus();
        } else {
          focusNodeGender.unfocus();
        }
      });
    });
  }

  @override
  void dispose() {
    focusNodeName.dispose();
    focusNodeSurname.dispose();
    focusNodeContinue.dispose();
    focusNodeGender.dispose();

    super.dispose();
  }


  void _trySubmitForm() async {
    final isValid = _formKey.currentState.validate();
    if (isValid && birthDate!= null && _selectedGender != null) {
      widget.pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  String _name = '';
  String _surname = '';
  List<String> _gender = ['Male', 'Female', 'Not specified'];
  String _selectedGender = "";
  String birthDateInString;
  DateTime birthDate;

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
                    _headerStep(themeChange, context, addNewTour, downScroll),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.0465,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Name",
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
                          "Name",
                              (value) => _name = value,
                          focusNodeName,
                          focusNodeSurname, false, null),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.0465,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Surname",
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
                          "Surname",
                              (value) => _surname = value,
                          focusNodeSurname,
                          null, false, null),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.0465,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Date of Birth",
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Container(
                              width: SizeConfig.screenWidth * 0.5,
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
                                        birthDate == null ? "Select Date" : "$birthDateInString",
                                        style: TextStyle(
                                            fontFamily: Constants.POPPINS,
                                            fontSize: 16,
                                            color:  birthDate == null ? Styles.publishtour_hintText(themeChange.darkTheme, context) : Styles.whiteblack(themeChange.darkTheme, context)),
                                      ),
                                      Icon(CustomIcons.calendaricon,
                                          color: Styles.publishtour_hintText(themeChange.darkTheme, context),
                                          size: 20)
                                    ]),
                              ),
                            ),
                              onTap: ()async {
                                final datePick = await showDatePicker(
                                    context: context,
                                    initialDate: new DateTime.now(),
                                    firstDate: new DateTime(1900),
                                    lastDate: new DateTime(2100)
                                );
                                if (datePick != null) {
                                  setState(() {
                                    birthDate = datePick;

                                    // put it here
                                    birthDateInString =
                                    "${birthDate.month}/${birthDate
                                        .day}/${birthDate.year}"; // 08/14/2019
                                    print(birthDateInString);
                                  });
                                }
                              }
                          ),
                        ],
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
                            "Gender",
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
                                      width: SizeConfig.screenWidth * 0.4,
                                      height: SizeConfig.screenHeight* 0.055,
                                      decoration: BoxDecoration(
                                        color: Styles.publishtour_backgroundinputfield(themeChange.darkTheme, context),
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.025, right: SizeConfig.screenWidth * 0.035),
                                          child: DropdownButton<String>(
                                            isExpanded: true,
                                            isDense: true,
                                            icon: Icon(CustomIcons.arrowdownlanguages,size: 5.5, color: Styles.whiteblack(themeChange.darkTheme, context),),
                                            value: _selectedGender,
                                            underline: SizedBox(),
                                            items: _gender.map((String val) {
                                              return new DropdownMenuItem<String>(
                                                value: val,
                                                child: Container(
                                                  child: Text(val, style: TextStyle(fontFamily: Constants.POPPINS,
                                                      fontSize: 15,
                                                      color: Styles.whiteblack(themeChange.darkTheme, context))),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (newVal) {
                                              _selectedGender = newVal;
                                              setState(() {});
                                            }, dropdownColor: Styles.publishtour_backgroundinputfield(themeChange.darkTheme, context),
                                            focusNode: focusNodeGender,),
                                        ),
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
