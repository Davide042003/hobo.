import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/add_tour/counter_widget.dart';
import 'package:hobo_test/widgets/add_tour/inputfieldnewtour_widget.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/provider/tour_provider.dart';

class AddVehicle extends StatefulWidget {
  final PageController pageController;

  const AddVehicle(this.pageController);

  @override
  _AddVehicleState createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  final _formKey = GlobalKey<FormState>();

  FocusNode focusNodePrice;

  @override
  void initState() {
    super.initState();

    focusNodePrice = FocusNode();

    focusNodePrice.addListener(() {
      setState(() {
        if (focusNodePrice.hasFocus) {
          focusNodePrice.requestFocus();
        } else {
          focusNodePrice.unfocus();
        }
      });
    });
  }

  @override
  void dispose() {
    focusNodePrice.dispose();

    super.dispose();
  }

  void _updateCounter(int value) {
    setState(() {
      _maxPeople = value;
    });
  }


  void _trySubmitForm() async {
    final isValid = _formKey.currentState.validate();
    if (isValid) {

    }
  }

  String _price = "";
  int _maxPeople = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final addNewTour = Provider.of<TourProvider>(context);

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: SizeConfig.screenHeight * 0.14,
            horizontal: SizeConfig.screenWidth * 0.035),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Styles.publishtour_background(themeChange.darkTheme, context),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenHeight * 0.025),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.05,
                          vertical: SizeConfig.screenHeight * 0.01),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Container(
                              height: SizeConfig.screenHeight * 0.04,
                              width: SizeConfig.screenWidth * 0.1,
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: SizeConfig.screenHeight * 0.005),
                                    child: Icon(
                                      CustomIcons.backarrow,
                                      color: Styles.publishtour_close(
                                          themeChange.darkTheme, context),
                                      size: 13,
                                    ),
                                  )),
                            ),
                            onTap: () {
                              setState(() {
                                widget.pageController.jumpToPage(4);
                              });
                            },
                          ),
                          SizedBox(width: SizeConfig.screenWidth * 0.1),
                          Container(
                              height: SizeConfig.screenHeight * 0.04,
                              child: Text(
                                "ADD VEHICLE",
                                style: TextStyle(
                                    fontFamily: Constants.POPPINS,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Styles.whiteblack(
                                        themeChange.darkTheme, context),
                                    letterSpacing: 4),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.015),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.0465,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Type",
                            style: TextStyle(
                                fontFamily: Constants.POPPINS,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Styles.whiteblack(
                                    themeChange.darkTheme, context)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.0465,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "No. of People",
                                  style: TextStyle(
                                      fontFamily: Constants.POPPINS,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: Styles.whiteblack(
                                          themeChange.darkTheme, context)),
                                ),
                                Text(
                                  "Max people per vehicle",
                                  style: TextStyle(
                                      fontFamily: Constants.POPPINS,
                                      fontSize: 10,
                                      color: Color.fromRGBO(158, 158, 158, 1)),
                                )
                              ],
                            ),
                            Expanded(child: Align(alignment:Alignment.centerRight,child: CounterWidget((value) { _updateCounter(value);}, false)))
                          ],
                        )),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.0465,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Price",
                            style: TextStyle(
                                fontFamily: Constants.POPPINS,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Styles.whiteblack(
                                    themeChange.darkTheme, context)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.0465,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: SizeConfig.screenWidth * 0.1,
                            height: SizeConfig.screenHeight * 0.055,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: Styles.publishtour_backgroundinputfield(
                                  themeChange.darkTheme, context),
                            ),
                            child: Center(
                              child: Text("\$", style: TextStyle(
                                  fontFamily: Constants.POPPINS,
                                  fontSize: 20,
                                  color: Styles.whiteblack(themeChange.darkTheme, context)
                              ),),
                            ),
                          ),
                          SizedBox(width: SizeConfig.screenWidth * 0.01,),
                          Expanded(
                            child: InputFieldNewTour("Enter price",
                                    (value) => _price = value, focusNodePrice, null, true, null),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.05),
                      child: Container(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight * 0.0015,
                        color: Styles.tourpreview_barlight(
                            themeChange.darkTheme, context),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.04),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.27),
                      child: GestureDetector(
                        onTap: () => null,
                        child: Container(
                            width: SizeConfig.screenWidth,
                            height: SizeConfig.screenHeight * 0.07,
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
                              onPressed: () {
                                addNewTour.setNumberOfPeopleVehicle = _maxPeople;
                                addNewTour.setPriceVehicle = _price;
                                addNewTour.createVehicleInfo();
                                _trySubmitForm();
                              },
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                    fontFamily: Constants.POPPINS,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.015,
                    )
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
