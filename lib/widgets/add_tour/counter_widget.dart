import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class CounterWidget extends StatefulWidget {
  final Function(int) countPeople;

  const CounterWidget(this.countPeople);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _currentCount;
  int _minNumber;

  @override
  void initState() {
    _currentCount = 0;
    _minNumber = 0;

    super.initState();
  }

  void _increment() {
    setState(() {
      _currentCount++;
      widget.countPeople(_currentCount);
    });
  }

  void _dicrement() {
    setState(() {
      if (_currentCount > _minNumber) {
        _currentCount--;
        widget.countPeople(_currentCount);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return  Container(
      width: SizeConfig.screenWidth * 0.32,
      height: SizeConfig.screenHeight * 0.05,
      decoration: BoxDecoration(
          color: Styles.publishtour_backgroundinputfield(
              themeChange.darkTheme, context),
          borderRadius:
          BorderRadius.all(Radius.circular(5))),
      child: Row(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: _dicrement,
            child: Container(
              width: SizeConfig.screenWidth * 0.095,
              height: SizeConfig.screenHeight,
              child: Center(
                child: Text(
                  "-",
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      color: Styles.whiteblack(themeChange.darkTheme, context)),
                ),
              ),
            ),
          ),
          Container(
            width: SizeConfig.screenWidth * 0.13,
            height: SizeConfig.screenHeight * 0.045,
            color: Colors.white,
            child: Center(
              child: Text(_currentCount.toString(), style: TextStyle(fontFamily: Constants.POPPINS,
                  fontSize: 15,
                  color: Color.fromRGBO(51, 51, 51, 0.3))),
            )
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: _increment,
            child: Container(
              width: SizeConfig.screenWidth * 0.095,
              height: SizeConfig.screenHeight,
              child:  Center(
                child: Text(
                  "+", style: TextStyle(
                    fontFamily: Constants.POPPINS,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Styles.whiteblack(themeChange.darkTheme, context)
                ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}