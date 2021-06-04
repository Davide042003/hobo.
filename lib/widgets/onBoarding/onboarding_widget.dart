import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/onBoarding/onboarding_template.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class OnBoardingWidget extends StatelessWidget {
  final int index;

  OnBoardingWidget(this.index);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * .07,
        ),
        SizedBox(
          height: SizeConfig.screenHeight * .078,
        ),
        Text(onBoardingArrayList[index].sliderHeading,
            style: TextStyle(
                fontFamily: Constants.POPPINS,
                fontWeight: FontWeight.bold,
                fontSize: 25,
            color: Styles.onboarding_heading_color(themeChange.darkTheme, context)),textAlign: TextAlign.center,),
        SizedBox(
          height: SizeConfig.screenHeight * .003,
        ),
        Text(onBoardingArrayList[index].sliderSubHeading,
            style: TextStyle(
                fontFamily: Constants.POPPINS,
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Styles.onboarding_subheading_color(themeChange.darkTheme, context)),textAlign: TextAlign.center),
        Expanded(
          child: SvgPicture.asset(
            onBoardingArrayList[index].sliderImageName,
            width: SizeConfig.screenWidth,
            alignment: Alignment.bottomCenter,
          ),
        )
      ],
    );
  }
}
