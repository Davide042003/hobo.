import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/size_config.dart';
import 'package:hobo_test/widgets/constants.dart';
import 'package:hobo_test/widgets/login_widget.dart';
import 'package:hobo_test/widgets/register_widget.dart';

class LoginRegisterView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginRegisterViewState();
}

class _LoginRegisterViewState extends State<LoginRegisterView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  static const _duration = const Duration(milliseconds: 300);
  static const _curve = Curves.ease;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return new Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(
                begin:
                    Alignment(Alignment.topLeft.x, Alignment.topCenter.y + 0.1),
                end: Alignment(
                    Alignment.topRight.x, Alignment.topCenter.y + 0.4),
                colors: [
                  Color.fromRGBO(116, 142, 243, 1),
                  Color.fromRGBO(36, 65, 187, 1)
                ]),
          )),
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.9,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color.fromRGBO(245, 252, 255, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Login",
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: Constants.POPPINS,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.25),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Register",
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: Constants.POPPINS,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Stack(children: [
                  Container(width: SizeConfig.screenWidth, height: SizeConfig.screenHeight * 0.0015, color: Color.fromRGBO(233, 233, 233, 1),)
                ],
                ),
                LoginWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
