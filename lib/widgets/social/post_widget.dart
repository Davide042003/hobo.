import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/chat/profileimagechat_widget.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/home/profileimagehome_widget.dart';
import 'package:hobo_test/widgets/profile/profileimage_widget.dart';

class PostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.4,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: Offset(0, 3))
      ]),
      child: Column(
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.08,
            color: Styles.blackwhite(themeChange.darkTheme, context),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight * 0.01,
                  horizontal: SizeConfig.screenWidth * 0.065),
              child: Row(
                children: [
                  ProfileImageHomeWidget(
                      image: AssetImage("assets/images/provaSocial.jpeg"),
                      initials: "DB"),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.03,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bruce Wayne",
                        style: TextStyle(
                            fontFamily: Constants.POPPINS,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Styles.whiteblack(
                                themeChange.darkTheme, context)),
                      ),
                      Row(
                        children: [
                          Icon(CustomIcons.pinlocationicon,
                              size: 10,
                              color: Styles.social_profile(
                                  themeChange.darkTheme, context)),
                          SizedBox(
                            width: SizeConfig.screenWidth * 0.01,
                          ),
                          Text(
                            "San Francisco, California",
                            style: TextStyle(
                                fontFamily: Constants.POPPINS,
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Styles.social_profile(
                                    themeChange.darkTheme, context)),
                          ),
                        ],
                      )
                    ],
                  ),
                  Expanded(
                      child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: Icon(Icons.more_vert_rounded,
                          color: Styles.social_profile(
                              themeChange.darkTheme, context)),
                    ),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
