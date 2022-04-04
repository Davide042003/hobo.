import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class CardTourAddWidget extends StatefulWidget {
  final String boldText;
  final String textDescription;
  final String price;
  final bool only18;
  final bool luxury;

  const CardTourAddWidget(
      {Key key,
      this.boldText,
      this.textDescription,
      this.price,
      this.only18,
      this.luxury})
      : super(key: key);

  @override
  _CardTourAddWidgetState createState() => _CardTourAddWidgetState();
}

class _CardTourAddWidgetState extends State<CardTourAddWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
   SlidableController controller;

    return Slidable(
      /*
      controller: controller,
      startActionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.13,
      secondaryActions: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(245, 95, 185, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(CustomIcons.pen, size: 20, color: Colors.white,),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 119, 255, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.delete, size: 24, color: Colors.white,),
            ],
          ),
        ),
      ],

       */
      child: Stack(
        children: [
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.11,
            decoration: BoxDecoration(
              color: Styles.blackwhite(themeChange.darkTheme, context),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.065),
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
                                text: widget.boldText,
                                style: TextStyle(
                                    color: Color.fromRGBO(245, 95, 185, 1),
                                    fontFamily: Constants.POPPINS,
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: ' ' + widget.textDescription,
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
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: SizeConfig.screenWidth * 0.07),
                        child: Align(
                          alignment: Alignment.centerRight,
                    child: Text("\$" + widget.price,
                          style: TextStyle(
                              color:
                                  Styles.whiteblack(themeChange.darkTheme, context),
                              fontFamily: Constants.POPPINS,
                              fontSize: 23,
                              fontWeight: FontWeight.w500)),
                  ),
                      ))
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.screenWidth * 0.055,
                    top: SizeConfig.screenHeight * 0.08),
                child: Container(
                  width: SizeConfig.screenWidth * 0.1,
                  height: SizeConfig.screenHeight * 0.02,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      widget.luxury ? Container(width: SizeConfig.screenWidth * 0.05, child: Icon(CustomIcons.diamond, color: Color.fromRGBO(233, 206, 32, 1), size: 12,),) : Container(),
                      widget.only18 ? Container(width: SizeConfig.screenWidth * 0.05, child: Icon(CustomIcons.no_under18, color: Color.fromRGBO(112, 112, 112, 1), size: 12,),) : Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
