import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hobo_test/views/settings_view.dart';
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

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      actions: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.edit, color: Colors.white,),
              Text("Edit", style: TextStyle(fontFamily: Constants.POPPINS, fontSize: 12, color: Colors.white),)
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.delete, color: Colors.white,),
              Text("Remove", style: TextStyle(fontFamily: Constants.POPPINS, fontSize: 12, color: Colors.white),)
            ],
          ),
        ),
      ],
      child: Stack(
        children: [
          Container(
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
                                    fontWeight: FontWeight.w600)),
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
                  SizedBox(width: SizeConfig.screenWidth * 0.05),
                  Expanded(
                      child: Center(
                    child: Text("\$" + widget.price,
                        style: TextStyle(
                            color:
                                Styles.whiteblack(themeChange.darkTheme, context),
                            fontFamily: Constants.POPPINS,
                            fontSize: 23,
                            fontWeight: FontWeight.w500)),
                  ))
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: SizeConfig.screenWidth * 0.065,
                    top: SizeConfig.screenHeight * 0.005),
                child: Container(
                  width: SizeConfig.screenWidth * 0.1,
                  height: SizeConfig.screenHeight * 0.02,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     widget.only18 ? Container(width: SizeConfig.screenWidth * 0.05, child: Center(child: Text("${Emojis.noOneUnderEighteen}", textAlign: TextAlign.center,style: TextStyle(height: 1.2), ))) : Container(),
                      widget.luxury ? Container(width: SizeConfig.screenWidth * 0.05, child: Icon(CustomIcons.diamond, color: Color.fromRGBO(233, 206, 32, 1), size: 12,),) : Container()
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
