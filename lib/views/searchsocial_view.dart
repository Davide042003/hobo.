import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/social/searchsocial_widget.dart';
import 'package:hobo_test/widgets/social/tag_widget.dart';

class SearchSocialView extends StatefulWidget {
  @override
  _SearchSocialViewState createState() => _SearchSocialViewState();
}

class _SearchSocialViewState extends State<SearchSocialView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
        backgroundColor:
            Styles.loginregister_background(themeChange.darkTheme, context),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.006,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.02,
                  right: SizeConfig.screenWidth * 0.08),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Container(
                      width: SizeConfig.screenWidth * 0.12,
                      height: SizeConfig.screenHeight * 0.04,
                      child: Icon(
                        CustomIcons.backarrow,
                        size: 16,
                        color:
                            Styles.whiteblack(themeChange.darkTheme, context),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              width: SizeConfig.screenWidth * 0.77,
                              child: SearchSocialWidget())))
                ],
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight*0.02,),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.065,
              ),
              child: Container(
                height: SizeConfig.screenHeight *0.025,
                  width: SizeConfig.screenWidth,
                  child: Text(
                    "Recent researches",
                    style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                    color: Styles.whiteblack(themeChange.darkTheme, context)),
                  )),
            ),
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.08,
              child: ListView.separated(
                  primary: false,
                  padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.065),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  separatorBuilder: (BuildContext context, int index) => SizedBox(
                    width: SizeConfig.screenWidth * 0.025,
                  ),
                  itemBuilder: (ctx, i) => TagWidget(
                    startColor: Color.fromRGBO(255, 129, 205, 1),
                    finalColor: Color.fromRGBO(207, 74, 154, 1),
                    tag: "Photography",
                  )),
            ),
            SizedBox(height: SizeConfig.screenHeight*0.02,),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.065,
              ),
              child: Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight *0.025,
                  child: Text(
                    "Trending tags",
                    style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Styles.whiteblack(themeChange.darkTheme, context)),
                  )),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.015),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.06),
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.035,
              child: Row(
                children: [
                  TagCardWidget(),
                ],
              ),
            ),
          ],
        ))));
  }
}

class TagCardWidget extends StatelessWidget {
  const TagCardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
