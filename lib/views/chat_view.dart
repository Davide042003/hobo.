import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/chat/cardchat_widget.dart';
import 'package:hobo_test/widgets/chat/profileimagechat_widget.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/chat/typemessage_widget.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
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
              Container(
                margin: EdgeInsets.only(
                    bottom: SizeConfig.screenHeight * 0.08,
                    left: SizeConfig.screenWidth * 0.065,
                    right: SizeConfig.screenWidth * 0.065,
                    top: SizeConfig.screenHeight * 0.15),
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Bubble(
                      message: 'I\'ve told you so dude ijfisgodfg gidjg dfgh  hdgh dgh   hd gh dgh  dgh !',
                      time: '12:00',
                      delivered: true,
                      isMe: true,
                    ),
                  ],
                ),
              ),
              Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.23,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Styles.chat_gradientstart(themeChange.darkTheme, context),
                    Styles.chat_gradientend(themeChange.darkTheme, context),
                  ],
                  begin: Alignment(Alignment.center.x,
                      Alignment.center.y + SizeConfig.screenHeight * 0.0001),
                  end: Alignment.bottomCenter,
                )),
              ),
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
                                Icons.arrow_back_ios_outlined,
                                color: Styles.whiteblack(
                                    themeChange.darkTheme, context),
                                size: 20,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(width: SizeConfig.screenWidth * 0.015),
                          ProfileImageChatWidget(
                              image:
                                  AssetImage("assets/images/provaSocial.jpeg"),
                              initials: "DB"),
                          SizedBox(width: SizeConfig.screenWidth * 0.035),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Oliver Queen",
                                  style: TextStyle(
                                      fontFamily: Constants.POPPINS,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Styles.whiteblack(
                                          themeChange.darkTheme, context))),
                              Text("Last Seen: 12:45 PM",
                                  style: TextStyle(
                                      fontFamily: Constants.POPPINS,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Color.fromRGBO(183, 183, 183, 1)))
                            ],
                          ),
                          Expanded(
                              child: GestureDetector(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: SizeConfig.screenWidth * 0.125,
                                height: SizeConfig.screenHeight,
                                child: Icon(
                                  Icons.more_vert_rounded,
                                  color: Styles.whiteblack(
                                      themeChange.darkTheme, context),
                                  size: 25,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
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
                    child: Center(
                      child: Text(
                        "APRIL 15, 2021",
                        style: TextStyle(
                            fontFamily: Constants.POPPINS,
                            fontSize: 12,
                            letterSpacing: 2.2,
                            color: Styles.whiteblack(
                                themeChange.darkTheme, context)),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )),
      bottomNavigationBar: Container(
          margin: EdgeInsets.only(
              left: SizeConfig.screenWidth * 0.06,
              right: SizeConfig.screenWidth * 0.06,
              bottom: SizeConfig.screenHeight * 0.04),
          child: TypeMessageWidget()),
    );
  }
}
