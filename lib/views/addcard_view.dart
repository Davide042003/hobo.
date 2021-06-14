import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddCardView extends StatefulWidget {
  @override
  _AddCardViewState createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
        backgroundColor:
            Styles.loginregister_background(themeChange.darkTheme, context),
        body: Column(children: [
          Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.13,
              child: Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.screenWidth * 0.02,
                    top: SizeConfig.screenHeight * 0.04),
                child: Row(children: [
                  GestureDetector(
                    child: Container(
                      width: SizeConfig.screenWidth * 0.125,
                      height: SizeConfig.screenHeight,
                      child: Icon(
                        CustomIcons.backarrow,
                        color:
                            Styles.whiteblack(themeChange.darkTheme, context),
                        size: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: SizeConfig.screenWidth * 0.04),
                  Text(
                    "Add New Card",
                    style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        color:
                            Styles.whiteblack(themeChange.darkTheme, context),
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                ]),
              )),
          CardItem(themeChange, context),
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.06),
            width: SizeConfig.screenWidth,
            child: Text(
              "Type in your card Details",
              style: TextStyle(
                  fontFamily: Constants.POPPINS,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Styles.whiteblack(themeChange.darkTheme, context)),
            ),
          )
        ]));
  }

  Container CardItem(DarkThemeProvider themeChange, BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.88,
      height: SizeConfig.screenHeight * 0.22,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(35, 72, 145, 1),
            Color.fromRGBO(38, 146, 217, 1),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(17, 37, 122, .28),
                blurRadius: 13,
                offset: Offset(0, 9))
          ]),
      child: Stack(
        children: [
          Container(
              width: SizeConfig.screenWidth * 0.88,
              height: SizeConfig.screenHeight * 0.22,
              child: Image.asset(
                "assets/images/CreditCard.png",
                fit: BoxFit.fill,
              )),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.07,
                vertical: SizeConfig.screenHeight * 0.023),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: SizeConfig.screenWidth * 0.12,
                  height: SizeConfig.screenHeight * 0.025,
                  color: Colors.white,
                ),
                Text(
                  "DAVIDE DE BLASIO",
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 14,
                      color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.screenWidth * 0.25,
                      top: SizeConfig.screenHeight * 0.008),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("VALID \nTHRU",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 7,
                              color: Colors.white,
                              height: 0.8)),
                      Text("25/02",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 13,
                              color: Colors.white))
                    ],
                  ),
                ),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "**** - **** - **** - " + "1234",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 15,
                              color: Colors.white,
                              letterSpacing: SizeConfig.screenWidth * 0.004),
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }
}
