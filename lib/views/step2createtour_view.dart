import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/add_tour/descriptionnewtour_widget.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/provider/navigationbar_provider.dart';
import 'package:hobo_test/widgets/provider/tour_provider.dart';
import 'package:flag/flag.dart';

class Step2CreateTour extends StatefulWidget {
  final PageController pageController;

  const Step2CreateTour(this.pageController);

  @override
  _Step2CreateTourState createState() => _Step2CreateTourState();
}

class _Step2CreateTourState extends State<Step2CreateTour> {
  final _formKey = GlobalKey<FormState>();

  FocusNode focusNodeDescription;
  FocusNode focusNodeLanguage;

  final descriptionStep2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _selectedLocation = _locations[0];

    focusNodeLanguage = FocusNode();

    focusNodeLanguage.addListener(() {
      setState(() {
        if (focusNodeLanguage.hasFocus) {
          focusNodeLanguage.requestFocus();
        } else {
          focusNodeLanguage.unfocus();
        }
      });
    });

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
  }

  @override
  void dispose() {
    focusNodeDescription.dispose();
    focusNodeLanguage.dispose();

    //descriptionStep2Controller.dispose();

    super.dispose();
  }

  void _trySubmitForm() async {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      widget.pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  List<String> _locations = ['us', 'it', 'es', 'fr'];

  String _tourImage1 = "";
  String _tourImage2 = "";
  String _tourImage3 = "";
  String _selectedLocation = "";
  String _description = '';
  String _language = "";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final addNewTour = Provider.of<TourProvider>(context);
    final downScroll = Provider.of<NavigationBarProvider>(context);

    descriptionStep2Controller.value = addNewTour.tourDescription.isNotEmpty
        ? TextEditingValue(
      text: addNewTour.tourDescription,
      selection: TextSelection.fromPosition(
        TextPosition(offset: addNewTour.tourDescription.length),
      ),
    )
        : TextEditingValue(text: "");

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
                            "Images",
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
                        height: SizeConfig.screenHeight * 0.105,
                        child: ListView.separated(
                          padding: EdgeInsets.only(
                              left: SizeConfig.screenWidth * 0.05),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            if (i == 0) {
                              return GestureDetector(
                                onTap: () {
                                  addTourImages(addNewTour, "www.provaUrl.com");
                                },
                                child: Container(
                                  width: SizeConfig.screenWidth * 0.23,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(
                                          color:
                                              Color.fromRGBO(116, 142, 243, 1),
                                          width: 1),
                                      color: Colors.transparent),
                                  child: Center(
                                      child: Text(
                                    "+",
                                    style: TextStyle(
                                        fontFamily: Constants.POPPINS,
                                        fontSize: 43,
                                        color:
                                            Color.fromRGBO(116, 142, 243, 1)),
                                  )),
                                ),
                              );
                            } else {
                              return Container(
                                width: SizeConfig.screenWidth * 0.23,
                                height: SizeConfig.screenHeight,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Colors.grey,
                                ),
                              );
                            }
                          },
                          separatorBuilder: (context, i) =>
                              SizedBox(width: SizeConfig.screenWidth * 0.05),
                        )),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
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
                    SizedBox(height: SizeConfig.screenHeight * 0.015),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.0465,
                      ),
                      child: DescriptionNewTour("Description", (value) {
                        _description = value;
                      }, focusNodeDescription, null,
                          descriptionStep2Controller),
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
                            "Language",
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
                                        color: Styles
                                            .publishtour_backgroundinputfield(
                                                themeChange.darkTheme, context),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left:
                                                SizeConfig.screenWidth * 0.015,
                                            right:
                                                SizeConfig.screenWidth * 0.035),
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          icon: Icon(
                                            CustomIcons.arrowdownlanguages,
                                            size: 5.5,
                                            color: Styles.whiteblack(
                                                themeChange.darkTheme, context),
                                          ),
                                          value: _selectedLocation,
                                          underline: SizedBox(),
                                          items: _locations.map((String val) {
                                            return new DropdownMenuItem<String>(
                                              value: val,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                child: Container(

                                                  height:
                                                      SizeConfig.screenHeight *
                                                          0.045,
                                                  width:
                                                      SizeConfig.screenWidth *
                                                          0.15,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (newVal) {
                                            _selectedLocation = newVal;
                                            setState(() {});
                                          },
                                          dropdownColor: Styles
                                              .publishtour_backgroundinputfield(
                                                  themeChange.darkTheme,
                                                  context),
                                          focusNode: focusNodeLanguage,
                                        ),
                                      )))),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
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
                                continueStep2(addNewTour);
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
      ),
    );
  }

  void addTourImages(TourProvider newTourProvider, String imageUrl) {
    newTourProvider.setTourImages = imageUrl;
  }

  void continueStep2(TourProvider newTourProvider) {
    newTourProvider.setTourDescription = _description;
    newTourProvider.setTourLanguage = _language;

    newTourProvider.publishTourStep2();


    print(newTourProvider.tourDescription);
    print(newTourProvider.tourLanguage);
  }

  Column _headerStep(DarkThemeProvider themeChange, BuildContext context,
      TourProvider addNewTour, NavigationBarProvider downScroll) {
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
                    //addNewTour.initVariables();
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
                    color: Styles.whiteblack(themeChange.darkTheme, context)),
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
          color: Styles.tourpreview_barlight(themeChange.darkTheme, context),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.015),
      ],
    );
  }
}
