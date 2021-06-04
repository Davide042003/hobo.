import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hobo_test/widgets/home/tourlist_widget.dart';
import 'package:hobo_test/widgets/home/profileimagehome_widget.dart';
import 'package:hobo_test/widgets/home/searchbarmap_widget.dart';
import 'package:hobo_test/widgets/home/map_widget.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  static const _duration = const Duration(milliseconds: 300);
  static const _curve = Curves.ease;

  @override
  void initState() {
    super.initState();
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

    return Stack(
      children: [
        PageView(
            physics:new NeverScrollableScrollPhysics(),
          children: [MapWidget(),TourlistWidget()],
          onPageChanged: _onPageChanged,
          controller: _pageController,
        ),
        IgnorePointer(
          child: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.4,
            decoration:  _currentPage == 0 ? BoxDecoration(
                gradient:  LinearGradient(
                    colors: [
                  Styles.loginregister_background(themeChange.darkTheme, context),
                  Styles.shadow_map(themeChange.darkTheme, context),
                ],
                    begin: themeChange.darkTheme
                        ? Alignment.center * .7
                        : Alignment.center * 1.2,
                    end: Alignment.bottomCenter)): BoxDecoration(color: Colors.transparent),
          ),
        ),
        SafeArea(
            child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.07),
          child: Column(children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Tours",
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Styles.whiteblack(themeChange.darkTheme, context)),
                ),
                SizedBox(width: SizeConfig.screenWidth*0.22),
                Container(
                    height: SizeConfig.screenHeight * 0.05,
                    width: SizeConfig.screenWidth * 0.12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(116, 142, 243, .1),
                      boxShadow: [
                        themeChange.darkTheme
                            ? BoxShadow(
                          color: Colors.transparent,
                        )
                            : BoxShadow(
                            color: Color.fromRGBO(116, 142, 243, .1),
                            blurRadius: 4,
                            offset: Offset(0, 6))
                      ],
                    ),
                    child: Icon(
                      Ionicons.filter,
                      size: 25,
                      color: Color.fromRGBO(77, 105, 216, 1),
                    )),
                SizedBox(width: SizeConfig.screenWidth*0.05),
                GestureDetector(
                  child: Container(
                      height: SizeConfig.screenHeight * 0.05,
                      width: SizeConfig.screenWidth *0.12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            _currentPage == 1 ? Color.fromRGBO(84, 204, 255, 1) : Color.fromRGBO(55, 199, 117, 1),
                            _currentPage == 1 ? Color.fromRGBO(0, 119, 255, 1): Color.fromRGBO(29, 179, 89, 1)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter
                        ),
                      ),
                      child:  Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 2.0,
                              offset: Offset(0, 3)),
                        ]),
                        child: Icon(
                          _currentPage == 1 ? Ionicons.map_outline : Ionicons.list_outline,
                          size: 23,
                          color: Colors.white,
                        ),
                      )),
                  onTap: () => _pageController.animateToPage(_currentPage == 0 ? 1 : 0, duration: _duration, curve: _curve),
                ),
                SizedBox(width: SizeConfig.screenWidth * 0.05),
                Container(
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
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            SearchBarMapWidget(),
          ]),
        )),
      ],
    );
  }
}
