import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class PeopleAndDateWidget extends StatefulWidget {
  final bool checkBoxValue;
  final VoidCallback callback;

  const PeopleAndDateWidget(this.checkBoxValue, this.callback);

  @override
  _PeopleAndDateWidgetState createState() => _PeopleAndDateWidgetState();
}

class _PeopleAndDateWidgetState extends State<PeopleAndDateWidget> {
  List<RadioModel> peopleData = new List<RadioModel>();
  List<RadioModel> childrenData = new List<RadioModel>();

  FocusNode focusNodeAddPeople;
  FocusNode focusNodeAddChildren;

  @override
  void initState() {
    super.initState();

    peopleData.add(new RadioModel(true, '1'));
    peopleData.add(new RadioModel(false, '2'));
    peopleData.add(new RadioModel(false, '3'));
    peopleData.add(new RadioModel(false, '4'));
    peopleData.add(new RadioModel(false, '5'));
    peopleData.add(new RadioModel(false, '+'));

    childrenData.add(new RadioModel(true, '1'));
    childrenData.add(new RadioModel(false, '2'));
    childrenData.add(new RadioModel(false, '3'));
    childrenData.add(new RadioModel(false, '4'));
    childrenData.add(new RadioModel(false, '5'));
    childrenData.add(new RadioModel(false, '+'));

    focusNodeAddPeople = FocusNode();

    focusNodeAddPeople.addListener(() {
      setState(() {
        if (focusNodeAddPeople.hasFocus) {
          focusNodeAddPeople.requestFocus();
        } else {
          focusNodeAddPeople.unfocus();
        }
      });
    });

    focusNodeAddChildren = FocusNode();

    focusNodeAddChildren.addListener(() {
      setState(() {
        if (focusNodeAddChildren.hasFocus) {
          focusNodeAddChildren.requestFocus();
        } else {
          focusNodeAddChildren.unfocus();
        }
      });
    });
  }

