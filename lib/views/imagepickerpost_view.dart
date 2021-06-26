import 'package:flutter/material.dart';
import 'package:hobo_test/views/addpost_view.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class ImagePickerPostView extends StatefulWidget {
  @override
  _ImagePickerPostViewState createState() => _ImagePickerPostViewState();
}

class _ImagePickerPostViewState extends State<ImagePickerPostView> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Container(
          color:
              Styles.loginregister_background(themeChange.darkTheme, context),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Styles.chat_gradientstart(
                                themeChange.darkTheme, context),
                            Styles.chat_gradientend(
                                themeChange.darkTheme, context),
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter * 2.5)),
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight * 0.13,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.02,
                            top: SizeConfig.screenHeight * 0.04),
                        child: Row(children: [
                          GestureDetector(
                            child: Container(
                              width: SizeConfig.screenWidth * 0.125,
                              height: SizeConfig.screenHeight,
                              child: Icon(
                                CupertinoIcons.xmark,
                                color: Styles.whiteblack(
                                    themeChange.darkTheme, context),
                                size: 24,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(width: SizeConfig.screenWidth * 0.245),
                          Container(
                            child: Text("New Post",
                                style: TextStyle(
                                    fontFamily: Constants.POPPINS,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Styles.whiteblack(
                                        themeChange.darkTheme, context))),
                          ),
                          Expanded(
                              child: GestureDetector(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: SizeConfig.screenWidth * 0.15,
                                height: SizeConfig.screenHeight,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: SizeConfig.screenHeight * 0.03),
                                  child: Text(
                                    "Next",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: Constants.POPPINS,
                                        fontSize: 18,
                                        color: Styles.social_gototour(
                                            themeChange.darkTheme, context)),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddPostView()),
                              );
                            },
                          ))
                        ]),
                      )),
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.03,
                    decoration: BoxDecoration(
                        color: Styles.chat_bar(themeChange.darkTheme, context),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.05),
                              blurRadius: 29,
                              offset: Offset(0, 3))
                        ]),
                  ),
                ],
              ),
            ],
          )),
    );
  }

}
