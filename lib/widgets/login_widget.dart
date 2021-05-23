import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'size_config.dart';
import 'constants.dart';
import 'inputFieldStandard_widget.dart';
import 'inputFieldPassword_widget.dart';

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
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
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
            InputFieldStandard("Username/Email", 0, Icons.mail_outline),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            InputFieldPassword(this._showPassword, () => setState(() => this._showPassword = !this._showPassword), (value) => _validatePassword(value), (value) => _password = value)
          ],
        ),
      ),
    );
  }
}


