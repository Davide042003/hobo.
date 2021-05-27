import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/styles/dark_theme_styles.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/provider/dark_theme_provider.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'package:hobo_test/widgets/styles/constants.dart';
import 'package:ionicons/ionicons.dart';

class SearchBarWidget extends StatefulWidget {
  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: SizeConfig.screenHeight * 0.065,
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(Radius.circular(40)),
                color: Styles.home_navigatorbackground(
                    themeChange.darkTheme, context),
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.07),
                      blurRadius: 21,
                      offset: Offset(0, 10))
                ]),
            child: Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.07,
                  right: SizeConfig.screenWidth * 0.07,
                  top: SizeConfig.screenHeight * 0.005),
              child: TextField(
                style: TextStyle(
                    fontFamily: Constants.POPPINS,
                    fontSize: 16,
                    color:
                        Styles.searchBar_text(themeChange.darkTheme, context)),
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Search places",
                  hintStyle: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 16,
                      color: Styles.searchBar_text(
                          themeChange.darkTheme, context)),
                ),
              ),
            )),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
              margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.005),
              height: SizeConfig.screenHeight * 0.055,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(116, 142, 243, 1),
                      Color.fromRGBO(36, 65, 187, 1)
                    ]),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(63, 83, 216, .23),
                      blurRadius: 4,
                      offset: Offset(0, 6))
                ],
              ),
              child: TextButton(
                onPressed: () {},
                child: Icon(Ionicons.search,
                    color: Styles.blackwhite(themeChange.darkTheme, context),
                    size: 22),
              )),
        ])
      ],
    );
  }
}
