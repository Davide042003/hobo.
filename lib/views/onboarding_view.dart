import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/onBoarding/onboarding_template.dart';
import 'package:hobo_test/widgets/onBoarding/onboarding_widget.dart';
import 'package:hobo_test/widgets/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:hobo_test/widgets/size_config.dart';
import 'package:hobo_test/views/loginregister_view.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/dark_theme_provider.dart';
import 'package:hobo_test/widgets/dark_theme_styles.dart';

class SliderLayoutView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliderLayoutViewState();
}

class _SliderLayoutViewState extends State<SliderLayoutView> {

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
      body: Container(
        decoration: BoxDecoration(
          gradient: Styles.onboarding_gradient(themeChange.darkTheme, context),
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: onBoardingArrayList.length,
              itemBuilder: (ctx, i) =>
                  OnBoardingWidget(i),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: SizeConfig.screenHeight * 0.065
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () =>
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginRegisterView())),
                      child: Text(
                        "SKIP",
                        style: TextStyle(
                            color: Styles.onboarding_skip(
                                themeChange.darkTheme, context),
                            fontFamily: Constants.POPPINS,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.09,
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.21),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: onBoardingArrayList.length,
                  effect: ExpandingDotsEffect(
                      expansionFactor: 3,
                      dotWidth: SizeConfig.screenWidth * 0.012,
                      dotHeight: SizeConfig.screenHeight * 0.006,
                      dotColor: Styles.onboarding_color_dot(
                          themeChange.darkTheme, context),
                      activeDotColor: Styles.onboarding_active_color_dot(
                          themeChange.darkTheme, context)
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    width: SizeConfig.screenWidth * 0.29,
                    height: SizeConfig.screenHeight * 0.059,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(35)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(116, 142, 243, 1),
                            Color.fromRGBO(36, 65, 187, 1)
                          ]),
                    ),
                    child: TextButton(
                      onPressed: () =>
                      _currentPage <= 1
                          ? _pageController.nextPage(
                          duration: _duration, curve: _curve)
                          : {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginRegisterView()))
                      },
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                            fontFamily: Constants.POPPINS,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: 5),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
