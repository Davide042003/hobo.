import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:hobo_test/views/choosewho_view.dart';
import 'package:hobo_test/widgets/size_config.dart';
import 'package:hobo_test/widgets/constants.dart';
import 'package:ionicons/ionicons.dart';
import 'inputFieldStandard_widget.dart';
import 'package:hobo_test/widgets/login_register/inputFieldPassword_widget.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/dark_theme_styles.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/dark_theme_provider.dart';

class RegisterWidget extends StatefulWidget {
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  bool _showPassword = false;

  final _formKey = GlobalKey<FormState>();

  FocusNode focusNodeName;
  FocusNode focusNodeUsername;
  FocusNode focusNodeMail;
  FocusNode focusNodePassword;
  FocusNode focusNodeSubmit;

  String _name = '';
  String _username = '';
  String _email = '';
  String _password = '';

  @override
  void initState() {
    super.initState();

    focusNodeName = FocusNode();
    focusNodeUsername = FocusNode();
    focusNodeMail = FocusNode();
    focusNodePassword = FocusNode();
    focusNodeSubmit = FocusNode();

    focusNodeName.addListener(() {
      setState(() {
        if(focusNodeName.hasFocus) {
          focusNodeName.requestFocus();
        }else{
          focusNodeName.unfocus();
        }
      });
    });

    focusNodeUsername.addListener(() {
      setState(() {
        if(focusNodeUsername.hasFocus) {
          focusNodeUsername.requestFocus();
        }else{
          focusNodeUsername.unfocus();
        }
      });
    });

    focusNodeMail.addListener(() {
      setState(() {
        if(focusNodeMail.hasFocus) {
          focusNodeMail.requestFocus();
        }else{
          focusNodeMail.unfocus();
        }
      });
    });

    focusNodePassword.addListener(() {
      setState(() {
        if(focusNodePassword.hasFocus) {
          focusNodePassword.requestFocus();
        }else{
          focusNodePassword.unfocus();
        }
      });
    });

    focusNodeSubmit.addListener(() {
      setState(() {
        if(focusNodeSubmit.hasFocus) {
          focusNodeSubmit.requestFocus();
        }else{
          focusNodeSubmit.unfocus();
        }
      });
    });
  }

  @override
  void dispose() {

    focusNodeName.dispose();
    focusNodeUsername..dispose();
    focusNodeMail.dispose();
    focusNodePassword.dispose();
    focusNodeSubmit.dispose();

    super.dispose();
  }

  void _trySubmitForm() {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ChooseWho()),
            (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    TextStyle defaultStyle = TextStyle(fontSize: 15, fontFamily: Constants.POPPINS, color: Styles.whiteblack(themeChange.darkTheme, context));
    TextStyle linkStyle = TextStyle(fontSize: 15, fontFamily: Constants.POPPINS, fontWeight: FontWeight.w600, color: Styles.loginregister_forgot(themeChange.darkTheme, context));


    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottom),
        child: SingleChildScrollView(
          child: Container(
              margin:
                  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.1),
              child: Column(children: [
                SizedBox(height: SizeConfig.screenHeight * 0.035),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontFamily: Constants.POPPINS,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                      color: Styles.whiteblack(themeChange.darkTheme, context)),
                      textAlign: TextAlign.left,
                    )),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Enter the following details",
                        style: TextStyle(
                            fontFamily: Constants.POPPINS,
                            fontWeight: FontWeight.w300,
                            fontSize: 17,
                            color: Styles.loginregister_subheadingandform(themeChange.darkTheme, context)),
                        textAlign: TextAlign.left)),
                SizedBox(height: SizeConfig.screenHeight * 0.035),
                InputFieldStandard("Name", 0, Ionicons.person_outline,
                    (value) => _name = value, true, focusNodeName, focusNodeUsername),
                SizedBox(height: SizeConfig.screenHeight * 0.035),
                InputFieldStandard("Username", 0, Ionicons.person_outline,
                    (value) => _username = value, true, focusNodeUsername, focusNodeMail),
                SizedBox(height: SizeConfig.screenHeight * 0.035),
                InputFieldStandard("Email Address", 1, Ionicons.mail_outline,
                    (value) => _email = value, true, focusNodeMail, focusNodePassword),
                SizedBox(height: SizeConfig.screenHeight * 0.035),
                InputFieldPassword(
                    this._showPassword,
                    () => setState(() => this._showPassword = !this._showPassword),
                    (value) => _password = value,
                    true, focusNodePassword, focusNodeSubmit),
                SizedBox(
                  height: SizeConfig.screenWidth * 0.07,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: defaultStyle,
                      children: <TextSpan>[
                        TextSpan(text: 'By registering, you are agreeing to our '),
                        TextSpan(
                            text: 'Terms & conditions',
                            style: linkStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Terms of Service"');
                              }),
                        TextSpan(text: ' and '),
                        TextSpan(
                            text: 'Privacy \n policy.',
                            style: linkStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Privacy policy"');
                              }),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.035),
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
                      focusNode: focusNodeSubmit,
                      onPressed: _trySubmitForm,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Register",
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
              ])),
        ),
      ),
    );
  }
}
