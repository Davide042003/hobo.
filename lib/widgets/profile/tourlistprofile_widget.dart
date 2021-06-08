import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/home/cardtour_template.dart';
import 'package:hobo_test/widgets/home/cardtour_widget.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class TourlistProfileWidget extends StatefulWidget {
  @override
  _TourlistProfileWidgetState createState() => _TourlistProfileWidgetState();
}

class _TourlistProfileWidgetState extends State<TourlistProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: cardTourArrayList.length,
          itemBuilder: (ctx, i) => CardTourWidget(index: i),
          separatorBuilder: (context, index) => SizedBox(height: SizeConfig.screenHeight * 0.017),
        ));
  }
}