import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/styles/dark_theme_styles.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/provider/dark_theme_provider.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';

class NavigationBarWidget extends StatefulWidget {

  final PageController pageController;
  final int currentPage;
  final double leftPosition;

  NavigationBarWidget({@required this.pageController, @required this.currentPage, @required this.leftPosition});

  @override
  _NavigationBarWidgetState createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return  Padding(
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
                      left: widget.leftPosition * SizeConfig.screenWidth,
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
                              color: widget.currentPage == 0
                                  ? Styles.home_buttonnavigator(
                                  themeChange.darkTheme, context)
                                  : Styles.home_buttonnavigatordisable(
                                  themeChange.darkTheme, context),
                            ),
                            onTap: () => widget.pageController.jumpToPage(0),
                          ),
                          GestureDetector(
                            child: Icon(
                              Ionicons.location,
                              size: 25,
                              color: widget.currentPage == 1
                                  ? Styles.home_buttonnavigator(
                                  themeChange.darkTheme, context)
                                  : Styles.home_buttonnavigatordisable(
                                  themeChange.darkTheme, context),
                            ),
                            onTap: () => widget.pageController.jumpToPage(1),
                          ),
                          GestureDetector(
                              child: Icon(
                                Ionicons.headset_outline,
                                size: 25,
                                color: widget.currentPage == 2
                                    ? Styles.home_buttonnavigator(
                                    themeChange.darkTheme, context)
                                    : Styles.home_buttonnavigatordisable(
                                    themeChange.darkTheme, context),
                              ),
                              onTap: () => widget.pageController.jumpToPage(2)),
                          GestureDetector(
                              child: Icon(
                                Ionicons.chatbubble,
                                size: 25,
                                color: widget.currentPage == 3
                                    ? Styles.home_buttonnavigator(
                                    themeChange.darkTheme, context)
                                    : Styles.home_buttonnavigatordisable(
                                    themeChange.darkTheme, context),
                              ),
                              onTap: () => widget.pageController.jumpToPage(3)),
                          GestureDetector(
                              child: Icon(
                                Ionicons.person,
                                size: 25,
                                color: widget.currentPage == 4
                                    ? Styles.home_buttonnavigator(
                                    themeChange.darkTheme, context)
                                    : Styles.home_buttonnavigatordisable(
                                    themeChange.darkTheme, context),
                              ),
                              onTap: () => {widget.pageController.jumpToPage(4)}),
                        ],
                      ),
                    ),
                  ])))),
    );
  }
}
