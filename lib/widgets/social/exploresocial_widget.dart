import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/social/postexplore_widget.dart';
import 'package:hobo_test/widgets/social/tag_widget.dart';

class ExploreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.08,
      child: ListView.separated(
        padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.06),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
          itemCount: 7,
          separatorBuilder: (BuildContext context, int index) => SizedBox(width: SizeConfig.screenWidth*0.025,),
          itemBuilder: (ctx, i) => TagWidget(
                startColor: Color.fromRGBO(255, 129, 205, 1),
                finalColor: Color.fromRGBO(207, 74, 154, 1),
                tag: "Photography",
              )),
    );
  }
}
