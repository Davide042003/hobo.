import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/home/profileimagehome_widget.dart';
import 'package:hobo_test/widgets/social/socialprofilelike_widget.dart';
import 'package:hobo_test/widgets/social/descriptiontext_widget.dart';

class PostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
          ),
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.3,
            color: Colors.black,
            child: Image.asset(
              "assets/images/image-social-1.png",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: SizeConfig.screenHeight*0.008),
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.04,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.065),
                child: Row(
                  children: [
                    Container(
                      width: SizeConfig.screenWidth * 0.1,
                      height: SizeConfig.screenHeight,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          LineIcons.heart,
                          size: 22,
                          color:
                              Styles.whiteblack(themeChange.darkTheme, context),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.01),
                    Container(
                      width: SizeConfig.screenWidth * 0.1,
                      height: SizeConfig.screenHeight,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Ionicons.chatbubble_outline,
                          size: 22,
                          color:
                              Styles.whiteblack(themeChange.darkTheme, context),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.01),
                    Container(
                      width: SizeConfig.screenWidth * 0.1,
                      height: SizeConfig.screenHeight,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Ionicons.share_outline,
                          size: 22,
                          color:
                              Styles.whiteblack(themeChange.darkTheme, context),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.01),
                    Container(
                      width: SizeConfig.screenWidth * 0.35,
                      height: SizeConfig.screenHeight,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(
                              CustomIcons.pinlocationicon,
                              size: 22,
                              color: Styles.social_gototour(
                                  themeChange.darkTheme, context),
                            ),
                            SizedBox(width: SizeConfig.screenWidth * 0.01),
                            Text(
                              "GO TO THE TOUR",
                              style: TextStyle(
                                  fontFamily: Constants.POPPINS,
                                  fontSize: 13,
                                  color: Styles.social_gototour(
                                      themeChange.darkTheme, context)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: SizeConfig.screenWidth * 0.1,
                        height: SizeConfig.screenHeight,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            LineIcons.addToShoppingCart,
                            size: 22,
                            color:
                            Styles.whiteblack(themeChange.darkTheme, context),
                          ),
                        ),
                      ),
                    ))
                  ],
                )),
          ),
          SizedBox(height: SizeConfig.screenHeight *0.002),
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.03,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.065),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: SizeConfig.screenWidth *0.1),
                          child: ProfileImageSocialWidget(image: AssetImage("assets/images/provaSocial.jpeg"), initials: "DB"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: SizeConfig.screenWidth *0.05),
                          child: ProfileImageSocialWidget(image: AssetImage("assets/images/provaSocial.jpeg"), initials: "DB"),
                        ),
                        ProfileImageSocialWidget(image: AssetImage("assets/images/provaSocial.jpeg"), initials: "DB"),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.02),
                      child: RichText(text: TextSpan(
                        text: "Liked by ",
                        style: TextStyle(fontFamily: Constants.POPPINS, fontSize: 10, color: Styles.whiteblack(themeChange.darkTheme, context)),
                        children: [
                          TextSpan(
                              text: "jonhsmith",
                              style: TextStyle(fontWeight: FontWeight.w600)
                          ),
                          TextSpan(
                              text: " and ",
                          ),
                          TextSpan(
                              text: "45 others",
                              style: TextStyle(fontWeight: FontWeight.w600)
                          )
                        ]
                      )),
                    )
                  ],
                )),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth*0.065, vertical: SizeConfig.screenHeight *0.01),
            width: SizeConfig.screenWidth,
            child: DescriptionTextWidget(text : "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit."),
          ),
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.014,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.065),
                child: Text(
                  "View all 3 comments",
                  style: TextStyle(fontFamily: Constants.POPPINS, fontSize: 10, color: Styles.social_sub(themeChange.darkTheme, context)),
                )),
          ),
          SizedBox(height: SizeConfig.screenHeight*0.1,)
        ],
      ),
    );
  }
}
