import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/model/onboarding_model.dart';
import 'package:hobo_test/widgets/onboarding_widget.dart';
import 'package:hobo_test/constants/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
    final size = MediaQuery.of(context).size;
    final sizeWidth = size.width;
    final sizeHeight = size.height;

    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(Alignment.center.x, Alignment.center.y - 0.4),
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color.fromRGBO(84, 204, 255, 1)]),
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: onBoardingArrayList.length,
              itemBuilder: (ctx, i) => OnBoardingWidget(i),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: sizeHeight * 0.065
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "SKIP",
                        style: const TextStyle(
                            color: Color.fromRGBO(190, 190, 190, 1),
                            fontFamily: Constants.POPPINS,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: sizeWidth * 0.09,
                    )
                  ],
                ),
                SizedBox(height: sizeHeight * 0.21),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: onBoardingArrayList.length,
                  effect: ExpandingDotsEffect(
                    expansionFactor: 3, dotWidth: sizeWidth * 0.012, dotHeight: sizeHeight * 0.006, dotColor: Color.fromRGBO(0, 0, 0, 0.17),activeDotColor: Color.fromRGBO(116, 142, 243, 1)
                  ),
                ),
                SizedBox(height: sizeHeight * 0.03),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    width: sizeWidth * 0.29,
                    height: sizeHeight * 0.059,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(116, 142, 243, 1),
                            Color.fromRGBO(36, 65, 187, 1)
                          ]),
                    ),
                    child: TextButton(
                      onPressed: () => _currentPage <= 1
                          ? _pageController.nextPage(
                              duration: _duration, curve: _curve)
                          : {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SliderLayoutView()))
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
