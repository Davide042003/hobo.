import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/provider/navigationbar_provider.dart';
import 'package:hobo_test/widgets/provider/pagecontrol_provider.dart';

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
    final downScroll = Provider.of<NavigationBarProvider>(context);
    final page = Provider.of<PageControlProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.05),
      child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          transform: Matrix4.translationValues(
              0,
              downScroll.scrollingDown
                  ? SizeConfig.screenHeight * 0.07
                  : SizeConfig.screenHeight * -0.035,
              0),
          child: SizedBox(
              height: SizeConfig.screenHeight * 0.07,
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
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: Container(
                              width: SizeConfig.screenWidth * 0.15,
                              height: SizeConfig.screenHeight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: SizeConfig.screenWidth * 0.01),
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
                            onTap: () {
                              page.changePage = 0;
                              widget.pageController.jumpToPage(page.page);
                            },
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: Container(
                              width: SizeConfig.screenWidth * 0.15,
                              height: SizeConfig.screenHeight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: SizeConfig.screenWidth * 0.01),
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
                            ),
                            onTap: () {
                              page.changePage = 1;
                              widget.pageController.jumpToPage(page.page);
                            },
                          ),
                          GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              child: Container(
                                width: SizeConfig.screenWidth * 0.15,
                                height: SizeConfig.screenHeight,
                                child: widget.currentPage == 2
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                            right:
                                                SizeConfig.screenWidth * 0.034,
                                            bottom: SizeConfig.screenHeight *
                                                0.001),
                                        child: Container(
                                          margin: EdgeInsets.all(6),
                                          child: SvgPicture.asset(
                                            "assets/images/hoboColor.svg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: EdgeInsets.all(19),
                                        child: SvgPicture.asset(
                                            "assets/images/hoboClear.svg"),
                                      ),
                              ),
                            onTap: () {
                              page.changePage = 2;
                              widget.pageController.jumpToPage(page.page);
                            }),
                          GestureDetector(
                              behavior: HitTestBehavior.translucent,
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
                              onTap: () {
                                page.changePage = 3;
                                widget.pageController.jumpToPage(page.page);
                              }),
                          GestureDetector(
                              behavior: HitTestBehavior.translucent,
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
                              onTap: () {
                                  page.changePage = 4;
                                  widget.pageController.jumpToPage(page.page);
                              })
                        ],
                      ),
                    ),
                  ])))),
    );
  }
}
