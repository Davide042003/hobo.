import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/home/profileimagehome_widget.dart';
import 'package:hobo_test/widgets/chat/chatcard_widget.dart';
import 'package:hobo_test/widgets/provider/pagecontrol_provider.dart';

class ChatListView extends StatefulWidget {
  @override
  _ChatListViewState createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final page = Provider.of<PageControlProvider>(context);

    return Column(
      children: [
        SafeArea(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.07),
              child: Column(children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Chats",
                      style: TextStyle(
                          fontFamily: Constants.POPPINS,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Styles.whiteblack(
                              themeChange.darkTheme, context)),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.05),
                    GestureDetector(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.26),
                                  blurRadius: 7,
                                  offset: Offset(0, 6))
                            ],
                          ),
                          child: ProfileImageHomeWidget(
                              image: AssetImage("assets/images/provaSocial.jpeg"),
                              initials: "DB")),
                        onTap: () {
                          page.changePage = 4;
                        }
                    ),
                  ],
                ),
              ]),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.025),
            Container(
                height: SizeConfig.screenHeight * 0.78,
                width: SizeConfig.screenWidth,
                margin: EdgeInsets.only(
                    left: SizeConfig.screenWidth * 0.07,
                    right: SizeConfig.screenWidth * 0.07),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: 1,
                  itemBuilder: (ctx, i) => ChatCardWidget(index: 0),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: SizeConfig.screenHeight * 0.017),
                ))
          ],
        )),
      ],
    );
  }
}
