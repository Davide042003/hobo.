import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/social/socialprofilelike_widget.dart';

class PostExploreWidget extends StatefulWidget {
  @override
  _PostExploreWidgetState createState() => _PostExploreWidgetState();
}

class _PostExploreWidgetState extends State<PostExploreWidget> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        height: SizeConfig.screenHeight,
        child: Stack(
          children: [
            Container(height: SizeConfig.screenHeight, child: Image.asset("assets/images/image-social-1.png",fit: BoxFit.fill,)),
            Container(height: SizeConfig.screenHeight*0.06,decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0)
                ],
                begin: Alignment(Alignment.topCenter.x, Alignment.topCenter.y - SizeConfig.screenHeight * 0.0005),
                end: Alignment.bottomCenter
              )
            ),),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth*0.03, vertical: SizeConfig.screenHeight*0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileImageSocialWidget(image: AssetImage("assets/images/provaSocial.jpeg"), initials: "DB"),
                  SizedBox(width: SizeConfig.screenWidth *0.015),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bruce Wayne",
                        style: TextStyle(
                            fontFamily: Constants.POPPINS,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Row(
                        children: [
                          Icon(CustomIcons.pinlocationicon,
                              size: 7,
                              color: Colors.white.withOpacity(0.54)),
                          SizedBox(
                            width: SizeConfig.screenWidth * 0.002,
                          ),
                          Text(
                            "San Francisco",
                            style: TextStyle(
                                fontFamily: Constants.POPPINS,
                                fontSize: 8,
                                fontWeight: FontWeight.normal,
                                color: Colors.white.withOpacity(0.54)),
                          ),
                        ],
                      )
                    ],
                  ),
                  Expanded(child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                       margin: EdgeInsets.only(left: SizeConfig.screenWidth *0.04),
                        height: SizeConfig.screenHeight*0.03,
                        child: liked == true
                            ? Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.screenWidth * 0.02),
                            child: Icon(
                              LineIcons.heartAlt,
                              color: Color.fromRGBO(245, 95, 185, 1),
                              size: 15,
                            ))
                            : Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.screenWidth * 0.02),
                            child: Icon(
                              LineIcons.heart,
                              color: Colors.white,
                              size: 15,
                            ))),
                    onTap: () {
                      setState(() {
                        if (!liked) {
                          liked = true;
                        } else {
                          liked = false;
                        }
                      });
                    },
                  )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
