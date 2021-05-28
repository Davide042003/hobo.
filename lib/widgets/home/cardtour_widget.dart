import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hobo_test/widgets/styles/dark_theme_styles.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/provider/dark_theme_provider.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'package:hobo_test/widgets/styles/constants.dart';
import 'package:ionicons/ionicons.dart';

class CardTourWidget extends StatefulWidget {
  @override
  _CardTourWidgetState createState() => _CardTourWidgetState();
}

class _CardTourWidgetState extends State<CardTourWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      width: SizeConfig.screenWidth * 0.86,
      height: SizeConfig.screenHeight * 0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Styles.cardtour_map(themeChange.darkTheme, context),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth*0.05),
        child: Row(children: [
          Container(
            width: SizeConfig.screenWidth*0.17,
            height: SizeConfig.screenHeight*0.08,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
            child: Image.asset("assets/images/Paris-Background.png", fit: BoxFit.fill,),
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.015, left: SizeConfig.screenWidth * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Eiffel Tower", style: TextStyle(fontFamily: Constants.POPPINS, fontSize: 16, fontWeight: FontWeight.w600, color: Styles.whiteblack(themeChange.darkTheme, context)),),
                Row(
                  children:[ RatingBarIndicator(
                    rating: 4,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Color.fromRGBO(55, 199, 117, 1),
                    ),
                    unratedColor: Colors.black.withOpacity(.28),
                    itemCount: 5,
                    itemSize: 14,
                    direction: Axis.horizontal,
                  ),
                    SizedBox(width: SizeConfig.screenWidth * 0.02),
                    Text(
                      "4.1" +
                          " (" +
                          "100" +
                          "K)",
                      style: TextStyle(
                          fontFamily: Constants.POPPINS,
                          fontSize: 12,
                          color: Color.fromRGBO(184, 184, 184, 1),
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    )
            ]
                ),
                Text("\$50", style: TextStyle(fontFamily: Constants.POPPINS, fontSize: 20, fontWeight: FontWeight.w300, color: Styles.whiteblack(themeChange.darkTheme, context)),),
              ],
            ),
          )
        ]),
      ),
    );
  }
}