  @override
  void dispose() {
    focusNodeAddPeople.dispose();
    focusNodeAddChildren.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.065,
          vertical: SizeConfig.screenHeight * 0.03),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("People",
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color:
                          Styles.whiteblack(themeChange.darkTheme, context)))),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("No. of people in your group",
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Styles.tourpreview_subpeople(
                          themeChange.darkTheme, context)))),
          SizedBox(
            height: SizeConfig.screenHeight * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: RadioItemPeople(peopleData[0], false),
                onTap: () {
                  setState(() {
                    peopleData.forEach((element) => element.isSelected = false);
                    peopleData[0].isSelected = true;
                  });
                },
              ),
              InkWell(
                  child: RadioItemPeople(peopleData[1], false),
                onTap: () {
                  setState(() {
                    peopleData.forEach((element) => element.isSelected = false);
                    peopleData[1].isSelected = true;
                  });
                },),
              InkWell(
                child: RadioItemPeople(peopleData[2], false),
                onTap: () {
                  setState(() {
                    peopleData.forEach((element) => element.isSelected = false);
                    peopleData[2].isSelected = true;
                  });
                },
              ),
              InkWell(
                child: RadioItemPeople(peopleData[3], false),
                onTap: () {
                  setState(() {
                    peopleData.forEach((element) => element.isSelected = false);
                    peopleData[3].isSelected = true;
                  });
                },
              ),
              InkWell(
                child: RadioItemPeople(peopleData[4], false),
                onTap: () {
                  setState(() {
                    peopleData.forEach((element) => element.isSelected = false);
                    peopleData[4].isSelected = true;
                  });
                },
              ),
              InkWell(
                child: RadioItemPeoplePlus(
                    peopleData[5], focusNodeAddPeople, false),
                onTap: () {
                  setState(() {
                    peopleData.forEach((element) => element.isSelected = false);
                    peopleData[5].isSelected = true;

                    focusNodeAddPeople.requestFocus();
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.03,
          ),
          Row(
            children: [
              GestureDetector(
                child: Container(
                  width: SizeConfig.screenWidth * 0.06,
                  height: SizeConfig.screenHeight * 0.027,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: widget.checkBoxValue
                          ? Color.fromRGBO(245, 95, 185, 1)
                          : Colors.transparent,
                      border: widget.checkBoxValue
                          ? null
                          : Border.all(
                              color: Color.fromRGBO(245, 95, 185, 1),
                              width: 1.5)),
                  child: widget.checkBoxValue
                      ? Icon(
                          CustomIcons.check,
                          size: 9,
                          color: Colors.white,
                        )
                      : null,
                ),
                onTap: () {
                  widget.callback();
                  childrenData.forEach((element) => element.isSelected = false);
                  childrenData[0].isSelected = true;
                },
              ),
              SizedBox(
                width: SizeConfig.screenWidth * 0.025,
              ),
              Text(
                "Children",
                style: TextStyle(
                    fontFamily: Constants.POPPINS,
                    fontSize: 16,
                    color: Styles.whiteblack(themeChange.darkTheme, context)),
              )
            ],
          ),
          SizedBox(
            height: widget.checkBoxValue ? SizeConfig.screenHeight * 0.02 : 0,
          ),
          widget.checkBoxValue
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: RadioItemPeople(childrenData[0], true),
                      onTap: () {
                        setState(() {
                          childrenData
                              .forEach((element) => element.isSelected = false);
                          childrenData[0].isSelected = true;
                        });
                      },
                    ),
                    InkWell(
                      child: RadioItemPeople(childrenData[1], true),
                      onTap: () {
                        setState(() {
                          childrenData
                              .forEach((element) => element.isSelected = false);
                          childrenData[1].isSelected = true;
                        });
                      },
                    ),
                    InkWell(
                      child: RadioItemPeople(childrenData[2], true),
                      onTap: () {
                        setState(() {
                          childrenData
                              .forEach((element) => element.isSelected = false);
                          childrenData[2].isSelected = true;
                        });
                      },
                    ),
                    InkWell(
                      child: RadioItemPeople(childrenData[3], true),
                      onTap: () {
                        setState(() {
                          childrenData
                              .forEach((element) => element.isSelected = false);
                          childrenData[3].isSelected = true;
                        });
                      },
                    ),
                    InkWell(
                      child: RadioItemPeople(childrenData[4], true),
                      onTap: () {
                        setState(() {
                          childrenData
                              .forEach((element) => element.isSelected = false);
                          childrenData[4].isSelected = true;
                        });
                      },
                    ),
                    InkWell(
                      child: RadioItemPeoplePlus(
                          childrenData[5], focusNodeAddChildren, true),
                      onTap: () {
                        setState(() {
                          childrenData
                              .forEach((element) => element.isSelected = false);
                          childrenData[5].isSelected = true;

                          focusNodeAddChildren.requestFocus();
                        });
                      },
                    ),
                  ],
                )
              : SizedBox(
                  width: 0,
                ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.03,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Date and Time",
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color:
                          Styles.whiteblack(themeChange.darkTheme, context)))),
          SizedBox(
            height: SizeConfig.screenHeight * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: SizeConfig.screenWidth * 0.5,
                height: SizeConfig.screenHeight * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Styles.tourpreview_peopleunselected(
                        themeChange.darkTheme, context)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.04,
                      vertical: SizeConfig.screenHeight * 0.001),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Date",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 16,
                              color: Styles.whiteblack(
                                  themeChange.darkTheme, context)),
                        ),
                        Icon(CustomIcons.calendaricon,
                            color: Styles.whiteblack(
                                themeChange.darkTheme, context), size: 20)
                      ]),
                ),
              ),
              Container(
                width: SizeConfig.screenWidth * 0.32,
                height: SizeConfig.screenHeight * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Styles.tourpreview_peopleunselected(
                        themeChange.darkTheme, context)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.04,
                      vertical: SizeConfig.screenHeight * 0.001),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Time",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 16,
                              color: Styles.whiteblack(
                                  themeChange.darkTheme, context)),
                        ),
                        Icon(CustomIcons.clockicon,
                            color: Styles.whiteblack(
                                themeChange.darkTheme, context), size: 20,)
                      ]),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class RadioItemPeople extends StatelessWidget {
  final RadioModel _item;
  final bool _children;
  RadioItemPeople(this._item, this._children);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return new Container(
      width: SizeConfig.screenWidth * 0.12,
      height: SizeConfig.screenHeight * 0.055,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: _item.isSelected
              ? LinearGradient(colors: [
                  _children
                      ? Color.fromRGBO(245, 95, 185, 1)
                      : Color.fromRGBO(116, 142, 243, 1),
                  _children
                      ? Color.fromRGBO(207, 74, 154, 1)
                      : Color.fromRGBO(36, 65, 187, 1),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
              : null,
          color: _item.isSelected
              ? null
              : Styles.tourpreview_peopleunselected(
                  themeChange.darkTheme, context)),
      child: Center(
          child: Text(
        _item.buttonText,
        style: TextStyle(
            fontFamily: Constants.POPPINS,
            fontSize: 15,
            color: _item.isSelected
                ? Colors.white
                : Color.fromRGBO(191, 191, 191, 1)),
      )),
    );
  }
}

class RadioItemPeoplePlus extends StatelessWidget {
  final RadioModel _item;
  final FocusNode _focusNode;
  final bool _children;

  RadioItemPeoplePlus(this._item, this._focusNode, this._children);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return new Container(
      width: SizeConfig.screenWidth * 0.12,
      height: SizeConfig.screenHeight * 0.055,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: _item.isSelected
              ? LinearGradient(colors: [
                  _children
                      ? Color.fromRGBO(245, 95, 185, 1)
                      : Color.fromRGBO(116, 142, 243, 1),
                  _children
                      ? Color.fromRGBO(207, 74, 154, 1)
                      : Color.fromRGBO(36, 65, 187, 1),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
              : null,
          border: _item.isSelected
              ? null
              : Border.all(color: Color.fromRGBO(116, 142, 243, 1), width: 1),
          color: _item.isSelected ? null : Colors.transparent),
      child: Center(
          child: _item.isSelected
              ? CupertinoTextField.borderless(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 15,
                      color: Colors.white),
                  maxLength: 2,
                  focusNode: _focusNode,
                  textInputAction: TextInputAction.done,
                )
              : Text(
                  "+",
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 25,
                      color: _item.isSelected
                          ? Colors.white
                          : Color.fromRGBO(116, 142, 243, 1)),
                )),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText);
}
