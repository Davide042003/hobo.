import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hobo_test/methods/firestore_service.dart';
import 'package:hobo_test/models/user_model.dart';
import 'package:hobo_test/models/user_provider.dart';
import 'package:hobo_test/views/choosewho_view.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'inputFieldStandard_widget.dart';
import 'package:hobo_test/widgets/login_register/inputFieldPassword_widget.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

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
        if (focusNodeName.hasFocus) {
          focusNodeName.requestFocus();
        } else {
          focusNodeName.unfocus();
        }
      });
    });

    focusNodeUsername.addListener(() {
      setState(() {
        if (focusNodeUsername.hasFocus) {
          focusNodeUsername.requestFocus();
        } else {
          focusNodeUsername.unfocus();
        }
      });
    });

    focusNodeMail.addListener(() {
      setState(() {
        if (focusNodeMail.hasFocus) {
          focusNodeMail.requestFocus();
        } else {
          focusNodeMail.unfocus();
        }
      });
    });

    focusNodePassword.addListener(() {
      setState(() {
        if (focusNodePassword.hasFocus) {
          focusNodePassword.requestFocus();
        } else {
          focusNodePassword.unfocus();
        }
      });
    });

    focusNodeSubmit.addListener(() {
      setState(() {
        if (focusNodeSubmit.hasFocus) {
          focusNodeSubmit.requestFocus();
        } else {
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

  void _trySubmitForm(bool dark) async {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      try {
        FirestoreService firestoreService = FirestoreService();
        firestoreService.registerUser(_name, _username, _email, _password);

        /*
        UserCredential userCredentials = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        FirebaseFirestore.instance.collection('users').doc(userCredentials.user.uid).set({
          'uid': userCredentials.user.uid,
          'email': _email,
          'name': _name,
          'profilePic': null,
          'username': _username,
          'guide': false,
          'timeCreation' : Timestamp.now()
        });
*/
        Future.wait([
          precachePicture(
            ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/images/Guide-background.svg'),
            null,
          ),
          precachePicture(
            ExactAssetPicture(SvgPicture.svgStringDecoder, dark ? 'assets/images/Guide-girl-dark.svg' : 'assets/images/Guide-girl.svg'),
            null,
          ),
          precachePicture(
            ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/images/Tourist-background.svg'),
            null,
          ),
          precachePicture(
            ExactAssetPicture(SvgPicture.svgStringDecoder, dark ? 'assets/images/Tourist-girl-dark.svg' : 'assets/images/Tourist-girl.svg'),
            null,
          ),
        ]);

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ChooseWho()),
              (Route<dynamic> route) => false,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    TextStyle defaultStyle = TextStyle(
        fontSize: 15,
        fontFamily: Constants.POPPINS,
        color: Styles.whiteblack(themeChange.darkTheme, context));
    TextStyle linkStyle = TextStyle(
        fontSize: 15,
        fontFamily: Constants.POPPINS,
        fontWeight: FontWeight.w600,
        color: Styles.loginregister_forgot(themeChange.darkTheme, context));

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottom),
        child: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.1),
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
                          color: Styles.whiteblack(
                              themeChange.darkTheme, context)),
                      textAlign: TextAlign.left,
                    )),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Enter the following details",
                        style: TextStyle(
                            fontFamily: Constants.POPPINS,
                            fontWeight: FontWeight.w300,
                            fontSize: 17,
                            color: Styles.loginregister_subheadingandform(
                                themeChange.darkTheme, context)),
                        textAlign: TextAlign.left)),
                SizedBox(height: SizeConfig.screenHeight * 0.025),
                InputFieldStandard(
                    "Name",
                    0,
                    CustomIcons.usericon,
                    (value) => _name = value,
                    true,
                    focusNodeName,
                    focusNodeUsername,
                    22),
                SizedBox(height: SizeConfig.screenHeight * 0.025),
                InputFieldStandard(
                    "Username",
                    0,
                    CustomIcons.usericon,
                    (value) => _username = value,
                    true,
                    focusNodeUsername,
                    focusNodeMail,
                    22),
                SizedBox(height: SizeConfig.screenHeight * 0.025),
                InputFieldStandard(
                    "Email Address",
                    1,
                    CustomIcons.mailicon,
                    (value) => _email = value,
                    true,
                    focusNodeMail,
                    focusNodePassword,
                    18),
                SizedBox(height: SizeConfig.screenHeight * 0.025),
                InputFieldPassword(
                    this._showPassword,
                    () => setState(
                        () => this._showPassword = !this._showPassword),
                    (value) => _password = value,
                    true,
                    focusNodePassword,
                    focusNodeSubmit),
                SizedBox(
                  height: SizeConfig.screenWidth * 0.07,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'By registering, you are agreeing to \n our '),
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
                      onPressed: () {_trySubmitForm(themeChange.darkTheme);},
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
