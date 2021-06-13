import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class TagWidget extends StatelessWidget {
  final Color startColor;
  final Color finalColor;
  final String tag;

  const TagWidget({Key key, this.startColor, this.finalColor, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight*0.022),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              colors: [
               startColor,
               finalColor
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          )
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth*0.035),
          child: Text(
            tag,
            style: TextStyle(fontFamily: Constants.POPPINS, fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
