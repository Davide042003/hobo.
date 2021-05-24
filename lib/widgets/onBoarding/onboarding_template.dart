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
      sliderImageName: 'assets/images/Onboarding-1.svg',
      sliderHeading: OnBoardingConstants.SLIDER_HEADING_1,
      sliderSubHeading: OnBoardingConstants.SLIDER_DESC_1,
  ),
  OnBoarding(
      sliderImageName: 'assets/images/Onboarding-2.svg',
      sliderHeading: OnBoardingConstants.SLIDER_HEADING_2,
      sliderSubHeading: OnBoardingConstants.SLIDER_DESC_2,
  ),
  OnBoarding(
      sliderImageName: 'assets/images/Onboarding-3.svg',
      sliderHeading: OnBoardingConstants.SLIDER_HEADING_3,
      sliderSubHeading: OnBoardingConstants.SLIDER_DESC_3,
  ),
];
