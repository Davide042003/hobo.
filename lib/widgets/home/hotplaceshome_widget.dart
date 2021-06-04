import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hobo_test/widgets/home/hotplaces_template.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class HotPlacesHomeWidget extends StatelessWidget {
  final int index;

  HotPlacesHomeWidget(this.index);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          width: SizeConfig.screenWidth * 0.34,
          height: SizeConfig.screenHeight,
          child: Image.asset(hotPlacesArrayList[index].hotPlaceNameBackImage, fit: BoxFit.fill),
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Container(
                width: SizeConfig.screenWidth * 0.19,
                margin: EdgeInsets.only(left: SizeConfig.screenWidth * 0.225),
                child: Image.asset(
                  hotPlacesArrayList[index].hotPlaceNameFrontImage,
                  height: SizeConfig.screenHeight * 0.17,
                ))),
        Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.screenWidth * 0.05,
                    bottom: SizeConfig.screenHeight * 0.017),
                child: Text(hotPlacesArrayList[index].hotPlaceName,
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
