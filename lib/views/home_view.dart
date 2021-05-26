import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hobo_test/widgets/home/profileimagehome_widget.dart';
import 'package:hobo_test/widgets/styles/dark_theme_styles.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'package:hobo_test/widgets/styles/constants.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/provider/dark_theme_provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
        body: Container(
      color: Styles.loginregister_background(themeChange.darkTheme, context),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.01),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: SizeConfig.screenWidth * 0.075,
                        left: SizeConfig.screenWidth * 0.075),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Explore",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Styles.whiteblack(
                                  themeChange.darkTheme, context)),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.47,
                        ),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(.3), blurRadius: 7, offset: Offset(0,6))],
                          ),child: ProfileImageHomeWidget(image: AssetImage("assets/images/provaSocial.jpeg"), initials: "DB"))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
