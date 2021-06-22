import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';


class CardTourAddWidget extends StatefulWidget {
  @override
  _CardTourAddWidgetState createState() => _CardTourAddWidgetState();
}

class _CardTourAddWidgetState extends State<CardTourAddWidget> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.09,
      decoration: BoxDecoration(
        color: Styles.blackwhite(themeChange.darkTheme, context),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.09),
              blurRadius: 29,
              offset: Offset(0, 3))
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: SizeConfig.screenWidth *0.065),
        child: Row(
          children: [
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
    );
  }
}