import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hobo_test/widgets/home/cardtour_template.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/home/profileimagehome_widget.dart';

class ChatCardWidget extends StatefulWidget {
  final int index;

  ChatCardWidget({
    @required this.index,
  });

  @override
  _ChatCardWidgetState createState() => _ChatCardWidgetState();
}

class _ChatCardWidgetState extends State<ChatCardWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      width: SizeConfig.screenWidth * 0.86,
      height: SizeConfig.screenHeight * 0.09,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Styles.cardtour_map(themeChange.darkTheme, context),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 29,
              offset: Offset(0, 3))
        ],
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.05),
        child: Row(children: [
         ProfileImageHomeWidget(image: AssetImage("assets/images/provaSocial.jpeg"), initials: "DB"),
          Container(
            margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.045,
                top: SizeConfig.screenHeight * 0.017,
                bottom: SizeConfig.screenHeight * 0.017),
            width: SizeConfig.screenWidth * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Oliver Queen",
                    style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color:
                            Styles.whiteblack(themeChange.darkTheme, context))),
                Text("Thanks for your help",
                    style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color:
                            Styles.whiteblack(themeChange.darkTheme, context))),
              ],
            ),
          ),
          Expanded(
              child: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.023),
                  child: Container(
                    width: SizeConfig.screenWidth * 0.045,
                    height: SizeConfig.screenHeight * 0.045,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(55, 199, 117, 1),
                      shape: BoxShape.circle
                    ),
                    child: Center(
                      child: Text("1",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.03),
                  child: Text("Just Now",
                      style: TextStyle(
                          fontFamily: Constants.POPPINS,
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(183, 183, 183, 1))),
                ),
              )
            ],
          ))
        ]),
      ),
    );
  }
}
