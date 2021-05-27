import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hobo_test/widgets/home/hotplaceshome_widget.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/provider/dark_theme_provider.dart';
import 'package:hobo_test/widgets/styles/constants.dart';
import 'package:hobo_test/widgets/styles/dark_theme_styles.dart';
import 'package:hobo_test/widgets/home/searchbar_widget.dart';
import 'package:hobo_test/widgets/home/profileimagehome_widget.dart';
import 'package:hobo_test/widgets/home/searchbar_widget.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Stack(
      children: [
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          color: Colors.grey,
        ),
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * 0.4,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Styles.loginregister_background(themeChange.darkTheme, context),
              Styles.shadow_map(themeChange.darkTheme, context),
            ],
                begin: Alignment.center,
                end: Alignment.bottomCenter
          )),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Places",
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Styles.whiteblack(themeChange.darkTheme, context)),
                ),
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
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            SearchBarWidget(),
          ]),
        )),
      ],
    );
  }
}
