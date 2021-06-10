import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/profile/gallery_widget.dart';
import 'package:hobo_test/widgets/profile/profileimage_widget.dart';
import 'package:hobo_test/widgets/profile/reviewcard_widget.dart';
import 'package:hobo_test/widgets/profile/tourlistprofile_widget.dart';
import 'package:hobo_test/widgets/provider/navigationbar_provider.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with TickerProviderStateMixin{
  bool isMe = true;

  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final _leftPositionList = [0.0, 0.333, 0.666];
  double _leftPosition = 0;
  final ScrollController _scrollController = ScrollController();
  double animationPos;
  bool visible = false;
  bool pinnedAppBar = false;

  @override
  void initState() {
    super.initState();
    _scrollController..addListener(() {
      if (_scrollController.offset >= SizeConfig.screenHeight * 0.2) {
        setState(() {
          visible = true;
        });
      } else if (_scrollController.offset <= SizeConfig.screenHeight * 0.18) {
        setState(() {
          visible = false;
        });
      }

      if (_scrollController.offset >= SizeConfig.screenHeight * 0.448) {
        setState(() {
          pinnedAppBar = true;
        });
      } else if (_scrollController.offset < SizeConfig.screenHeight * 0.448) {
        setState(() {
          pinnedAppBar = false;
        });
      }

      if (_scrollController.offset < SizeConfig.screenHeight * 0.25) {
        if (_scrollController.offset >= SizeConfig.screenHeight * 0.2 &&
            _scrollController.offset <= SizeConfig.screenHeight * 0.24) {
          double pos = ((_scrollController.offset -
              SizeConfig.screenHeight * 0.2) /
              (SizeConfig.screenHeight * 0.24 - SizeConfig.screenHeight * 0.2));
          animationPos = pos;
        }
      } else {
        animationPos = 1;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
      _leftPosition = _leftPositionList[_currentPage];
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final downScroll = Provider.of<NavigationBarProvider>(context);

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {

        if (scrollNotification is ScrollUpdateNotification) {
          if(_scrollController.position.userScrollDirection == ScrollDirection.reverse){
            setState(() {
              downScroll.navigationdown = true;
            });
          }else if(_scrollController.position.userScrollDirection == ScrollDirection.forward) {
            setState(() {
              downScroll.navigationdown = false;
            });
          }
        } else if (scrollNotification is ScrollEndNotification) {
          setState(() {
            downScroll.navigationdown = false;
          });
        }
      },
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            controller: _scrollController,
            child: Stack(
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
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.15),
                                blurRadius: 2.0,
                                offset: Offset(0, 1)),
                          ]),
                          child: Icon(Ionicons.settings_outline,
                              color: Colors.white, size: 22),
                        )
                      : Container(
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.06),
                                blurRadius: 3.0,
                                offset: Offset(0, 6)),
                          ]),
                          child: Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.005),
                            child: Icon(CustomIcons.messagge,
                                color: Colors.white, size: 32),
                          ),
                        ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.08),
                      child: Stack(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: SizeConfig.screenHeight * 0.167),
                            width: SizeConfig.screenWidth,
                            height: SizeConfig.screenHeight * 0.38,
                            decoration: BoxDecoration(
                                color:
                                    Styles.chat_bar(themeChange.darkTheme, context),
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
                                                color:
                                                    Color.fromRGBO(187, 187, 187, 1),
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
                                                color:
                                                    Color.fromRGBO(187, 187, 187, 1),
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))),
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
                                              horizontal:
                                                  SizeConfig.screenWidth * 0.06,
                                              vertical:
                                                  SizeConfig.screenHeight * 0.02),
                                          child: Container(
                                            width: SizeConfig.screenWidth,
                                            height: SizeConfig.screenHeight,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  width:
                                                      SizeConfig.screenWidth * 0.18,
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
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                                    width: SizeConfig.screenWidth *
                                                        0.06),
                                                Container(
                                                  width:
                                                      SizeConfig.screenWidth * 0.18,
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
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                              horizontal:
                                                  SizeConfig.screenWidth * 0.06,
                                              vertical:
                                                  SizeConfig.screenHeight * 0.02),
                                          child: Container(
                                            width: SizeConfig.screenWidth,
                                            height: SizeConfig.screenHeight,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  width:
                                                      SizeConfig.screenWidth * 0.18,
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
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                                    width: SizeConfig.screenWidth *
                                                        0.06),
                                                Container(
                                                  width:
                                                      SizeConfig.screenWidth * 0.18,
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
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                                    width: SizeConfig.screenWidth *
                                                        0.06),
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
                                                            begin:
                                                                Alignment.topCenter,
                                                            end: Alignment
                                                                .bottomCenter),
                                                        borderRadius:
                                                            BorderRadius.all(
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
                    ),
                    Container(
                      margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.01),
                      width: SizeConfig.screenWidth,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        pinnedAppBar ? SizedBox(height: SizeConfig.screenHeight *0.05,) :  Stack(children: [
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
                                width: SizeConfig.screenWidth * 0.333,
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
                                      width: SizeConfig.screenWidth * 0.333,
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
                                                    themeChange.darkTheme,
                                                    context)),
                                      )),
                                    ),
                                    onTap: () => _pageController.jumpToPage(0)),
                                GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    child: Container(
                                      width: SizeConfig.screenWidth * 0.333,
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
                                                    themeChange.darkTheme,
                                                    context)),
                                      )),
                                    ),
                                    onTap: () => _pageController.jumpToPage(1)),
                                GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    child: Container(
                                      width: SizeConfig.screenWidth * 0.333,
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
                                                    themeChange.darkTheme,
                                                    context)),
                                      )),
                                    ),
                                    onTap: () => _pageController.jumpToPage(2)),
                              ],
                            ),
                          ]),
                          ExpandablePageView(
                            controller: _pageController,
                            onPageChanged: _onPageChanged,
                            children: [
                              TourlistProfileWidget(),
                              GalleryWidget(),
                              ReviewCardWidget()
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          visible ? AnimatedOpacity(
            opacity: animationPos,
            duration: Duration(milliseconds: 250),
            child: Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight*0.1,
              color: Styles.blackwhite(themeChange.darkTheme, context),
              child: Padding(
                padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.07,right: SizeConfig.screenWidth*0.02, top: SizeConfig.screenHeight*0.045),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Jessica Smith", style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Styles.whiteblack(themeChange.darkTheme, context)
                    ),),
                    SizedBox(width: SizeConfig.screenWidth*0.3),
                    Container(
                      width: SizeConfig.screenWidth * 0.1,
                      height: SizeConfig.screenHeight,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Ionicons.add_circle_outline, size: 30, color: Styles.whiteblack(themeChange.darkTheme, context),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth* 0.025,),
                    Container(
                      width: SizeConfig.screenWidth * 0.1,
                      height: SizeConfig.screenHeight,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Ionicons.settings_outline, size: 30,color: Styles.whiteblack(themeChange.darkTheme, context)
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ):SizedBox(),
          pinnedAppBar ? Container(
            margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.099),
            width: SizeConfig.screenWidth,
            color: Styles.blackwhite(themeChange.darkTheme, context),
            child: Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.01),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(children: [
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
                        width: SizeConfig.screenWidth * 0.333,
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
                              width: SizeConfig.screenWidth * 0.333,
                              height: SizeConfig.screenHeight * 0.048,
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
                                            themeChange.darkTheme,
                                            context)),
                                  )),
                            ),
                            onTap: () => _pageController.jumpToPage(0)),
                        GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: Container(
                              width: SizeConfig.screenWidth * 0.333,
                              height: SizeConfig.screenHeight * 0.048,
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
                                            themeChange.darkTheme,
                                            context)),
                                  )),
                            ),
                            onTap: () => _pageController.jumpToPage(1)),
                        GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: Container(
                              width: SizeConfig.screenWidth * 0.333,
                              height: SizeConfig.screenHeight * 0.048,
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
                                            themeChange.darkTheme,
                                            context)),
                                  )),
                            ),
                            onTap: () => _pageController.jumpToPage(2)),
                      ],
                    ),
                  ]),
                ],
              ),
            ),
          ) : SizedBox(),
        ],
      ),
    );
  }
}
