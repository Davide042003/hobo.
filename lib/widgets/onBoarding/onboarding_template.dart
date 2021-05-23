import 'package:flutter/cupertino.dart';
import 'package:hobo_test/widgets/onBoarding/onboarding_constants.dart';

class OnBoarding {
  final String sliderImageName;
  final String sliderHeading;
  final String sliderSubHeading;

  OnBoarding(
      {@required this.sliderImageName,
      @required this.sliderHeading,
      @required this.sliderSubHeading,});
}

final onBoardingArrayList = [
  OnBoarding(
      sliderImageName: 'assets/images/Onboarding-1.png',
      sliderHeading: Constants.SLIDER_HEADING_1,
      sliderSubHeading: Constants.SLIDER_DESC_1,
  ),
  OnBoarding(
      sliderImageName: 'assets/images/slider_2.png',
      sliderHeading: Constants.SLIDER_HEADING_2,
      sliderSubHeading: Constants.SLIDER_DESC_2,
  ),
  OnBoarding(
      sliderImageName: 'assets/images/slider_3.png',
      sliderHeading: Constants.SLIDER_HEADING_3,
      sliderSubHeading: Constants.SLIDER_DESC_3,
  ),
];
