import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hobo_test/views/home_view.dart';
import 'package:hobo_test/views/searchsocial_view.dart';
import 'package:hobo_test/widgets/home/profileimagehome_widget.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/provider/navigationbar_provider.dart';
import 'package:hobo_test/widgets/provider/pagecontrol_provider.dart';
import 'package:hobo_test/widgets/social/exploresocial_widget.dart';
import 'package:hobo_test/widgets/social/followed_widget.dart';

class SocialView extends StatefulWidget {
  @override
  _SocialViewState createState() => _SocialViewState();
}

class _SocialViewState extends State<SocialView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final _leftPositionList = [0.105, 0.5];
  double _leftPosition = 0.105;
  final ScrollController _scrollController = ScrollController();
  bool visible = false;

  @override
  void initState() {
    super.initState();
    _scrollController
      ..addListener(() {
        if (_scrollController.offset >= SizeConfig.screenHeight * 0.12) {
          setState(() {
            if (!visible)
              visible = true;
          });
        } else if (_scrollController.offset <= SizeConfig.screenHeight * 0.18) {
          setState(() {
            if (visible)
              visible = false;
          });
        }
      });
  }


  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
      _leftPosition = _leftPositionList[_currentPage];
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final downScroll = Provider.of<NavigationBarProvider>(context);
    final page = Provider.of<PageControlProvider>(context);

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          if (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
            setState(() {
              downScroll.navigationdown = true;
            });
          } else if (_scrollController.position.userScrollDirection ==
              ScrollDirection.forward) {
            setState(() {
              downScroll.navigationdown = false;
            });
          }
        } else if (scrollNotification is ScrollEndNotification) {
          setState(() {
            downScroll.navigationdown = false;
          });
        }
      },
      child: Stack(
        children: [
          SafeArea(
              child: Column(children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.006,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.07),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Social",
                    style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color:
                            Styles.whiteblack(themeChange.darkTheme, context)),
                  ),
                  SizedBox(width: SizeConfig.screenWidth * 0.245),
                  Container(
                      margin: EdgeInsets.only(
                          bottom: SizeConfig.screenHeight * 0.012),
                      height: SizeConfig.screenHeight * 0.045,
                      width: SizeConfig.screenWidth * 0.12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Ionicons.add_circle_outline,
                        size: 50,
                        color:
                            Styles.whiteblack(themeChange.darkTheme, context),
                      )),
                  SizedBox(width: SizeConfig.screenWidth * 0.01),
                  GestureDetector(
                    child: Container(
                        height: SizeConfig.screenHeight * 0.048,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromRGBO(116, 142, 243, 1),
                                Color.fromRGBO(36, 65, 187, 1)
                              ]),
                        ),
                        child: TextButton(
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(.15),
                                      blurRadius: 2.0,
                                      offset: Offset(0, 1)),
                                ]),
                            child: Icon(Ionicons.search,
                                color: Colors.white, size: 20),
                          ),
                        )),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchSocialView()),
                      );
                    },
                  ),
                  SizedBox(width: SizeConfig.screenWidth * 0.01),
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
                            image: AssetImage("assets/images/provaSocial.jpeg"),
                            initials: "DB")),
                      onTap: () {
                        page.changePage = 4;
                      }
                  ),
                ],
              ),
            ),
                SizedBox(height: visible ? SizeConfig.screenHeight * 0.015: 0,),
                visible ? Stack(children: [
                  Container(
                    margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.0475),
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.001,
                    color: Styles.tourpreview_bar(themeChange.darkTheme, context),
                  ),
                  AnimatedPositioned(
                    left: _leftPosition * SizeConfig.screenWidth,
                    child: Container(
                      margin:
                      EdgeInsets.only(top: SizeConfig.screenHeight * 0.0455),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(116, 142, 243, 1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      width: SizeConfig.screenWidth * 0.38,
                      height: SizeConfig.screenHeight * 0.0025,
                    ),
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: Container(
                              width: SizeConfig.screenWidth * 0.333,
                              height: SizeConfig.screenHeight * 0.05,
                              child: Center(
                                  child: Text(
                                    "Followed",
                                    style: TextStyle(
                                        fontFamily: Constants.POPPINS,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color: _currentPage == 0
                                            ? Styles.whiteblack(
                                            themeChange.darkTheme, context)
                                            : Styles.social_choosetext(
                                            themeChange.darkTheme, context)),
                                  )),
                            ),
                            onTap: () => _pageController.animateToPage(0,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.fastOutSlowIn)),
                        GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: Container(
                              width: SizeConfig.screenWidth * 0.333,
                              height: SizeConfig.screenHeight * 0.05,
                              child: Center(
                                  child: Text(
                                    "Explore",
                                    style: TextStyle(
                                        fontFamily: Constants.POPPINS,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color: _currentPage == 1
                                            ? Styles.whiteblack(
                                            themeChange.darkTheme, context)
                                            : Styles.social_choosetext(
                                            themeChange.darkTheme, context)),
                                  )),
                            ),
                            onTap: () => _pageController.animateToPage(1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.fastOutSlowIn)),
                      ],
                    ),
                  ),
                ]) : SizedBox()
              ])),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.screenHeight * (visible ? 0.182 : 0.135)),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                width: SizeConfig.screenWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight * 0.12,
                      color: Colors.black,
                    ),
                    visible ? SizedBox(): Stack(children: [
                      Container(
                        margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.0475),
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight * 0.001,
                        color: Styles.tourpreview_bar(themeChange.darkTheme, context),
                      ),
                      AnimatedPositioned(
                        left: _leftPosition * SizeConfig.screenWidth,
                        child: Container(
                          margin:
                          EdgeInsets.only(top: SizeConfig.screenHeight * 0.0455),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(116, 142, 243, 1),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          width: SizeConfig.screenWidth * 0.38,
                          height: SizeConfig.screenHeight * 0.0025,
                        ),
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                child: Container(
                                  width: SizeConfig.screenWidth * 0.333,
                                  height: SizeConfig.screenHeight * 0.05,
                                  child: Center(
                                      child: Text(
                                        "Followed",
                                        style: TextStyle(
                                            fontFamily: Constants.POPPINS,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: _currentPage == 0
                                                ? Styles.whiteblack(
                                                themeChange.darkTheme, context)
                                                : Styles.social_choosetext(
                                                themeChange.darkTheme, context)),
                                      )),
                                ),
                                onTap: () => _pageController.animateToPage(0,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.fastOutSlowIn)),
                            GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                child: Container(
                                  width: SizeConfig.screenWidth * 0.333,
                                  height: SizeConfig.screenHeight * 0.05,
                                  child: Center(
                                      child: Text(
                                        "Explore",
                                        style: TextStyle(
                                            fontFamily: Constants.POPPINS,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: _currentPage == 1
                                                ? Styles.whiteblack(
                                                themeChange.darkTheme, context)
                                                : Styles.social_choosetext(
                                                themeChange.darkTheme, context)),
                                      )),
                                ),
                                onTap: () => _pageController.animateToPage(1,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.fastOutSlowIn)),
                          ],
                        ),
                      ),
                    ]),
                    ExpandablePageView(
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      children: [
                        FollowedWidget(),
                        ExploreWidget(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          IgnorePointer(
            child: Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.8),
              child: Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.2,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                      Styles.social_gradientstart(themeChange.darkTheme, context),
                      Styles.social_gradientend(themeChange.darkTheme, context)
                    ],
                        begin: Alignment(
                            Alignment.topCenter.x,
                            Alignment.topCenter.y + SizeConfig.screenHeight*0.0005),
                        end: Alignment(
                            Alignment.bottomCenter.x,
                            Alignment.bottomCenter.y - SizeConfig.screenHeight*0.0003))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
