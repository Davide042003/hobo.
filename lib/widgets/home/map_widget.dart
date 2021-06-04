import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

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
