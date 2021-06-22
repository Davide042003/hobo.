import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/views/step5createtour_view.dart';
import 'package:hobo_test/widgets/add_tour/cardtouradd_widget.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/login_register/inputFieldStandard_widget.dart';

import 'addactivity_view.dart';

class Step4CreateTour extends StatefulWidget {
  @override
  _Step4CreateTourState createState() => _Step4CreateTourState();
}

class _Step4CreateTourState extends State<Step4CreateTour> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }

  void _trySubmitForm() async {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Step5CreateTour()),
      );
    }
  }

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
                        child: Text("Step 4",
                            style: TextStyle(
                                fontFamily: Constants.POPPINS,
                                fontWeight: FontWeight.w300,
                                fontSize: 17,
                                color: Styles.loginregister_subheadingandform(
                                    themeChange.darkTheme, context)),
                            textAlign: TextAlign.left)),
                    SizedBox(height: SizeConfig.screenHeight*0.03),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Activities",
                        style: TextStyle(
                            fontFamily: Constants.POPPINS,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Styles.whiteblack(themeChange.darkTheme, context)),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight*0.03,),
                    Container(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, i) {
                          if (i == 0) {
                            return GestureDetector(
                              child: Container(
                                width: SizeConfig.screenWidth * 0.86,
                                height: SizeConfig.screenHeight * 0.09,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    border: Border.all(color: Color.fromRGBO(116, 142, 243, 1), width: 1),
                                    color: Colors.transparent),
                                child: Center(
                                    child:Text(
                                      "+",
                                      style: TextStyle(
                                          fontFamily: Constants.POPPINS,
                                          fontSize: 35,
                                          color: Color.fromRGBO(116, 142, 243, 1)),
                                    )),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AddActivity()),
                                );
                              },
                            );
                          } else {
                            return CardTourAddWidget();

                          }
                        },
                        separatorBuilder: (context, i) => SizedBox(
                          height: SizeConfig.screenHeight * 0.02,
                        ),
                        itemCount: 4,
                      ),
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
