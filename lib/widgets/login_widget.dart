import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'size_config.dart';
import 'constants.dart';
import 'inputFieldStandard_widget.dart';
import 'inputFieldPassword_widget.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ionicons/ionicons.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _showPassword = false;

  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _password = '';

  String _validatePassword(String value) {
    Pattern pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value))
        return 'Enter valid password';
      else
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

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
                      fontSize: 25),
                  textAlign: TextAlign.left,
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Enter your login credentials",
                    style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        fontWeight: FontWeight.w300,
                        fontSize: 17,
                        color: Color.fromRGBO(138, 138, 138, 1)),
                    textAlign: TextAlign.left)),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            InputFieldStandard("Username/Email", 0, Ionicons.mail_outline),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            InputFieldPassword(
                this._showPassword,
                () => setState(() => this._showPassword = !this._showPassword),
                (value) => _validatePassword(value),
                (value) => _password = value),
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
                  onPressed: () {},
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
                        color: Color.fromRGBO(36, 65, 187, 1),
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
                      color: Color.fromRGBO(51, 51, 51, 1),
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
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Color.fromRGBO(164, 164, 14, .1),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Icon(Ionicons.logo_google, size: 30,),
                    )),
                SizedBox(width: SizeConfig.screenWidth * 0.05),
                Container(
                  height: SizeConfig.screenHeight * 0.11,
                    width: SizeConfig.screenWidth * 0.18,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Color.fromRGBO(25, 119, 243, .15),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Icon(LineIcons.facebookF, size: 30, color: Color.fromRGBO(25, 119, 243, 1),),
                    )),
                SizedBox(width: SizeConfig.screenWidth * 0.05),
                Container(
                    height: SizeConfig.screenHeight * 0.11,
                    width: SizeConfig.screenWidth * 0.18,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                    child: TextButton(
                      onPressed: () {},
                      child: Icon(Ionicons.logo_apple, color: Colors.white, size: 30),
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
