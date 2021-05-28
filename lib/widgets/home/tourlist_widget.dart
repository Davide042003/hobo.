import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/styles/dark_theme_styles.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/provider/dark_theme_provider.dart';
import 'package:hobo_test/widgets/styles/constants.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'cardtour_widget.dart';

class TourlistWidget extends StatefulWidget {
  @override
  _TourlistWidgetState createState() => _TourlistWidgetState();
}

class _TourlistWidgetState extends State<TourlistWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.18, left: SizeConfig.screenWidth*0.07, right: SizeConfig.screenWidth*0.07),
      child: ListView(
        children: [
          CardTourWidget(

          )
        ],
      ),
    );
  }
}
