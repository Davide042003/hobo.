import 'package:flutter/material.dart';
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
                        Icons.arrow_back_ios_outlined,
                        color:
                            Styles.whiteblack(themeChange.darkTheme, context),
                        size: 20,
                      ),
                    ),
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
          SvgPicture.asset("assets/images/CreditCard.svg"),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.02),
                width: SizeConfig.screenWidth * 0.88,
                height: SizeConfig.screenHeight * 0.2,
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
                    offset: Offset(0,9)
                  )
                ]),
              ),
            ],
          ),
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
                color: Styles.whiteblack(themeChange.darkTheme, context)
              ),
            ),
          )
        ]));
  }
}
