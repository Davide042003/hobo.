import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

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
                  left: SizeConfig.screenWidth * 0.02),
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
                        color: Styles.whiteblack(
                            themeChange.darkTheme, context),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ],
        ))));
  }
}
