import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/model/onboarding_model.dart';
import 'package:hobo_test/constants/constants.dart';

class OnBoardingWidget extends StatelessWidget {
  final int index;
  OnBoardingWidget(this.index);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeWidth = size.width;
    final sizeHeight = size.height;

    return Column(
      children: [
        SizedBox(
          height: sizeHeight * .07,
        ),
        SizedBox(
          height: sizeHeight * .078,
        ),
        Text(onBoardingArrayList[index].sliderHeading,
            style: TextStyle(
                fontFamily: Constants.POPPINS,
                fontWeight: FontWeight.bold,
                fontSize: 23)),
        SizedBox(
          height: sizeHeight * .003,
        ),
        Text(onBoardingArrayList[index].sliderSubHeading,
            style: TextStyle(
                fontFamily: Constants.POPPINS,
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: Color.fromRGBO(92, 96, 113, 1))),
        SizedBox(
          height: sizeHeight * 0.15,
        ),
        SizedBox(height: sizeHeight *0.0728),
        Image.asset(onBoardingArrayList[index].sliderImageName, scale: size.aspectRatio),
      ],
    );
  }
}
