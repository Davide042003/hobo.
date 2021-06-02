import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/provider/dark_theme_provider.dart';
import 'package:hobo_test/widgets/styles/constants.dart';
import 'package:hobo_test/widgets/styles/dark_theme_styles.dart';

class PeopleAndDateWidget extends StatefulWidget {
  @override
  _PeopleAndDateWidgetState createState() => _PeopleAndDateWidgetState();
}

class _PeopleAndDateWidgetState extends State<PeopleAndDateWidget> {
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    super.initState();

    sampleData.add(new RadioModel(true, '1'));
    sampleData.add(new RadioModel(false, '2'));
    sampleData.add(new RadioModel(false, '3'));
    sampleData.add(new RadioModel(false, '4'));
    sampleData.add(new RadioModel(false, '5'));

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.065,
          vertical: SizeConfig.screenHeight * 0.02),
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
            height: SizeConfig.screenHeight *0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: RadioItem(sampleData[0]),
                onTap: () {
                  setState(() {
                    sampleData.forEach((element) => element.isSelected = false);
                    sampleData[0].isSelected = true;
                  });
                },
              ),
              InkWell(
                child: RadioItem(sampleData[1]),
                onTap: () {
                  setState(() {
                    sampleData.forEach((element) => element.isSelected = false);
                    sampleData[1].isSelected = true;
                  });
                },
              ),
              InkWell(
                child: RadioItem(sampleData[2]),
                onTap: () {
                  setState(() {
                    sampleData.forEach((element) => element.isSelected = false);
                    sampleData[2].isSelected = true;
                  });
                },
              ),
              InkWell(
                child: RadioItem(sampleData[3]),
                onTap: () {
                  setState(() {
                    sampleData.forEach((element) => element.isSelected = false);
                    sampleData[3].isSelected = true;
                  });
                },
              ),
              InkWell(
                child: RadioItem(sampleData[4]),
                onTap: () {
                  setState(() {
                    sampleData.forEach((element) => element.isSelected = false);
                    sampleData[4].isSelected = true;
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return new Container(
      width: SizeConfig.screenWidth * 0.12,
      height: SizeConfig.screenHeight * 0.055,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: _item.isSelected ? LinearGradient(
              colors: [
                Color.fromRGBO(116, 142, 243, 1),
                Color.fromRGBO(36, 65, 187, 1)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          ) : null,
          color: _item.isSelected ? null : Styles.tourpreview_peopleunselected(themeChange.darkTheme, context)
      ),
      child: Center(child: Text(_item.buttonText,style: TextStyle(fontFamily: Constants.POPPINS, fontSize: 15, color: _item.isSelected ? Colors.white : Color.fromRGBO(191, 191, 191, 1)),)),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText);
}