import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hobo_test/views/addcard_view.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/payment/cardpayment_template.dart';
import 'package:hobo_test/widgets/payment/paymentOptions_widget.dart';

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
  int selectedCardIndex = 0;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < cardPaymentArrayList.length; i++) {
      if (i == 0) {
        cardType.add(new RadioModel(true));
      } else {
        cardType.add(new RadioModel(false));
      }
    }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(themeChange, context),
            CardPaymentOption(themeChange, context),
            SizedBox(height: SizeConfig.screenHeight * 0.025),
            PaymentOptionsWidget(SvgPicture.asset("assets/images/applepay.svg", width: SizeConfig.screenWidth *0.09, color: Styles.whiteblack(themeChange.darkTheme, context),), "Apple Pay"),
            SizedBox(height: SizeConfig.screenHeight * 0.025),
            PaymentOptionsWidget(SvgPicture.asset("assets/images/paypal.svg"), "PayPal"),
            SizedBox(height: SizeConfig.screenHeight * 0.025),
            PaymentOptionsWidget(SvgPicture.asset("assets/images/stripe.svg"), "Stripe"),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.08),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Send receipt to your email",
                    style: TextStyle(
                        fontFamily: Constants.POPPINS,
                        fontSize: 15,
                        color:
                            Styles.whiteblack(themeChange.darkTheme, context)),
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
      ),
    );
  }

  Container TopBar(DarkThemeProvider themeChange, BuildContext context) {
    return Container(
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
                  color: Styles.whiteblack(themeChange.darkTheme, context),
                  size: 20,
                ),
              ),
            ),
            SizedBox(width: SizeConfig.screenWidth * 0.04),
            Text(
              "Payment Details",
              style: TextStyle(
                  fontFamily: Constants.POPPINS,
                  color: Styles.whiteblack(themeChange.darkTheme, context),
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ]),
        ));
  }

  AnimatedContainer CardPaymentOption(
      DarkThemeProvider themeChange, BuildContext context) {
    return AnimatedContainer(
      duration: new Duration(milliseconds: 500),
      height: SizeConfig.screenHeight *
          (_openCard
              ? (cardPaymentArrayList.length > 0
                  ? 0.35 + cardPaymentArrayList.length * 0.055
                  : 0.18)
              : 0.08),
      curve: Curves.easeInOut,
      child: _openCard
          ? SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.07),
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
                      vertical: SizeConfig.screenHeight * 0.016),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.06),
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            _openCardAdd();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: SizeConfig.screenHeight*0.048),
                              Container(child: SvgPicture.asset("assets/images/cardIcon.svg"), width: SizeConfig.screenWidth*0.1,),
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
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.02),
                      Container(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight * 0.0015,
                        color: Styles.tourpreview_bar(
                            themeChange.darkTheme, context),
                      ),
                      SizedBox(
                          height: SizeConfig.screenHeight *
                              (cardPaymentArrayList.length > 0 ? 0.02 : 0.005)),
                      cardPaymentArrayList.length > 0 ? CardItem(themeChange, context) : SizedBox(),
                      SizedBox(
                        height: SizeConfig.screenHeight *
                            (cardPaymentArrayList.length > 0 ? 0.02 : 0.005),
                      ),
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: cardPaymentArrayList.length,
                        itemBuilder: (ctx, i) => GestureDetector(
                          child: CardsOptions(
                            index: i,
                            item: cardType[i],
                          ),
                          onTap: () {
                            setState(() {
                              cardType.forEach(
                                  (element) => element.isSelected = false);
                              cardType[i].isSelected = true;
                              selectedCardIndex = i;
                            });
                          },
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: SizeConfig.screenHeight * 0.015),
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.01),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddCardView()),
                          );
                          },
                        child: Container(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight * 0.05,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: SizeConfig.screenWidth * 0.06,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(116, 142, 243, 1)),
                                child: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(
                                    LineIcons.plus,
                                    color: Styles.blackwhite(
                                        themeChange.darkTheme, context),
                                    size: 15,
                                  ),
                                ),
                              ),
                              SizedBox(width: SizeConfig.screenWidth * 0.025),
                              Text(
                                "Add New Card",
                                style: TextStyle(
                                    fontFamily: Constants.POPPINS,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Styles.whiteblack(
                                        themeChange.darkTheme, context)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : GestureDetector(
              onTap: () {
                _openCardAdd();
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.07),
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
                      horizontal: SizeConfig.screenWidth * 0.06,
                      vertical: SizeConfig.screenHeight * 0.016),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: SizeConfig.screenHeight*0.048),
                          Container(child: SvgPicture.asset("assets/images/cardIcon.svg"), width: SizeConfig.screenWidth*0.1,),
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
    );
  }

  Container CardItem(DarkThemeProvider themeChange, BuildContext context){
    return Container(
      width: SizeConfig.screenWidth * 0.72,
      height: SizeConfig.screenHeight * 0.17,
      child: Stack(
        children: [
          Image.asset("assets/images/CreditCard.png", fit: BoxFit.fill),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.07,
                vertical: SizeConfig.screenHeight * 0.023),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: SizeConfig.screenWidth * 0.12,
                  height: SizeConfig.screenHeight * 0.025,
                  color: Colors.white,
                ),
                Text(
                  cardPaymentArrayList[selectedCardIndex].name,
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 14,
                      color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(left:SizeConfig.screenWidth*0.25,top: SizeConfig.screenHeight*0.008),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("VALID \nTHRU", style: TextStyle(
                          fontFamily: Constants.POPPINS,
                          fontSize: 7,
                          color: Colors.white, height: 0.8)),
                      Text(cardPaymentArrayList[selectedCardIndex].expiration, style: TextStyle(
                          fontFamily: Constants.POPPINS,
                          fontSize: 13,
                          color: Colors.white))
                    ],
                  ),
                ),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "**** - **** - **** - " + cardPaymentArrayList[selectedCardIndex].lastNumber.toString(),
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 15,
                              color: Colors.white,
                              letterSpacing: SizeConfig.screenWidth * 0.004),
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardsOptions extends StatelessWidget {
  final int index;
  final RadioModel item;

  CardsOptions({@required this.index, this.item});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.07),
      child: Row(
        children: [
          Container(
            width: SizeConfig.screenWidth * 0.055,
            height: SizeConfig.screenHeight * 0.03,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color.fromRGBO(236, 236, 236, 1))),
            child: item.isSelected
                ? Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.008),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(36, 65, 187, 1)))
                : null,
          ),
          SizedBox(width: SizeConfig.screenWidth * 0.025),
          Icon(LineIcons.mastercardCreditCard, size: 30, color: Styles.whiteblack(themeChange.darkTheme, context),),
          SizedBox(width: SizeConfig.screenWidth * 0.025),
          Text(
            cardPaymentArrayList[index].type + " x-" + cardPaymentArrayList[index].lastNumber.toString(),
            style: TextStyle(fontFamily: Constants.POPPINS, fontSize: 15, color: Styles.whiteblack(themeChange.darkTheme, context)),
          )
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;

  RadioModel(this.isSelected);
}