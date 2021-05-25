import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/size_config.dart';
import 'package:hobo_test/widgets/constants.dart';
import 'package:hobo_test/widgets/login_register/login_widget.dart';
import 'package:hobo_test/widgets/login_register/register_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:hobo_test/widgets/dark_theme_styles.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/dark_theme_provider.dart';

class LoginRegisterView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginRegisterViewState();
}

class _LoginRegisterViewState extends State<LoginRegisterView> {
  int _currentPage = 0;
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
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(
                begin:
                    Alignment(Alignment.topLeft.x, Alignment.topCenter.y + 0.1),
                end: Alignment(
                    Alignment.topRight.x, Alignment.topCenter.y + 0.4),
                colors: [
                  Color.fromRGBO(116, 142, 243, 1),
                  Color.fromRGBO(36, 65, 187, 1)
                ]),
          )),
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.9,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Styles.loginregister_background(themeChange.darkTheme, context),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => _pageController.animateToPage(0,
                          duration: _duration, curve: _curve),
                      child: Container(
                        width: SizeConfig.screenWidth * 0.3,
                        height: SizeConfig.screenHeight * 0.07,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: _currentPage == 0
                                    ? Styles.whiteblack(themeChange.darkTheme, context)
                                    : Styles.loginregister_disablewindowcolor(themeChange.darkTheme, context),
                                fontFamily: Constants.POPPINS,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.15),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => _pageController.animateToPage(1,
                          duration: _duration, curve: _curve),
                      child: Container(
                        width: SizeConfig.screenWidth * 0.3,
                        height: SizeConfig.screenHeight * 0.07,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: _currentPage == 1
                                    ? Styles.whiteblack(themeChange.darkTheme, context)
                                    : Styles.loginregister_disablewindowcolor(themeChange.darkTheme, context),
                                fontFamily: Constants.POPPINS,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight * 0.0015,
                      color: Styles.loginregister_topbar(themeChange.darkTheme, context),
                    ),
                    Row(
                      children: [
                        SizedBox(width: SizeConfig.screenWidth * 0.08),
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: 2,
                          axisDirection: Axis.horizontal,
                          effect: SlideEffect(
                              spacing: SizeConfig.screenWidth * 0.042,
                              dotWidth: SizeConfig.screenWidth * 0.39,
                              dotHeight: SizeConfig.screenHeight * 0.0035,
                              paintStyle: PaintingStyle.fill,
                              dotColor: Colors.transparent,
                              activeDotColor: Color.fromRGBO(116, 142, 243, 1)),
                        ),
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: _onPageChanged,
                    children: [LoginWidget(), RegisterWidget()],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
