import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hobo_test/widgets/home/hotplaces_widget.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'package:hobo_test/widgets/styles/constants.dart';
import 'package:hobo_test/widgets/styles/dark_theme_styles.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/provider/dark_theme_provider.dart';
import 'package:ionicons/ionicons.dart';

class HotPlacesView extends StatefulWidget {
  @override
  _HotPlacesViewState createState() => _HotPlacesViewState();
}

class _HotPlacesViewState extends State<HotPlacesView> {
  int _pageTotal = 3;
  int _pageCount = 1;

  _onPageChanged(int index) {
    setState(() {
      _pageCount = index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: Stack(children: [
        Container(
          color:
              Styles.loginregister_background(themeChange.darkTheme, context),
        ),
        Column(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.screenWidth * 0.06,
                    right: SizeConfig.screenWidth * 0.1,
                    top: SizeConfig.screenHeight * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context, false),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: 35,
                        color: Styles.onboarding_skip(
                            themeChange.darkTheme, context),
                      ),
                    ),
                    Text(
                      "$_pageCount/$_pageTotal",
                      style: TextStyle(
                          color:
                              Styles.whiteblack(themeChange.darkTheme, context),
                          fontFamily: Constants.POPPINS,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.13, left: SizeConfig.screenWidth * 0.05),
          child: Swiper(
            loop: false,
            outer: false,

            itemBuilder: (BuildContext context, int index) {
              return new HotPlacesWidget("assets/images/Paris-Background_Big.png", "assets/images/Paris-Monument.png", "Paris");
            },
            itemCount: _pageTotal,
            scale: 0.9,
            onIndexChanged: (index) {
              _onPageChanged(index);
            },
          ),
        ),
      ]),
    );
  }
}
