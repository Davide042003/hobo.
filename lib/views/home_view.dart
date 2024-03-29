import 'dart:ui';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:hobo_test/views/addactivity_view.dart';
import 'package:hobo_test/views/chooseplace_view.dart';
import 'package:hobo_test/views/chooseplaceactivity_view.dart';
import 'package:hobo_test/views/hotplaces_view.dart';
import 'package:hobo_test/views/step1createtour_view.dart';
import 'package:hobo_test/views/step1extrainformation_view.dart';
import 'package:hobo_test/views/step2createtour_view.dart';
import 'package:hobo_test/views/step2extrainformation.dart';
import 'package:hobo_test/views/step3createtour_view.dart';
import 'package:hobo_test/views/step4createtour_view.dart';
import 'package:hobo_test/views/step5createtour_view.dart';
import 'package:hobo_test/widgets/categories_list.dart';
import 'package:hobo_test/widgets/home/hotplaceshome_widget.dart';
import 'package:hobo_test/widgets/home/maphome_widget.dart';
import 'package:hobo_test/widgets/home/profileimagehome_widget.dart';
import 'package:hobo_test/widgets/home/searchbar_widget.dart';
import 'package:hobo_test/widgets/home/categories_widget.dart';
import 'package:hobo_test/widgets/home/hotplaces_template.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/provider/navigationbar_provider.dart';
import 'package:hobo_test/widgets/provider/tour_provider.dart';
import 'package:hobo_test/widgets/provider/pagecontrol_provider.dart';
import 'package:uuid/uuid.dart';

import 'addvehicle_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController(initialPage: 0);
  final PageController _pageControllerGuide = PageController(initialPage: 0);

  void _openPopUpGuide(bool isDark) {
    showGeneralDialog(
        barrierColor: Colors.transparent,
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Material(
            type: MaterialType.transparency,
            child: Transform(
              transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
              child: Opacity(
                opacity: a1.value,
                child: ExpandablePageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageControllerGuide,
                  children: [
                    Step1ExtraInformation(_pageControllerGuide),
                    Step2ExtraInformation(_pageControllerGuide)
                  ],
                ),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 400),
        barrierDismissible: false,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }

  void _openPopUp(bool isDark) {
    showGeneralDialog(
        barrierColor: Colors.transparent,
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Material(
            type: MaterialType.transparency,
            child: Transform(
              transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
              child: Opacity(
                opacity: a1.value,
                child: ExpandablePageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    Step1CreateTour(_pageController),
                    Step2CreateTour(_pageController),
                    Step3CreateTour(_pageController),
                    Step4CreateTour(_pageController),
                    Step5CreateTour(_pageController),
                    AddActivity(_pageController),
                    AddVehicle(_pageController),
                    ChoosePlace(_pageController),
                    ChoosePlaceActivity(_pageController)
                  ],
                ),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 400),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }

  @override
  void initState() {
    super.initState();
    final tourProvider = Provider.of<TourProvider>(context, listen: false);
    final themeChange = Provider.of<DarkThemeProvider>(context, listen: false);

    if (tourProvider.isGuide) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        setState(() {
          final downScroll = Provider.of<NavigationBarProvider>(context, listen: false);
          tourProvider.addNewTourVisible = true;
          downScroll.navigationdown = true;
          _openPopUpGuide(themeChange.darkTheme);
        });
      });
    } else {
      print("Welcome Tourist!");
    }
    /* SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
        final downScroll = Provider.of<NavigationBarProvider>(context, listen: false);
        final tourProvider = Provider.of<NewTourProvider>(context, listen: false);
        tourProvider.addNewTourVisible = true;
        downScroll.navigationdown = true;
        _openPopUpGuide(false);
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final downScroll = Provider.of<NavigationBarProvider>(context);
    final tourProvider = Provider.of<TourProvider>(context);
    final page = Provider.of<PageControlProvider>(context);

    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.07),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Explore",
                      style: TextStyle(
                          fontFamily: Constants.POPPINS,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Styles.whiteblack(
                              themeChange.darkTheme, context)),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.25),
                    GestureDetector(
                      child: Container(
                          height: SizeConfig.screenHeight * 0.05,
                          width: SizeConfig.screenWidth * 0.12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Ionicons.add_circle_outline,
                            size: 48,
                            color: Styles.whiteblack(
                                themeChange.darkTheme, context),
                          )),
                      onTap: () {
                        setState(() {
                          tourProvider.addNewTourVisible = true;
                          // generate tourId
                          var uuid = Uuid();
                          String tourId = uuid.v1();
                          tourProvider.setTourId = tourId;
                          // ----
                          downScroll.navigationdown = true;
                          _openPopUp(themeChange.darkTheme);
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.26),
                                  blurRadius: 7,
                                  offset: Offset(0, 6))
                            ],
                          ),
                          child: ProfileImageHomeWidget(
                              image:
                                  AssetImage("assets/images/provaSocial.jpeg"),
                              initials: "DB")),
                      onTap: () {
                        page.changePage = 4;
                      },
                    )
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.015),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.07),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Container(
                      width: double.infinity,
                      height: SizeConfig.screenHeight * 0.23,
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.all(Radius.circular(30)),
                        color: Colors.grey,
                      ),
                      child: tourProvider.addNewTourVisible == true
                          ? SizedBox()
                          : MapHomeWidget(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.025),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.07),
                  child: SearchBarWidget()),
              SizedBox(height: SizeConfig.screenHeight * 0.032),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.07),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hot Places",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Styles.whiteblack(
                                  themeChange.darkTheme, context)),
                          textAlign: TextAlign.left),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(_routeToHotPlaces());
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            width: SizeConfig.screenWidth * 0.2,
                            child: Text(
                              "See all",
                              style: TextStyle(
                                  fontFamily: Constants.POPPINS,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Styles.whiteblack(
                                      themeChange.darkTheme, context)),
                              textAlign: TextAlign.right,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.015),
              Container(
                  height: SizeConfig.screenHeight * 0.2,
                  child: ListView.builder(
                      padding:
                          EdgeInsets.only(left: SizeConfig.screenWidth * 0.07),
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: hotPlacesArrayList.length,
                      itemBuilder: (ctx, i) => HotPlacesHomeWidget(i))),
              SizedBox(height: SizeConfig.screenHeight * 0.035),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.07),
                child: Container(
                  width: double.infinity,
                  child: Text(
                    "Categories",
                    style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color:
                            Styles.whiteblack(themeChange.darkTheme, context)),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Container(
                height: SizeConfig.screenHeight * 0.05,
                child: ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    padding:
                        EdgeInsets.only(left: SizeConfig.screenWidth * 0.07),
                    scrollDirection: Axis.horizontal,
                    itemCount: CategoriesList().tags.length,
                    separatorBuilder: (context, i) {
                      return SizedBox(width: SizeConfig.screenWidth * 0.03);
                    },
                    itemBuilder: (context, i) {
                      return GestureDetector(
                          child: CategoriesWidget(
                        CategoriesList().tags[i].colorBackground,
                        CategoriesList().tags[i].colorBackgroundIconEnd,
                        CategoriesList().tags[i].widthBackground,
                        CategoriesList().tags[i].icon,
                        CategoriesList().tags[i].category,
                      ));
                    }),
              ),
            ],
          ),
        ),
        tourProvider.addNewTourVisible
            ? GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight,
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Styles.publishtour_blur(
                                    themeChange.darkTheme, context))))))
            : SizedBox()
      ],
    );
  }
}

Route _routeToHotPlaces() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => HotPlacesView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
