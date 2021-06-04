import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/home/cardtour_template.dart';
import 'cardtour_widget.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class TourlistWidget extends StatefulWidget {
  @override
  _TourlistWidgetState createState() => _TourlistWidgetState();
}

class _TourlistWidgetState extends State<TourlistWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            top: SizeConfig.screenHeight * 0.18,
            left: SizeConfig.screenWidth * 0.07,
            right: SizeConfig.screenWidth * 0.07,
            bottom: SizeConfig.screenHeight * 0.05),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: cardTourArrayList.length,
          itemBuilder: (ctx, i) => CardTourWidget(index: i),
          separatorBuilder: (context, index) => SizedBox(height: SizeConfig.screenHeight * 0.017),
        ));
  }
}
