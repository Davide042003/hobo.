import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class CategoriesSelectedWidget extends StatelessWidget {
  final Color colorBackground;
  final Color colorBackgroundIconEnd;
  final double widthBackground;
  final IconData icon;
  final String category;

  CategoriesSelectedWidget(this.colorBackground, this.colorBackgroundIconEnd, this.widthBackground, this.icon, this.category);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color: colorBackground,
          ),
          width: SizeConfig.screenWidth * widthBackground,
          height: SizeConfig.screenHeight * 0.04,
        ),
        Container(
          margin: EdgeInsets.only(left: SizeConfig.screenWidth * 0.01),
          width: SizeConfig.screenWidth * widthBackground,
          height: SizeConfig.screenHeight * 0.04,
          child: Row(children: [
             Container(
              width: SizeConfig.screenWidth * 0.05,
              height: SizeConfig.screenHeight,
              child: Center(
                child: Icon(
                  CustomIcons.close,
                  size: 14,
                  color: Styles.whiteblack(
                      themeChange.darkTheme, context).withOpacity(0.3),
                ),
              ),
            ),
            Container(
              height: SizeConfig.screenHeight * 0.055,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      colorBackground.withOpacity(1),
                      colorBackgroundIconEnd
                    ]),
                boxShadow: [
                  themeChange.darkTheme ? BoxShadow (): BoxShadow(
                      color: colorBackground.withOpacity(.65),
                      blurRadius: 6.0,
                      offset: Offset(0, 3))
                ],
              ),
              child: Container(
                width: SizeConfig.screenWidth * 0.065,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Icon(icon, color: Colors.white, size: 13),
              ),
            ),
            SizedBox(width: SizeConfig.screenWidth *0.02,),
            Text(category, style: TextStyle(fontFamily: Constants.POPPINS, fontSize: 13, fontWeight: FontWeight.w500, color: Styles.categories_text(themeChange.darkTheme, context)))
          ]),
        ),
      ],
    );
  }
}
