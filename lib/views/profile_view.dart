import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hobo_test/views/chat_view.dart';
import 'package:hobo_test/views/map_view.dart';
import 'package:hobo_test/views/onboarding_view.dart';
import 'package:hobo_test/views/toursummary_view.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/profile/profileimage_widget.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isMe = true;

  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final _leftPositionList = [0.0, 0.28, 0.56];
  double _leftPosition = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
      _leftPosition = _leftPositionList[_currentPage];
      print(_currentPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Stack(
      children: [
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * 0.3,
          child: Image.asset(
            "assets/images/background-profile.png",
            fit: BoxFit.fill,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: SizeConfig.screenWidth * 0.815,
              top: SizeConfig.screenHeight * 0.065),
          width: SizeConfig.screenWidth * 0.11,
          height: SizeConfig.screenHeight * 0.055,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(116, 142, 243, 1),
                Color.fromRGBO(36, 65, 187, 1)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              shape: BoxShape.circle),
          child: isMe
              ? Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.15),
                        blurRadius: 2.0,
                        offset: Offset(0, 1)),
                  ]),
                  child: Icon(Ionicons.settings_outline,
                      color: Colors.white, size: 22),
                )
              : Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.06),
                        blurRadius: 3.0,
                        offset: Offset(0, 6)),
                  ]),
                  child:
                      Icon(Ionicons.chatbubble, color: Colors.white, size: 22),
                ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.08),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(top: SizeConfig.screenHeight * 0.167),
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.38,
                    decoration: BoxDecoration(
                        color: Styles.chat_bar(themeChange.darkTheme, context),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.09),
                              blurRadius: 29,
                              offset: Offset(0, -3)),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.screenHeight * 0.06),
                        Text(
                          "Jessica Smith",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Styles.whiteblack(
                                  themeChange.darkTheme, context)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingBarIndicator(
                              rating: 4.1,
                              itemBuilder: (context, index) => Icon(
                                LineIcons.starAlt,
                                color: Color.fromRGBO(55, 199, 117, 1),
                              ),
                              unratedColor: Styles.tourpreview_stars(
                                  themeChange.darkTheme, context),
                              itemCount: 5,
                              itemSize: 12,
                              itemPadding: EdgeInsets.only(
                                  right: SizeConfig.screenWidth * 0.007),
                              direction: Axis.horizontal,
                            ),
                            SizedBox(width: SizeConfig.screenWidth * 0.02),
                            Text(
                              "4.1" + " (" + "1,252" + ")",
                              style: TextStyle(
                                  fontFamily: Constants.POPPINS,
                                  fontSize: 11,
                                  color: Color.fromRGBO(184, 184, 184, 1),
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.015),
                        Container(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight * 0.001,
                          color: Styles.tourpreview_bar(
                              themeChange.darkTheme, context),
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.02),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.06),
                          child: Row(
                            children: [
                              Container(
                                  width: SizeConfig.screenWidth * 0.04,
                                  child: SvgPicture.asset(
                                    "assets/images/trophy.svg",
                                    fit: BoxFit.contain,
                                  )),
                              SizedBox(width: SizeConfig.screenWidth * 0.05),
                              Text(
                                "Tour Trophies",
                                style: TextStyle(
                                    fontFamily: Constants.POPPINS,
                                    fontSize: 14,
                                    color: Styles.whiteblack(
                                            themeChange.darkTheme, context)
                                        .withOpacity(.5)),
                              ),
                              SizedBox(width: SizeConfig.screenWidth * 0.28),
                              Container(
                                width: SizeConfig.screenWidth * 0.05,
                                height: SizeConfig.screenHeight * 0.025,
                                child: Text(
                                  "25",
                                  style: TextStyle(
                                    fontFamily: Constants.POPPINS,
                                    fontSize: 14,
                                    color: Styles.whiteblack(
                                        themeChange.darkTheme, context),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 10,
                                        color: Color.fromRGBO(187, 187, 187, 1),
                                      )))
                            ],
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.01),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.06),
                          child: Row(
                            children: [
                              Container(
                                  width: SizeConfig.screenWidth * 0.04,
                                  child: SvgPicture.asset(
                                    "assets/images/translate.svg",
                                    fit: BoxFit.contain,
                                  )),
                              SizedBox(width: SizeConfig.screenWidth * 0.05),
                              Text(
                                "Language Known",
                                style: TextStyle(
                                    fontFamily: Constants.POPPINS,
                                    fontSize: 14,
                                    color: Styles.whiteblack(
                                            themeChange.darkTheme, context)
                                        .withOpacity(.5)),
                              ),
                              SizedBox(width: SizeConfig.screenWidth * 0.214),
                              Container(
                                width: SizeConfig.screenWidth * 0.05,
                                height: SizeConfig.screenHeight * 0.025,
                                child: Text(
                                  "6",
                                  style: TextStyle(
                                    fontFamily: Constants.POPPINS,
                                    fontSize: 14,
                                    color: Styles.whiteblack(
                                        themeChange.darkTheme, context),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 10,
                                        color: Color.fromRGBO(187, 187, 187, 1),
                                      )))
                            ],
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.02),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.06),
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight * 0.035,
                          child: Row(
                            children: [
                              Container(
                                height: SizeConfig.screenHeight,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(245, 95, 185, .1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                child: Center(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.screenWidth * 0.03),
                                  child: Text(
                                    "#Food",
                                    style: TextStyle(
                                      fontFamily: Constants.POPPINS,
                                      fontSize: 12,
                                      color: Color.fromRGBO(245, 95, 185, 1),
                                    ),
                                  ),
                                )),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenHeight * 0.02),
                        Container(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight * 0.001,
                          color: Styles.tourpreview_bar(
                              themeChange.darkTheme, context),
                        ),
                        isMe
                            ? Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: SizeConfig.screenWidth * 0.06,
                                      vertical: SizeConfig.screenHeight * 0.02),
                                  child: Container(
                                    width: SizeConfig.screenWidth,
                                    height: SizeConfig.screenHeight,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: SizeConfig.screenWidth * 0.18,
                                          height: SizeConfig.screenHeight,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("125",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Constants.POPPINS,
                                                    fontSize: 16,
                                                    color: Styles.whiteblack(
                                                        themeChange.darkTheme,
                                                        context),
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                              Text("Followers",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Constants.POPPINS,
                                                    fontSize: 13,
                                                    color: Color.fromRGBO(
                                                        167, 167, 167, 1),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            width:
                                                SizeConfig.screenWidth * 0.06),
                                        Container(
                                          width: SizeConfig.screenWidth * 0.18,
                                          height: SizeConfig.screenHeight,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("301",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Constants.POPPINS,
                                                    fontSize: 16,
                                                    color: Styles.whiteblack(
                                                        themeChange.darkTheme,
                                                        context),
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                              Text("Followed",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Constants.POPPINS,
                                                    fontSize: 13,
                                                    color: Color.fromRGBO(
                                                        167, 167, 167, 1),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: SizeConfig.screenWidth * 0.06,
                                      vertical: SizeConfig.screenHeight * 0.02),
                                  child: Container(
                                    width: SizeConfig.screenWidth,
                                    height: SizeConfig.screenHeight,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: SizeConfig.screenWidth * 0.18,
                                          height: SizeConfig.screenHeight,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("125",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Constants.POPPINS,
                                                    fontSize: 16,
                                                    color: Styles.whiteblack(
                                                        themeChange.darkTheme,
                                                        context),
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                              Text("Followers",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Constants.POPPINS,
                                                    fontSize: 13,
                                                    color: Color.fromRGBO(
                                                        167, 167, 167, 1),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            width:
                                                SizeConfig.screenWidth * 0.06),
                                        Container(
                                          width: SizeConfig.screenWidth * 0.18,
                                          height: SizeConfig.screenHeight,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("301",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Constants.POPPINS,
                                                    fontSize: 16,
                                                    color: Styles.whiteblack(
                                                        themeChange.darkTheme,
                                                        context),
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                              Text("Followed",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Constants.POPPINS,
                                                    fontSize: 13,
                                                    color: Color.fromRGBO(
                                                        167, 167, 167, 1),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            width:
                                                SizeConfig.screenWidth * 0.06),
                                        Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical:
                                                  SizeConfig.screenHeight *
                                                      0.0055),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Color.fromRGBO(
                                                          116, 142, 243, 1),
                                                      Color.fromRGBO(
                                                          36, 65, 187, 1)
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end:
                                                        Alignment.bottomCenter),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(40))),
                                            child: Center(
                                              child: Text("Follow",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Constants.POPPINS,
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                          ),
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                              )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.screenHeight * 0.09,
                        left: SizeConfig.screenWidth * 0.285),
                    child: ProfileImageWidget(
                        image: AssetImage("assets/images/provaSocial.jpeg"),
                        initials: "DB"),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.01),
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.4,
                child: Column(
                  children: [
                    Stack(children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.screenHeight * 0.0475),
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight * 0.001,
                        color: Styles.tourpreview_bar(
                            themeChange.darkTheme, context),
                      ),
                      AnimatedPositioned(
                        left: _leftPosition * SizeConfig.screenWidth,
                        child: Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.screenHeight * 0.045),
                          decoration: BoxDecoration(
                              color: Styles.tourpreview_colorprice(
                                  themeChange.darkTheme, context),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          width: SizeConfig.screenWidth * 0.28,
                          height: SizeConfig.screenHeight * 0.003,
                        ),
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              child: Container(
                                width: SizeConfig.screenWidth * 0.28,
                                height: SizeConfig.screenHeight * 0.05,
                                child: Center(
                                    child: Text(
                                  "Tours",
                                  style: TextStyle(
                                      fontFamily: Constants.POPPINS,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: _currentPage == 0
                                          ? Styles.tourpreview_colorprice(
                                              themeChange.darkTheme, context)
                                          : Styles.profile_disabledcolor(
                                              themeChange.darkTheme, context)),
                                )),
                              ),
                              onTap: () => _pageController.jumpToPage(0)),
                          GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              child: Container(
                                width: SizeConfig.screenWidth * 0.28,
                                height: SizeConfig.screenHeight * 0.05,
                                child: Center(
                                    child: Text(
                                  "Gallery",
                                  style: TextStyle(
                                      fontFamily: Constants.POPPINS,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: _currentPage == 1
                                          ? Styles.tourpreview_colorprice(
                                              themeChange.darkTheme, context)
                                          : Styles.profile_disabledcolor(
                                              themeChange.darkTheme, context)),
                                )),
                              ),
                              onTap: () => _pageController.jumpToPage(1)),
                          GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              child: Container(
                                width: SizeConfig.screenWidth * 0.28,
                                height: SizeConfig.screenHeight * 0.05,
                                child: Center(
                                    child: Text(
                                  "Reviews",
                                  style: TextStyle(
                                      fontFamily: Constants.POPPINS,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: _currentPage == 2
                                          ? Styles.tourpreview_colorprice(
                                              themeChange.darkTheme, context)
                                          : Styles.profile_disabledcolor(
                                              themeChange.darkTheme, context)),
                                )),
                              ),
                              onTap: () => _pageController.jumpToPage(2)),
                        ],
                      ),
                    ]),
                    Expanded(
                        child: PageView(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: _onPageChanged,
                      children: [Container(width: 100,height: 100,color: Colors.orange,),Container(width: 100,height: 100,color: Colors.black,),Container(width: 100,height: 100,color: Colors.yellow,)],
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
