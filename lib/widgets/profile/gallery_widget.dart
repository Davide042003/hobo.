import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class GalleryWidget extends StatefulWidget {
  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GridView.builder(
      shrinkWrap: true,
        padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.01, bottom: SizeConfig.screenHeight *.12),
        itemCount: 20,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: SizeConfig.screenWidth*0.005, mainAxisSpacing:SizeConfig.screenHeight*0.0023),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: SizeConfig.screenWidth * 0.28,
            //    height: SizeConfig.screenWidth * 0.14,
            child: Image.asset(
              "assets/images/NewYork-Background.png",
              fit: BoxFit.cover,
            ),
          );
        });
  }
}
