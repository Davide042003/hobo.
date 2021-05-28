import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'package:hobo_test/widgets/styles/constants.dart';
import 'package:hobo_test/widgets/styles/dark_theme_styles.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/provider/dark_theme_provider.dart';
import 'package:ionicons/ionicons.dart';

class HotPlacesWidget extends StatelessWidget {
  final String imageBackground;
  final String imageFore;
  final String place;

  HotPlacesWidget(this.imageBackground, this.imageFore, this.place);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          width: SizeConfig.screenWidth * 0.9,
          height: SizeConfig.screenHeight * 0.8,
          child: Image.asset(imageBackground, fit: BoxFit.fill),
        ),
        Positioned(
          left: SizeConfig.screenWidth * 0.46,
          top: SizeConfig.screenHeight*0.15,
          child: Container(
            height: SizeConfig.screenHeight*0.65,
            child: Image.asset(
              imageFore,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.screenWidth * 0.05,
                    bottom: SizeConfig.screenHeight * 0.017),
                child: Text(place,
                    style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        color: Colors.white,
                        fontSize: 18.5,
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                            offset: Offset(5.0, 0.0),
                            blurRadius: 6.0,
                            color: Colors.black.withOpacity(.11),
                          ),
                        ]))))
      ],
    );
  }
}
