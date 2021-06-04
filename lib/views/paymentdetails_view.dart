import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/styles/constants.dart';

class PaymentDetailsView extends StatefulWidget {
  @override
  _PaymentDetailsViewState createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends State<PaymentDetailsView>
    with TickerProviderStateMixin {
  bool _sendEmail = true;
  AnimationController _controller;
  Animation<double> _animation;
  bool _openCard = false;
  List<RadioModel> cardType = new List<RadioModel>();
  int cardsCount = 1;

  @override
  void initState() {
    super.initState();

    cardType.add(new RadioModel(true, LineIcons.visaCreditCard));
    cardType.add(new RadioModel(false, LineIcons.mastercardCreditCard));
    cardType.add(new RadioModel(false, LineIcons.americanExpressCreditCard));

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
  }

  void _openCardAdd() {
    setState(() {
      if (!_openCard) {
        _openCard = true;
        _controller.forward();
      } else {
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
          AnimatedContainer(
            duration: new Duration(milliseconds: 500),
            height: SizeConfig.screenHeight * (_openCard ? (cardsCount > 0 ? 0.4 : 0.23) : 0.08),
            curve: Curves.easeInOut,
            child: _openCard
                ? SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.07),
                      decoration: BoxDecoration(
                          color: Styles.blackwhite(
                              themeChange.darkTheme, context),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.05),
                                blurRadius: 29,
                                offset: Offset(0, 3))
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.screenHeight * 0.016),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.screenWidth * 0.06),
                              child: GestureDetector(
                                onTap: (){
                                  _openCardAdd();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.payment,
                                      color: Styles.whiteblack(
                                          themeChange.darkTheme, context),
                                      size: 40,
                                    ),
                                    SizedBox(
                                        width: SizeConfig.screenWidth * 0.04),
                                    Text(
                                      "Card",
                                      style: TextStyle(
                                          fontFamily: Constants.POPPINS,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Styles.whiteblack(
                                              themeChange.darkTheme, context)),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: RotationTransition(
                                          turns:
                                              Tween<double>(begin: 0, end: .25)
                                                  .animate(_animation),
                                          child: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Styles.whiteblack(
                                                themeChange.darkTheme, context),
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.screenHeight * 0.02),
                            Container(
                              width: SizeConfig.screenWidth,
                              height: SizeConfig.screenHeight * 0.0015,
                              color: Styles.tourpreview_bar(
                                  themeChange.darkTheme, context),
                            ),
                            SizedBox(height: SizeConfig.screenHeight * 0.02),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                    child: RadioItemPayOption(cardType[0]),
                                    onTap: () {
                                      setState(() {
                                        cardType.forEach((element) =>
                                            element.isSelected = false);
                                        cardType[0].isSelected = true;
                                      });
                                    }),
                                GestureDetector(
                                    child: RadioItemPayOption(cardType[1]),
                                    onTap: () {
                                      setState(() {
                                        cardType.forEach((element) =>
                                            element.isSelected = false);
                                        cardType[1].isSelected = true;
                                      });
                                    }),
                                GestureDetector(
                                    child: RadioItemPayOption(cardType[2]),
                                    onTap: () {
                                      setState(() {
                                        cardType.forEach((element) =>
                                            element.isSelected = false);
                                        cardType[2].isSelected = true;
                                      });
                                    })
                              ],
                            ),
                            cardsCount > 0 ? Container(
                              width: SizeConfig.screenWidth * 0.72,
                              height: SizeConfig.screenHeight * 0.17,
                              child: ListView.separated(
                                  physics: PageScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, int i) {
                                    return new CardItem();
                                  },
                                  separatorBuilder: (context, index) => SizedBox(width: SizeConfig.screenWidth * 0.05),
                                 itemCount: 2,
                              )
                            ):SizedBox(),
                            SizedBox(height: SizeConfig.screenHeight *0.01,),
                            Container(
                              width: SizeConfig.screenWidth,
                              height: SizeConfig.screenHeight*0.05,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: SizeConfig.screenWidth*0.06,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(116, 142, 243, 1)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(LineIcons.plus, color: Styles.blackwhite(themeChange.darkTheme, context),size: 15,),
                                    ),
                                  ),
                                  SizedBox(width: SizeConfig.screenWidth*0.025),
                                  Text("Add New Card", style: TextStyle(fontFamily: Constants.POPPINS,fontSize: 15,fontWeight: FontWeight.w600,color: Styles.whiteblack(themeChange.darkTheme, context)),)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : GestureDetector(
              onTap: () { _openCardAdd();},
                  child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.07),
                      decoration: BoxDecoration(
                          color:
                              Styles.blackwhite(themeChange.darkTheme, context),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.05),
                                blurRadius: 29,
                                offset: Offset(0, 3))
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.06,
                            vertical: SizeConfig.screenHeight * 0.016),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.payment,
                                  color: Styles.whiteblack(
                                      themeChange.darkTheme, context),
                                  size: 40,
                                ),
                                SizedBox(width: SizeConfig.screenWidth * 0.04),
                                Text(
                                  "Card",
                                  style: TextStyle(
                                      fontFamily: Constants.POPPINS,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Styles.whiteblack(
                                          themeChange.darkTheme, context)),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: RotationTransition(
                                      turns: Tween<double>(begin: 0, end: .25)
                                          .animate(_animation),
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Styles.whiteblack(
                                            themeChange.darkTheme, context),
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
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
                      if (!_sendEmail) {
                        _sendEmail = true;
                      } else {
                        _sendEmail = false;
                      }
                    });
                  },
                  child: Container(
                    width: SizeConfig.screenWidth * 0.3,
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

class RadioItemPayOption extends StatelessWidget {
  final RadioModel _item;

  RadioItemPayOption(this._item);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return new Container(
      width: SizeConfig.screenWidth * 0.2,
      height: SizeConfig.screenHeight * 0.045,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(
              color: _item.isSelected
                  ? Color.fromRGBO(26, 65, 187, 1)
                  : Color.fromRGBO(236, 236, 236, 1)),
          color: Colors.white),
      child: Center(
        child: Icon(
          _item.icon,
          size: 35,
        ),
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final IconData icon;

  RadioModel(this.isSelected, this.icon);
}

class CardItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(
          top: SizeConfig.screenHeight * 0.02),
      width: SizeConfig.screenWidth * 0.72,
      height: SizeConfig.screenHeight * 0.17,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(20)),
          gradient: LinearGradient(
              colors: [
                Color.fromRGBO(35, 72, 145, 1),
                Color.fromRGBO(38, 146, 217, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
    );
  }
}
