import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/provider/dark_theme_provider.dart';
import 'package:hobo_test/widgets/styles/constants.dart';
import 'package:hobo_test/widgets/styles/dark_theme_styles.dart';
import 'package:hobo_test/widgets/styles/constants.dart';

class CategoriesWidget extends StatelessWidget {
  final Color colorBackground;
  final double widthBackground;
  final IconData icon;
  final String category;

  CategoriesWidget(this.colorBackground, this.widthBackground, this.icon, this.category);

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
          height: SizeConfig.screenWidth * 0.08,
        ),
        Container(
          margin: EdgeInsets.only(left: SizeConfig.screenWidth * 0.01),
          width: SizeConfig.screenWidth * widthBackground,
          height: SizeConfig.screenWidth * 0.08,
          child: Row(children: [
            Container(
              height: SizeConfig.screenHeight * 0.055,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(116, 142, 243, 1),
                      Color.fromRGBO(36, 65, 187, 1)
                    ]),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(63, 83, 216, .23),
                      blurRadius: 4,
                      offset: Offset(0, 6))
                ],
              ),
              child: Container(
                width: SizeConfig.screenWidth * 0.065,
                height: 11,
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.15),
                      blurRadius: 2.0,
                      offset: Offset(0, 1)),
                ]),
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
