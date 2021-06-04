import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/styles/constants.dart';

class PaymentDetailsView extends StatefulWidget {
  @override
  _PaymentDetailsViewState createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends State<PaymentDetailsView> with TickerProviderStateMixin{
  bool _sendEmail = true;
  AnimationController _controller;
  Animation<double> _animation;
  bool _openCard = false;

  @override
  void initState(){
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
  }

  void _openCardAdd(){
    setState(() {
      if(!_openCard) {
        _openCard = true;
        _controller.forward();
      }else{
        _openCard = false;
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      backgroundColor:
          Styles.loginregister_background(themeChange.darkTheme, context),
      body: Column(
        children: [
          Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.13,
              child: Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.screenWidth * 0.02,
                    top: SizeConfig.screenHeight * 0.04),
                child: Row(children: [
                  GestureDetector(
                    child: Container(
                      width: SizeConfig.screenWidth * 0.125,
                      height: SizeConfig.screenHeight,
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color:
                            Styles.whiteblack(themeChange.darkTheme, context),
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: SizeConfig.screenWidth * 0.04),
                  Text(
                    "Payment Details",
                    style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        color:
                            Styles.whiteblack(themeChange.darkTheme, context),
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                ]),
              )),
          GestureDetector(
            onTap: (){
             _openCardAdd();
            },
            child: Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.08,
              margin:
                  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.07),
              decoration: BoxDecoration(
                  color: Styles.blackwhite(themeChange.darkTheme, context),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        blurRadius: 29,
                        offset: Offset(0, 3))
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.payment,
                      color: Styles.whiteblack(themeChange.darkTheme, context),
                      size: 40,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.04),
                    Text(
                      "Card",
                      style: TextStyle(
                          fontFamily: Constants.POPPINS,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color:
                              Styles.whiteblack(themeChange.darkTheme, context)),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: RotationTransition(
                          turns: Tween<double>(begin: 0, end: .25).animate(_animation),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color:
                                Styles.whiteblack(themeChange.darkTheme, context),
                            size: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.025),
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.08,
            margin:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.07),
            decoration: BoxDecoration(
                color: Styles.blackwhite(themeChange.darkTheme, context),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 29,
                      offset: Offset(0, 3))
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    LineIcons.applePayCreditCard,
                    color: Styles.whiteblack(themeChange.darkTheme, context),
                    size: 40,
                  ),
                  SizedBox(width: SizeConfig.screenWidth * 0.04),
                  Text(
                    "Apple Pay",
                    style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color:
                            Styles.whiteblack(themeChange.darkTheme, context)),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color:
                            Styles.whiteblack(themeChange.darkTheme, context),
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.025),
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.08,
            margin:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.07),
            decoration: BoxDecoration(
                color: Styles.blackwhite(themeChange.darkTheme, context),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 29,
                      offset: Offset(0, 3))
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    LineIcons.paypal,
                    color: Styles.whiteblack(themeChange.darkTheme, context),
                    size: 40,
                  ),
                  SizedBox(width: SizeConfig.screenWidth * 0.04),
                  Text(
                    "PayPal",
                    style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color:
                            Styles.whiteblack(themeChange.darkTheme, context)),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color:
                            Styles.whiteblack(themeChange.darkTheme, context),
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.025),
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.08,
            margin:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.07),
            decoration: BoxDecoration(
                color: Styles.blackwhite(themeChange.darkTheme, context),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 29,
                      offset: Offset(0, 3))
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    LineIcons.stripeS,
                    color: Styles.whiteblack(themeChange.darkTheme, context),
                    size: 40,
                  ),
                  SizedBox(width: SizeConfig.screenWidth * 0.04),
                  Text(
                    "Stripe",
                    style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color:
                            Styles.whiteblack(themeChange.darkTheme, context)),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color:
                            Styles.whiteblack(themeChange.darkTheme, context),
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.03),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.08),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Send receipt to your email",
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 15,
                      color: Styles.whiteblack(themeChange.darkTheme, context)),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      if(!_sendEmail) {
                        _sendEmail = true;
                      }else{
                        _sendEmail = false;
                      }
                    });
                  },
                  child: Container(
                    width: SizeConfig.screenWidth*0.3,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          value: _sendEmail,
                          onChanged: (bool value) {
                            setState(() {
                              _sendEmail = value;
                            });
                          },
                          trackColor: Colors.grey,
                          activeColor: Color.fromRGBO(245, 95, 185, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
