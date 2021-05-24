import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/constants.dart';
import 'package:hobo_test/widgets/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseWho extends StatefulWidget {
  @override
  _ChooseWhoState createState() => _ChooseWhoState();
}

class _ChooseWhoState extends State<ChooseWho> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        body: Container(
            color: Color.fromRGBO(245, 252, 255, 1),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.03,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text("Who are you ?",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 25,
                              fontWeight: FontWeight.w600))),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                  ),
                  GestureDetector(
                      child: Container(
                    width: SizeConfig.screenWidth * 1,
                    alignment: Alignment.center,
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: SvgPicture.asset(
                            "assets/images/Tourist-background.svg",
                            alignment: Alignment.bottomCenter,
                            width: SizeConfig.screenWidth * 0.75,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.screenHeight * 0.072, left: SizeConfig.screenWidth * 0.63),
                        child: SvgPicture.asset(
                          "assets/images/Tourist-girl.svg",
                          alignment: Alignment.bottomLeft,
                          height: SizeConfig.screenHeight * 0.30,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.025), child: Text("Tourist", style: TextStyle(fontFamily: Constants.POPPINS,fontSize: 28,fontWeight: FontWeight.bold),)),
                      )
                    ]),
                  )),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  GestureDetector(
                      child: Container(
                        width: SizeConfig.screenWidth * 1,
                        alignment: Alignment.center,
                        child: Stack(children: [
                          Align(
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: SvgPicture.asset(
                                "assets/images/Guide-background.svg",
                                alignment: Alignment.bottomCenter,
                                width: SizeConfig.screenWidth * 0.75,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: SizeConfig.screenHeight * 0.072, left: SizeConfig.screenWidth * 0.63),
                            child: SvgPicture.asset(
                              "assets/images/Guide-girl.svg",
                              alignment: Alignment.bottomLeft,
                              height: SizeConfig.screenHeight * 0.30,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.025), child: Text("Tour Guide", style: TextStyle(fontFamily: Constants.POPPINS,fontSize: 28,fontWeight: FontWeight.bold),)),
                          )
                        ]),
                      )),
                ],
              ),
            )));
  }
}
