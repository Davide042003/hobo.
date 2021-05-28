import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/styles/dark_theme_styles.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/provider/dark_theme_provider.dart';
import 'package:hobo_test/widgets/styles/constants.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {


  @override
  Widget build(BuildContext context) {
    return  Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      color: Colors.grey,
    );
  }
}
