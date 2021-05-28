import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'package:hobo_test/widgets/styles/constants.dart';
import 'package:hobo_test/widgets/styles/dark_theme_styles.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/provider/dark_theme_provider.dart';
import 'package:ionicons/ionicons.dart';
import 'package:hobo_test/widgets/home/hotplaces_template.dart';

class HotPlacesWidget extends StatelessWidget {
  final int index;

  HotPlacesWidget(this.index);

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
          child: Image.asset(hotPlacesArrayList[index].hotPlaceNameBackImageBig,
              fit: BoxFit.fill),
        ),
        Positioned(
          left: SizeConfig.screenWidth * 0.375,
          top: SizeConfig.screenHeight * 0.061,
          child: Container(
            height: SizeConfig.screenHeight * 0.8,
            child: Image.asset(
              hotPlacesArrayList[index].hotPlaceNameFrontImageBig,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.screenWidth * 0.095,
              top: SizeConfig.screenHeight * 0.025),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(hotPlacesArrayList[index].hotPlaceName,
                    style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                            offset: Offset(5.0, 0.0),
                            blurRadius: 6.0,
                            color: Colors.black.withOpacity(.11),
                          ),
                        ])),
              ),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: hotPlacesArrayList[index].rating,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                    unratedColor: Colors.white.withOpacity(.28),
                    itemCount: 5,
                    itemSize: 25.0,
                    direction: Axis.horizontal,
                  ),
                  SizedBox(width: SizeConfig.screenWidth * 0.02),
                  Text(
                    hotPlacesArrayList[index].rating.toString() +
                        " (" +
                        hotPlacesArrayList[index].numberRatings.toString() +
                        "K)",
                    style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              SizedBox(height: SizeConfig.screenHeight*0.43),
              Align(alignment: Alignment.bottomLeft, child: Text("About " + hotPlacesArrayList[index].hotPlaceName,style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,fontFamily: Constants.POPPINS,color: Colors.white))),
              Align(alignment: Alignment.bottomLeft, child: Container(width:SizeConfig.screenWidth*0.6,child: Text(hotPlacesArrayList[index].description,style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal,fontFamily: Constants.POPPINS,color: Colors.white, height: SizeConfig.screenHeight*0.002))))

            ],
          ),
        )
      ],
    );
  }
}
