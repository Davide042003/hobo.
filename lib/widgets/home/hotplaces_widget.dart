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
  final String place;

  HotPlacesWidget(this.imageBackground, this.place);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          width: SizeConfig.screenWidth * 0.85,
          height: SizeConfig.screenHeight * 0.83,
          child: Image.asset(imageBackground, fit: BoxFit.fill),
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
