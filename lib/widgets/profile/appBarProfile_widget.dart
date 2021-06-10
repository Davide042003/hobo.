import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key key,
    @required this.themeChange,
    @required double leftPosition,
    @required int currentPage,
    @required PageController pageController,
  }) : _leftPosition = leftPosition, _currentPage = currentPage, _pageController = pageController, super(key: key);

  final DarkThemeProvider themeChange;
  final double _leftPosition;
  final int _currentPage;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(
            top: SizeConfig.screenHeight * 0.0475),
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight * 0.001,
        color: Styles.tourpreview_bar(
            themeChange.darkTheme, context),
      ),
      AnimatedPositioned(
        left: _leftPosition * SizeConfig.screenWidth,
        child: Container(
          margin: EdgeInsets.only(
              top: SizeConfig.screenHeight * 0.045),
          decoration: BoxDecoration(
              color: Styles.tourpreview_colorprice(
                  themeChange.darkTheme, context),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10))),
          width: SizeConfig.screenWidth * 0.333,
          height: SizeConfig.screenHeight * 0.003,
        ),
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Container(
                width: SizeConfig.screenWidth * 0.333,
                height: SizeConfig.screenHeight * 0.05,
                child: Center(
                    child: Text(
                      "Tours",
                      style: TextStyle(
                          fontFamily: Constants.POPPINS,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: _currentPage == 0
                              ? Styles.tourpreview_colorprice(
                              themeChange.darkTheme, context)
                              : Styles.profile_disabledcolor(
                              themeChange.darkTheme,
                              context)),
                    )),
              ),
              onTap: () => _pageController.jumpToPage(0)),
          GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Container(
                width: SizeConfig.screenWidth * 0.333,
                height: SizeConfig.screenHeight * 0.05,
                child: Center(
                    child: Text(
                      "Gallery",
                      style: TextStyle(
                          fontFamily: Constants.POPPINS,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: _currentPage == 1
                              ? Styles.tourpreview_colorprice(
                              themeChange.darkTheme, context)
                              : Styles.profile_disabledcolor(
                              themeChange.darkTheme,
                              context)),
                    )),
              ),
              onTap: () => _pageController.jumpToPage(1)),
          GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Container(
                width: SizeConfig.screenWidth * 0.333,
                height: SizeConfig.screenHeight * 0.05,
                child: Center(
                    child: Text(
                      "Reviews",
                      style: TextStyle(
                          fontFamily: Constants.POPPINS,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: _currentPage == 2
                              ? Styles.tourpreview_colorprice(
                              themeChange.darkTheme, context)
                              : Styles.profile_disabledcolor(
                              themeChange.darkTheme,
                              context)),
                    )),
              ),
              onTap: () => _pageController.jumpToPage(2)),
        ],
      ),
    ]);
  }
}