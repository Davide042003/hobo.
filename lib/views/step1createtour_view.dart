import 'package:flutter/material.dart';
import 'package:hobo_test/views/step2createtour_view.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/login_register/inputFieldStandard_widget.dart';

class Step1CreateTour extends StatefulWidget {
  @override
  _Step1CreateTourState createState() => _Step1CreateTourState();
}

class _Step1CreateTourState extends State<Step1CreateTour> {
  final _formKey = GlobalKey<FormState>();

  FocusNode focusNodeTourName;
  FocusNode focusNodeTourPlace;
  FocusNode focusNodeMaxPeople;
  FocusNode focusNodeContinue;

  @override
  void initState() {
    super.initState();

    focusNodeTourName = FocusNode();
    focusNodeTourPlace = FocusNode();
    focusNodeMaxPeople = FocusNode();
    focusNodeContinue = FocusNode();

    focusNodeTourName.addListener(() {
      setState(() {
        if (focusNodeTourName.hasFocus) {
          focusNodeTourName.requestFocus();
        } else {
          focusNodeTourName.unfocus();
        }
      });
    });

    focusNodeMaxPeople.addListener(() {
      setState(() {
        if (focusNodeMaxPeople.hasFocus) {
          focusNodeMaxPeople.requestFocus();
        } else {
          focusNodeMaxPeople.unfocus();
        }
      });
    });

    focusNodeTourPlace.addListener(() {
      setState(() {
        if (focusNodeTourPlace.hasFocus) {
          focusNodeTourPlace.requestFocus();
        } else {
          focusNodeTourPlace.unfocus();
        }
      });
    });

    focusNodeContinue.addListener(() {
      setState(() {
        if (focusNodeContinue.hasFocus) {
          focusNodeContinue.requestFocus();
        } else {
          focusNodeContinue.unfocus();
        }
      });
    });
  }


  @override
  void dispose() {
    focusNodeTourName.dispose();
    focusNodeTourPlace.dispose();
    focusNodeMaxPeople.dispose();
    focusNodeContinue.dispose();

    super.dispose();
  }

  void _trySubmitForm() async {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Step2CreateTour()),
      );
    }
  }

  String _tourName = '';
  String _tourPlace = '';
  String _maxPeople = '';
  bool _allowChildren = false;
  bool _private = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:
          Styles.loginregister_background(themeChange.darkTheme, context),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                    left: SizeConfig.screenWidth * 0.1,
                    right: SizeConfig.screenWidth * 0.1,
                    top: SizeConfig.screenHeight * 0.02),
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight * 0.07),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Let's publish a new tour",
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
                        child: Text("Step 1",
                            style: TextStyle(
                                fontFamily: Constants.POPPINS,
                                fontWeight: FontWeight.w300,
                                fontSize: 17,
                                color: Styles.loginregister_subheadingandform(
                                    themeChange.darkTheme, context)),
                            textAlign: TextAlign.left)),
                    SizedBox(height: SizeConfig.screenHeight * 0.05),
                    InputFieldStandard("Tour Name", 0, null, (value) => _tourName = value, false,
                        focusNodeTourName, focusNodeTourPlace, 18),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    InputFieldStandard("Tour Place", 0, null, (value) => _tourPlace = value, false,
                        focusNodeTourPlace, focusNodeMaxPeople, 18),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    Row(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                width: SizeConfig.screenWidth * 0.26,
                                child: InputFieldStandard(
                                    "Max People",
                                    2,
                                    null,
                                    (value) => _maxPeople = value,
                                    false,
                                    focusNodeMaxPeople,
                                    null,
                                    18))),
                        SizedBox(width: SizeConfig.screenWidth*0.1,),
                        Text("Allow children ?",style: TextStyle(
                          fontFamily: Constants.POPPINS,fontSize: 16, color: Styles.whiteblack(themeChange.darkTheme, context)
                        ),),
                        SizedBox(width: SizeConfig.screenWidth*0.03,),
                        GestureDetector(
                          child: Container(
                            width: SizeConfig.screenWidth * 0.06,
                            height: SizeConfig.screenHeight * 0.027,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: _allowChildren
                                    ? Color.fromRGBO(245, 95, 185, 1)
                                    : Colors.transparent,
                                border: _allowChildren
                                    ? null
                                    : Border.all(
                                    color: Color.fromRGBO(245, 95, 185, 1),
                                    width: 1.5)),
                            child: _allowChildren
                                ? Icon(
                              Icons.check,
                              size: 18,
                              color: Colors.white,
                            )
                                : null,
                          ),
                          onTap: () {
                           setState(() {
                             if(!_allowChildren){
                               _allowChildren = true;
                             }else {
                               _allowChildren = false;
                             }
                           });
                          },
                        )],
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    Row(
                      children: [
                        Text("Is a private tour ? ",style: TextStyle(
                            fontFamily: Constants.POPPINS,fontSize: 16, color: Styles.whiteblack(themeChange.darkTheme, context)
                        ),),
                        SizedBox(width: SizeConfig.screenWidth*0.03,),
                        GestureDetector(
                          child: Container(
                            width: SizeConfig.screenWidth * 0.06,
                            height: SizeConfig.screenHeight * 0.027,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: _private
                                    ? Color.fromRGBO(245, 95, 185, 1)
                                    : Colors.transparent,
                                border: _private
                                    ? null
                                    : Border.all(
                                    color: Color.fromRGBO(245, 95, 185, 1),
                                    width: 1.5)),
                            child: _private
                                ? Icon(
                              Icons.check,
                              size: 18,
                              color: Colors.white,
                            )
                                : null,
                          ),
                          onTap: () {
                            setState(() {
                              if(!_private){
                                _private = true;
                              }else {
                                _private = false;
                              }
                            });
                          },
                        )],
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.05),
                    GestureDetector(
                      onTap: _trySubmitForm,
                      child: Container(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight * 0.065,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                            boxShadow: [
                              themeChange.darkTheme ? BoxShadow() : BoxShadow(
                                  color: Color.fromRGBO(62, 109, 255, 0.39),
                                  offset: Offset(0, 9),
                                  blurRadius: 15)
                            ],
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
                                    "Continue",
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
