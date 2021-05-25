import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/onBoarding/onboarding_template.dart';
import 'package:hobo_test/widgets/constants.dart';
import 'package:hobo_test/widgets/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hobo_test/widgets/dark_theme_styles.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/dark_theme_provider.dart';
import 'package:hobo_test/widgets/dark_theme_styles.dart';

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
                fontSize: 23,
            color: Styles.onboarding_heading_color(themeChange.darkTheme, context))),
        SizedBox(
          height: SizeConfig.screenHeight * .003,
        ),
        Text(onBoardingArrayList[index].sliderSubHeading,
            style: TextStyle(
                fontFamily: Constants.POPPINS,
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: Styles.onboarding_subheading_color(themeChange.darkTheme, context))),
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
