import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import '../size_config.dart';
import '../constants.dart';
import 'package:hobo_test/widgets/login_register/inputFieldStandard_widget.dart';
import 'inputFieldPassword_widget.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:hobo_test/widgets/dark_theme_styles.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/dark_theme_provider.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _showPassword = false;

  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.1),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.07),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome",
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                  color: Styles.whiteblack(themeChange.darkTheme, context)),
                  textAlign: TextAlign.left,
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Enter your login credentials",
                    style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        fontWeight: FontWeight.w300,
                        fontSize: 17,
                        color: Styles.loginregister_subheadingandform(themeChange.darkTheme, context)),
                    textAlign: TextAlign.left)),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            InputFieldStandard("Username/Email", 0, Ionicons.mail_outline, (value) => _userEmail = value, false),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            InputFieldPassword(
                this._showPassword,
                () => setState(() => this._showPassword = !this._showPassword),
                (value) => _password = value, false),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.065,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(116, 142, 243, 1),
                        Color.fromRGBO(36, 65, 187, 1)
                      ]),
                ),
                child: TextButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: Constants.POPPINS,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )),
            SizedBox(height: SizeConfig.screenHeight * 0.008),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: Container(
                width: SizeConfig.screenWidth * 0.5,
                height: SizeConfig.screenHeight * 0.05,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Styles.loginregister_forgot(themeChange.darkTheme, context),
                        fontFamily: Constants.POPPINS,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.06),
            Container(
              width: SizeConfig.screenWidth * 0.5,
              height: SizeConfig.screenHeight * 0.03,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Or login with",
                  style: TextStyle(
                      color: Styles.loginregister_or(themeChange.darkTheme, context),
                      fontFamily: Constants.POPPINS,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: SizeConfig.screenHeight * 0.11,
                    width: SizeConfig.screenWidth * 0.18,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Styles.loginregister_google(themeChange.darkTheme, context),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Icon(Ionicons.logo_google, size: 30,),
                    )),
                SizedBox(width: SizeConfig.screenWidth * 0.05),
                Container(
                  height: SizeConfig.screenHeight * 0.11,
                    width: SizeConfig.screenWidth * 0.18,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Styles.loginregister_fb(themeChange.darkTheme, context),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Icon(LineIcons.facebookF, size: 30, color: Color.fromRGBO(25, 119, 243, 1),),
                    )),
                SizedBox(width: SizeConfig.screenWidth * 0.05),
                Container(
                    height: SizeConfig.screenHeight * 0.11,
                    width: SizeConfig.screenWidth * 0.18,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Styles.whiteblack(themeChange.darkTheme, context)),
                    child: TextButton(
                      onPressed: () {},
                      child: Icon(Ionicons.logo_apple, color: Styles.blackwhite(themeChange.darkTheme, context), size: 30),
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}