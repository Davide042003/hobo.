import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/provider/dark_theme_provider.dart';
import 'package:hobo_test/widgets/styles/constants.dart';
import 'package:hobo_test/widgets/styles/dark_theme_styles.dart';

class PeopleAndDateWidget extends StatefulWidget {
  @override
  _PeopleAndDateWidgetState createState() => _PeopleAndDateWidgetState();
}

class _PeopleAndDateWidgetState extends State<PeopleAndDateWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.065, vertical: SizeConfig.screenHeight * 0.02),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("People",
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                  color: Styles.whiteblack(themeChange.darkTheme, context)))),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("No. of people in your group",
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Styles.tourpreview_subpeople(themeChange.darkTheme, context))))
        ],
      ),
    );
  }
}
