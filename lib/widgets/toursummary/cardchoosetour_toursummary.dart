import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/provider/dark_theme_provider.dart';
import 'package:hobo_test/widgets/styles/constants.dart';
import 'package:hobo_test/widgets/styles/dark_theme_styles.dart';

class CardChooseTourWidget extends StatefulWidget {
  @override
  _CardChooseTourWidgetState createState() => _CardChooseTourWidgetState();
}

class _CardChooseTourWidgetState extends State<CardChooseTourWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GestureDetector(
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.065),
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight * 0.09,
        decoration: BoxDecoration(
            color: Styles.blackwhite(themeChange.darkTheme, context),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: isSelected ? Border.all(color: Color.fromRGBO(116, 142, 243, 1), width: 1) : null,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.09),
                  blurRadius: 29,
                  offset: Offset(0, 3))
            ],
        ),
        child: Row(
          children: [
            Container(
              width: SizeConfig.screenWidth * 0.15,
              height: SizeConfig.screenHeight,
              child: isSelected
                  ? Container(
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.047),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(116, 142, 243, 1),
                          Color.fromRGBO(36, 65, 187, 1)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Icon(
                  LineIcons.check,
                  color: Colors.white,
                  size: 13,
                ),
              )
                  : Icon(
                LineIcons.circle,
                size: 28,
                color: Color.fromRGBO(222, 222, 222, 1),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth * 0.47,
              height: SizeConfig.screenHeight,
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Neque porro ',
                          style: TextStyle(
                              color: Color.fromRGBO(245, 95, 185, 1),
                              fontFamily: Constants.POPPINS,
                              fontSize: 13.5,
                              fontWeight: FontWeight.w600)),
                      TextSpan(
                          text: 'quisquam est qui dolorem',
                          style: TextStyle(
                              color: Styles.whiteblack(
                                  themeChange.darkTheme, context),
                              fontFamily: Constants.POPPINS,
                              fontSize: 13.5,
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: SizeConfig.screenWidth * 0.05),
            Expanded(
                child: Center(
              child: Text('\$15',
                  style: TextStyle(
                      color: Styles.whiteblack(themeChange.darkTheme, context),
                      fontFamily: Constants.POPPINS,
                      fontSize: 23,
                      fontWeight: FontWeight.w500)),
            ))
          ],
        ),
      ),
      onTap: () {
        setState(() {
          if (isSelected) {
            isSelected = false;
          } else {
            isSelected = true;
          }
        });
      },
    );
  }
}
