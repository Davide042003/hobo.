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
                  begin: themeChange.darkTheme
                      ? Alignment.center * .7
                      : Alignment.center * 1.2,
                  end: Alignment.bottomCenter)),
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
                  "Places",
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Styles.whiteblack(themeChange.darkTheme, context)),
                ),
                SizedBox(width: SizeConfig.screenWidth * 0.35),
                Container(
                    height: SizeConfig.screenHeight * 0.05,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(116, 142, 243, .18),
                      boxShadow: [
                        themeChange.darkTheme
                            ? BoxShadow(color: Colors.transparent,)
                            : BoxShadow(
                            color: Color.fromRGBO(116, 142, 243, .18),
                            blurRadius: 4,
                            offset: Offset(0, 6))
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Icon(
                        Ionicons.filter,
                        size: 25,
                        color: Color.fromRGBO(77, 105, 216, 1),
                      ),
                    )),
                SizedBox(width: SizeConfig.screenWidth * 0.02),
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
