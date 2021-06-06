import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';

class NavigationBarWidget extends StatefulWidget {
  final PageController pageController;
  final int currentPage;
  final double leftPosition;

  NavigationBarWidget(
      {@required this.pageController,
      @required this.currentPage,
      @required this.leftPosition});

  @override
  _NavigationBarWidgetState createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.05),
      child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          transform: Matrix4.translationValues(0, -30, 0),
          child: SizedBox(
              height: SizeConfig.screenHeight * 0.08,
              child: Container(
                  decoration: BoxDecoration(
                      color: Styles.home_navigatorbackground(
                          themeChange.darkTheme, context),
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
                        width: SizeConfig.screenWidth * 0.08,
                        height: SizeConfig.screenHeight * 0.003,
                      ),
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              width: SizeConfig.screenWidth * 0.15,
                              height: SizeConfig.screenHeight,
                              child: Padding(
                                padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.01),
                                child: Icon(
                                  CustomIcons.homeicon,
                                  size: 18,
                                  color: widget.currentPage == 0
                                      ? Styles.home_buttonnavigator(
                                          themeChange.darkTheme, context)
                                      : Styles.home_buttonnavigatordisable(
                                          themeChange.darkTheme, context),
                                ),
                              ),
                            ),
                            onTap: () => widget.pageController.jumpToPage(0),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              width: SizeConfig.screenWidth * 0.15,
                              height: SizeConfig.screenHeight,
                              child: Icon(
                                CustomIcons.pinlocationicon,
                                size: 18,
                                color: widget.currentPage == 1
                                    ? Styles.home_buttonnavigator(
                                        themeChange.darkTheme, context)
                                    : Styles.home_buttonnavigatordisable(
                                        themeChange.darkTheme, context),
                              ),
                            ),
                            onTap: () => widget.pageController.jumpToPage(1),
                          ),
                          GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Container(
                                width: SizeConfig.screenWidth * 0.15,
                                height: SizeConfig.screenHeight,
                                child: Icon(
                                  Ionicons.headset_outline,
                                  size: 25,
                                  color: widget.currentPage == 2
                                      ? Styles.home_buttonnavigator(
                                          themeChange.darkTheme, context)
                                      : Styles.home_buttonnavigatordisable(
                                          themeChange.darkTheme, context),
                                ),
                              ),
                              onTap: () => widget.pageController.jumpToPage(2)),
                          GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Container(
                                width: SizeConfig.screenWidth * 0.15,
                                height: SizeConfig.screenHeight,
                                child: Icon(
                                  CustomIcons.chaticon,
                                  size: 18,
                                  color: widget.currentPage == 3
                                      ? Styles.home_buttonnavigator(
                                          themeChange.darkTheme, context)
                                      : Styles.home_buttonnavigatordisable(
                                          themeChange.darkTheme, context),
                                ),
                              ),
                              onTap: () => widget.pageController.jumpToPage(3)),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                              child: Container(
                                width: SizeConfig.screenWidth * 0.15,
                                height: SizeConfig.screenHeight,
                                child: Icon(
                                  CustomIcons.profileicon,
                                  size: 18,
                                  color: widget.currentPage == 4
                                      ? Styles.home_buttonnavigator(
                                          themeChange.darkTheme, context)
                                      : Styles.home_buttonnavigatordisable(
                                          themeChange.darkTheme, context),
                                ),
                              ),
                              onTap: () =>
                                  {widget.pageController.jumpToPage(4)}),
                        ],
                      ),
                    ),
                  ])))),
    );
  }
}
