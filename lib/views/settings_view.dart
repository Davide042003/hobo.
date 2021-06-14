import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/home/profileimagehome_widget.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      backgroundColor: Styles.loginregister_background(themeChange.darkTheme, context),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.06,
              child: Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.02,
                  right: SizeConfig.screenWidth * 0.07,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        width: SizeConfig.screenWidth * 0.125,
                        height: SizeConfig.screenHeight,
                        child: Icon(
                          CustomIcons.backarrow,
                          color: Styles.whiteblack(
                              themeChange.darkTheme, context),
                          size: 16,
                        ),
                      ),
                      onTap: () => Navigator.pop(context),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.04),
                    Text(
                      "Settings",
                      style: TextStyle(
                          fontFamily: Constants.POPPINS,
                          color: Styles.whiteblack(
                              themeChange.darkTheme, context),
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            margin: EdgeInsets.only(
                                left: SizeConfig.screenWidth * 0.15),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.26),
                                    blurRadius: 7,
                                    offset: Offset(0, 4))
                              ],
                            ),
                            child: ProfileImageHomeWidget(
                                image: AssetImage(
                                    "assets/images/provaSocial.jpeg"),
                                initials: "DB")),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.035),
            SingleCardWidget(themeChange: themeChange, icon: CustomIcons.profileicon, cardText: "Account", color:  Color.fromRGBO(245, 95, 185, 1),),
            SizedBox(height: SizeConfig.screenHeight * 0.035),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.07),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color:
                      Styles.settings_card(themeChange.darkTheme, context)),
              child: Column(
                children: [
                  CardSettingWidget(themeChange: themeChange, icon: CustomIcons.lock, cardText: "Security", color: Color.fromRGBO(79, 191, 32, 1),size: 15,),
                  Separator(themeChange: themeChange),
                  CardSettingWidget(themeChange: themeChange, icon: CustomIcons.bell, cardText: "Notifications", color: Color.fromRGBO(229, 173, 21, 1),size: 15,),
                  Separator(themeChange: themeChange),
                  CardSettingWidget(themeChange: themeChange, icon: CustomIcons.settings_double, cardText: "Preferences",color: Color.fromRGBO(36, 182, 228, 1),size: 15,),
                  Separator(themeChange: themeChange),
                  CardSettingWidget(themeChange: themeChange, icon: CustomIcons.privacy, cardText: "Privacy",color: Color.fromRGBO(233, 133, 57, 1),size: 15,),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.035),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.07),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color:
                  Styles.settings_card(themeChange.darkTheme, context)),
              child: Column(
                children: [
                  CardSettingWidget(themeChange: themeChange, icon: CustomIcons.service_center, cardText: "Service Center",color: Color.fromRGBO(134, 95, 168, 1),size: 15,),
                  Separator(themeChange: themeChange),
                  CardSettingWidget(themeChange: themeChange, icon: CustomIcons.twitter, cardText: "Twitter", color: Color.fromRGBO(85, 172, 238, 1),size: 11,),
                  Separator(themeChange: themeChange),
                  CardSettingWidget(themeChange: themeChange, icon: LineIcons.facebookF, cardText: "Facebook",color: Color.fromRGBO(25, 119, 243, 1),size: 15,),
                  Separator(themeChange: themeChange),
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.057,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.04,
                          vertical: SizeConfig.screenHeight * 0.013),
                      child: Row(
                        children: [
                          Container(
                            width: SizeConfig.screenWidth * 0.07,
                            height: SizeConfig.screenHeight,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/images/instagram-gradient.jpeg"), fit: BoxFit.fill),
                                borderRadius:
                                BorderRadius.all(Radius.circular(5)),),
                            child: Icon(
                              CustomIcons.instagram,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                          SizedBox(width: SizeConfig.screenWidth * 0.04),
                          Text(
                            "Instagram",
                            style: TextStyle(
                                fontFamily: Constants.POPPINS, fontSize: 15, color: Styles.whiteblack(themeChange.darkTheme, context)),
                          ),
                          Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: SizeConfig.screenWidth * 0.35),
                                height: SizeConfig.screenHeight,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Styles.whiteblack(
                                        themeChange.darkTheme, context),
                                    size: 16,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.035),
            SingleCardWidget(themeChange: themeChange, icon: CustomIcons.logout, cardText: "Logout", color: Color.fromRGBO(255, 77, 77, 1),),
          ],
        )),
      ),
    );
  }
}

class SingleCardWidget extends StatelessWidget {
  const SingleCardWidget({
    Key key,
    @required this.themeChange, this.icon, this.cardText, this.color,
  }) : super(key: key);

  final DarkThemeProvider themeChange;
  final IconData icon;
  final String cardText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.07),
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.057,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Styles.settings_card(themeChange.darkTheme, context)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.04,
            vertical: SizeConfig.screenHeight * 0.013),
        child: Row(
          children: [
            Container(
              width: SizeConfig.screenWidth * 0.07,
              height: SizeConfig.screenHeight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: color),
              child: Icon(
                icon,
                color: Colors.white,
                size: 15,
              ),
            ),
            SizedBox(width: SizeConfig.screenWidth * 0.04),
            Text(
              cardText,
              style: TextStyle(
                  fontFamily: Constants.POPPINS, fontSize: 15, color: Styles.whiteblack(themeChange.darkTheme, context)),
            ),
            Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      left: SizeConfig.screenWidth * 0.35),
                  height: SizeConfig.screenHeight,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Styles.whiteblack(
                          themeChange.darkTheme, context),
                      size: 16,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class Separator extends StatelessWidget {
  const Separator({
    Key key,
    @required this.themeChange,
  }) : super(key: key);

  final DarkThemeProvider themeChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(left: SizeConfig.screenWidth *0.15),
      child: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight * 0.001,
        color: Styles.tourpreview_bar(
            themeChange.darkTheme, context),
      ),
    );
  }
}

class CardSettingWidget extends StatelessWidget {
  const CardSettingWidget({
    Key key,
    @required this.themeChange, this.icon, this.cardText, this.color, this.size,

  }) : super(key: key);

  final DarkThemeProvider themeChange;
  final IconData icon;
  final String cardText;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.057,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.04,
            vertical: SizeConfig.screenHeight * 0.013),
        child: Row(
          children: [
            Container(
              width: SizeConfig.screenWidth * 0.07,
              height: SizeConfig.screenHeight,
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.all(Radius.circular(5)),
                  color: color),
              child: Icon(
                icon,
                color: Colors.white,
                size: size,
              ),
            ),
            SizedBox(width: SizeConfig.screenWidth * 0.04),
            Text(
              cardText,
              style: TextStyle(
                  fontFamily: Constants.POPPINS, fontSize: 15, color: Styles.whiteblack(themeChange.darkTheme, context)),
            ),
            Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      left: SizeConfig.screenWidth * 0.35),
                  height: SizeConfig.screenHeight,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Styles.whiteblack(
                          themeChange.darkTheme, context),
                      size: 16,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
