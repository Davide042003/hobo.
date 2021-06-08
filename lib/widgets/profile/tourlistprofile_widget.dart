import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/home/cardtour_template.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/profile/cardtourprofile_widget.dart';

class TourlistProfileWidget extends StatefulWidget {
  @override
  _TourlistProfileWidgetState createState() => _TourlistProfileWidgetState();
}

class _TourlistProfileWidgetState extends State<TourlistProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: SizeConfig.screenWidth * 0.05,
        right: SizeConfig.screenWidth * 0.05,
      ),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: SizeConfig.screenHeight *0.01, bottom: SizeConfig.screenHeight*0.12),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: cardTourArrayList.length,
          itemBuilder: (ctx, i) => CardTourProfileWidget(index: i),
          separatorBuilder: (context, index) => SizedBox(height: SizeConfig.screenHeight * 0.017),
        ));
  }
}