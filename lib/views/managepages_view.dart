import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/styles/dark_theme_styles.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'package:hobo_test/widgets/styles/constants.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/provider/dark_theme_provider.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'home_view.dart';

class ManagePagesView extends StatefulWidget {
  @override
  _ManagePagesViewState createState() => _ManagePagesViewState();
}

class _ManagePagesViewState extends State<ManagePagesView> {
  int _currentPage = 0;
  final leftPositionList = [0.1, 0.259, 0.415, 0.577, 0.736];
  double leftPosition = 0.1;
  final PageController _pageController = PageController(initialPage: 0);
  static const _duration = const Duration(milliseconds: 300);
  static const _curve = Curves.ease;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
      leftPosition = leftPositionList[_currentPage];
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
        body: Container(
            color:
                Styles.loginregister_background(themeChange.darkTheme, context),
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: _onPageChanged,
              children: [
                HomeView(),
                HomeView(),
                HomeView(),
                HomeView(),
                HomeView()
              ],
            )),
        bottomNavigationBar: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.05),
          child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              transform: Matrix4.translationValues(0, -30, 0),
              child: SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.06),
                                blurRadius: 15,
                                offset: Offset(0, 6))
                          ]),
                      child: Stack(children: [
                        AnimatedPositioned(
                          left: leftPosition * SizeConfig.screenWidth,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Styles.home_buttonnavigator(
                                    themeChange.darkTheme, context),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            width: 30,
                            height: 2,
                          ),
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: SizeConfig.screenHeight * 0.025),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                child: Icon(
                                  Ionicons.home,
                                  size: 25,
                                  color: _currentPage == 0
                                      ? Styles.home_buttonnavigator(
                                          themeChange.darkTheme, context)
                                      : Styles.home_buttonnavigatordisable(
                                          themeChange.darkTheme, context),
                                ),
                                onTap: () => _pageController.animateToPage(0,
                                        duration: _duration, curve: _curve),
                              ),
                              GestureDetector(
                                child: Icon(
                                  Ionicons.location,
                                  size: 25,
                                  color: _currentPage == 1
                                      ? Styles.home_buttonnavigator(
                                          themeChange.darkTheme, context)
                                      : Styles.home_buttonnavigatordisable(
                                          themeChange.darkTheme, context),
                                ),
                                onTap: () => _pageController.animateToPage(1,
                                    duration: _duration, curve: _curve),
                              ),
                              GestureDetector(
                                  child: Icon(
                                    Ionicons.headset_outline,
                                    size: 25,
                                    color: _currentPage == 2
                                        ? Styles.home_buttonnavigator(
                                            themeChange.darkTheme, context)
                                        : Styles.home_buttonnavigatordisable(
                                            themeChange.darkTheme, context),
                                  ),
                                  onTap: () => _pageController.animateToPage(2,
                                      duration: _duration, curve: _curve)),
                              GestureDetector(
                                  child: Icon(
                                    Ionicons.chatbubble,
                                    size: 25,
                                    color: _currentPage == 3
                                        ? Styles.home_buttonnavigator(
                                            themeChange.darkTheme, context)
                                        : Styles.home_buttonnavigatordisable(
                                            themeChange.darkTheme, context),
                                  ),
                                  onTap: () => _pageController.animateToPage(3,
                                      duration: _duration, curve: _curve)),
                              GestureDetector(
                                  child: Icon(
                                    Ionicons.person,
                                    size: 25,
                                    color: _currentPage == 4
                                        ? Styles.home_buttonnavigator(
                                            themeChange.darkTheme, context)
                                        : Styles.home_buttonnavigatordisable(
                                            themeChange.darkTheme, context),
                                  ),
                                  onTap: () => _pageController.animateToPage(4,
                                          duration: _duration, curve: _curve)),
                            ],
                          ),
                        ),
                      ])))),
        ));
  }
}
