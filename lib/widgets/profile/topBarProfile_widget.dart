import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    Key key,
    @required this.animationPos,
    @required this.themeChange,
  }) : super(key: key);

  final double animationPos;
  final DarkThemeProvider themeChange;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: animationPos,
      duration: Duration(milliseconds: 250),
      child: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight*0.1,
        color: Styles.blackwhite(themeChange.darkTheme, context),
        child: Padding(
          padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.07,right: SizeConfig.screenWidth*0.02, top: SizeConfig.screenHeight*0.045),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Jessica Smith", style: TextStyle(
                  fontFamily: Constants.POPPINS,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Styles.whiteblack(themeChange.darkTheme, context)
              ),),
              SizedBox(width: SizeConfig.screenWidth*0.3),
              Container(
                width: SizeConfig.screenWidth * 0.1,
                height: SizeConfig.screenHeight,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Ionicons.add_circle_outline, size: 30, color: Styles.whiteblack(themeChange.darkTheme, context),
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth* 0.025,),
              Container(
                width: SizeConfig.screenWidth * 0.1,
                height: SizeConfig.screenHeight,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                      Ionicons.settings_outline, size: 30,color: Styles.whiteblack(themeChange.darkTheme, context)
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
