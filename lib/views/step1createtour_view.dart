import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/add_tour/categoriesselected_widget.dart';
import 'package:hobo_test/widgets/add_tour/counter_widget.dart';
import 'package:hobo_test/widgets/add_tour/inputfieldnewtour_widget.dart';
import 'package:hobo_test/widgets/categories_list.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/home/categories_widget.dart';
import 'package:hobo_test/widgets/provider/navigationbar_provider.dart';
import 'package:hobo_test/widgets/provider/tour_provider.dart';

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

  final tourNameController = TextEditingController();

  List<CategoriesSelectedWidget> _selectedTags = [];
  List<CategoriesWidget> _nonSelectedTags = CategoriesList().tags;

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
    tourNameController.dispose();

    super.dispose();
  }

  void _updateCounter(int value, TourProvider newTourProvider) {
    setState(() {
      _maxPeople = value;
      newTourProvider.setNumberOfPeople = _maxPeople;
    });
  }

  void _trySubmitForm() async {
    final isValid = _formKey.currentState.validate();
    print("is valid $isValid");
    if (isValid && _maxPeople > 0 && _selectedTags.length > 0 && _tourPlaceId != null) {
      widget.pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  String _tourName = '';
  String _tourPlaceName = "";
  String _tourPlaceId = "";
  int _maxPeople = 0;
  bool _allowChildren = false;
  bool _private = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final addNewTour = Provider.of<TourProvider>(context);
    final downScroll = Provider.of<NavigationBarProvider>(context);

    tourNameController.value = addNewTour.tourName.isNotEmpty
        ? TextEditingValue(
            text: addNewTour.tourName,
            selection: TextSelection.fromPosition(
              TextPosition(offset: addNewTour.tourName.length),
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
                      child: InputFieldNewTour("Tour Name", (value) {
                        _tourName = value;
                        addNewTour.setTourName = _tourName;
                      }, focusNodeTourName, focusNodeTourPlace, false,
                          tourNameController),
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
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          FocusScopeNode currentFocus = FocusScope.of(context);

                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          widget.pageController.jumpToPage(7);
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
                                    addNewTour.tourPlaceName.isNotEmpty
                                        ? addNewTour.tourPlaceName
                                        : "Tour Place",
                                    style: TextStyle(
                                      fontFamily: Constants.POPPINS,
                                      fontSize: 15,
                                      color: addNewTour.tourPlaceName.isNotEmpty
                                          ? Styles.whiteblack(
                                              themeChange.darkTheme, context)
                                          : Styles.publishtour_hintText(
                                              themeChange.darkTheme, context),
                                    ),
                                  )),
                            ),
                          )),
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
                                color: Styles.whiteblack(
                                    themeChange.darkTheme, context)),
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth * 0.025,
                          ),
                          GestureDetector(
                              child: Container(
                                width: SizeConfig.screenWidth * 0.06,
                                height: SizeConfig.screenHeight * 0.027,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: addNewTour.isForChildren
                                        ? Color.fromRGBO(245, 95, 185, 1)
                                        : Colors.transparent,
                                    border: addNewTour.isForChildren
                                        ? null
                                        : Border.all(
                                            color: Styles.publishtour_check(
                                                themeChange.darkTheme, context),
                                            width: 1)),
                                child: addNewTour.isForChildren
                                    ? Icon(
                                        CustomIcons.check,
                                        size: 9,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                              onTap: () {
                                setState(() {
                                  if (addNewTour.isForChildren == false) {
                                    addNewTour.setIsForChildren = true;
                                  } else {
                                    addNewTour.setIsForChildren = false;
                                  }
                                });
                              }),
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
                            CounterWidget((value) {
                              _updateCounter(value, addNewTour);
                            }, true),
                            Expanded(
                                child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: SizeConfig.screenHeight * 0.023),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Private",
                                      style: TextStyle(
                                          fontFamily: Constants.POPPINS,
                                          fontSize: 15,
                                          color: Styles.whiteblack(
                                              themeChange.darkTheme, context)),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.screenWidth * 0.055,
                                    ),
                                    GestureDetector(
                                        child: Container(
                                          width: SizeConfig.screenWidth * 0.06,
                                          height:
                                              SizeConfig.screenHeight * 0.027,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              color: addNewTour.isPrivate
                                                  ? Color.fromRGBO(
                                                      245, 95, 185, 1)
                                                  : Colors.transparent,
                                              border: addNewTour.isPrivate
                                                  ? null
                                                  : Border.all(
                                                      color: Styles
                                                          .publishtour_check(
                                                              themeChange
                                                                  .darkTheme,
                                                              context),
                                                      width: 1)),
                                          child: addNewTour.isPrivate
                                              ? Icon(
                                                  CustomIcons.check,
                                                  size: 9,
                                                  color: Colors.white,
                                                )
                                              : null,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            if (addNewTour.isPrivate == false) {
                                              addNewTour.setIsPrivate = true;
                                            } else {
                                              addNewTour.setIsPrivate = false;
                                            }
                                          });
                                        }),
                                    SizedBox(
                                      width: SizeConfig.screenWidth * 0.015,
                                    )
                                  ],
                                ),
                              ),
                            ))
                          ],
                        )),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.0465,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Categories",
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
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.01,
                    ),
                    Container(
                      height: SizeConfig.screenHeight * 0.05,
                      child: ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.0465),
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            _selectedTags.length + _nonSelectedTags.length,
                        separatorBuilder: (context, i) {
                          return SizedBox(width: SizeConfig.screenWidth * 0.03);
                        },
                        itemBuilder: (context, i) {
                          return i < _selectedTags.length
                              ? GestureDetector(
                                  child: CategoriesSelectedWidget(
                                    _selectedTags[i].colorBackground,
                                    _selectedTags[i].colorBackgroundIconEnd,
                                    _selectedTags[i].widthBackground,
                                    _selectedTags[i].icon,
                                    _selectedTags[i].category,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _nonSelectedTags.add(CategoriesWidget(
                                          _selectedTags[i].colorBackground,
                                          _selectedTags[i]
                                              .colorBackgroundIconEnd,
                                          _selectedTags[i].widthBackground -
                                              0.06,
                                          _selectedTags[i].icon,
                                          _selectedTags[i].category));
                                      _selectedTags.removeAt(i);
                                    });
                                  },
                                )
                              : GestureDetector(
                                  child: CategoriesWidget(
                                    _nonSelectedTags[i - _selectedTags.length]
                                        .colorBackground,
                                    _nonSelectedTags[i - _selectedTags.length]
                                        .colorBackgroundIconEnd,
                                    _nonSelectedTags[i - _selectedTags.length]
                                        .widthBackground,
                                    _nonSelectedTags[i - _selectedTags.length]
                                        .icon,
                                    _nonSelectedTags[i - _selectedTags.length]
                                        .category,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      int actualDelete =
                                          i - _selectedTags.length;

                                      _selectedTags.add(
                                          CategoriesSelectedWidget(
                                              _nonSelectedTags[
                                                      i - _selectedTags.length]
                                                  .colorBackground,
                                              _nonSelectedTags[
                                                      i - _selectedTags.length]
                                                  .colorBackgroundIconEnd,
                                              _nonSelectedTags[i -
                                                          _selectedTags.length]
                                                      .widthBackground +
                                                  0.06,
                                              _nonSelectedTags[
                                                      i - _selectedTags.length]
                                                  .icon,
                                              _nonSelectedTags[
                                                      i - _selectedTags.length]
                                                  .category));
                                      _nonSelectedTags.removeAt(actualDelete);
                                    });
                                  },
                                );
                        },
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
                              onPressed: () {
                                if (addNewTour.tourName != "") {
                                  _tourName = addNewTour.tourName;
                                }
                                _trySubmitForm();
                                continueStep1(addNewTour);
                              },
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

  void continueStep1(TourProvider newTourProvider) {
    newTourProvider.setTourName = _tourName;
    newTourProvider.setNumberOfPeople = _maxPeople;
    newTourProvider.setIsForChildren = _allowChildren;
    newTourProvider.setIsPrivate = _private;

    newTourProvider.publishTourStep1();

    print(newTourProvider.tourName);
    print(newTourProvider.tourPlaceName);
    print(newTourProvider.tourPlaceId);
    print(newTourProvider.numberOfPeople);
    print(newTourProvider.isForChildren);
    print(newTourProvider.isPrivate);
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
                    //addNewTour.initVariables();
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
                    color: Styles.whiteblack(themeChange.darkTheme, context)),
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
          color: Styles.tourpreview_barlight(themeChange.darkTheme, context),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.015),
      ],
    );
  }
}
