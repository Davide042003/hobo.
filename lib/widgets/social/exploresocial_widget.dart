import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/social/postexplore_widget.dart';
import 'package:hobo_test/widgets/social/tag_widget.dart';

class ExploreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Column(
      children: [
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * 0.08,
          child: ListView.separated(
              primary: false,
              padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.06),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                    width: SizeConfig.screenWidth * 0.025,
                  ),
              itemBuilder: (ctx, i) => TagWidget(
                    startColor: Color.fromRGBO(255, 129, 205, 1),
                    finalColor: Color.fromRGBO(207, 74, 154, 1),
                    tag: "Photography",
                  )),
        ),
        Container(
          margin:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.065),


          /*
          child: StaggeredGridView.countBuilder(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                  top: SizeConfig.screenHeight * 0.006,
                  bottom: SizeConfig.screenHeight * .12),
              itemCount: 20,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: SizeConfig.screenWidth * 0.05,
              mainAxisSpacing: SizeConfig.screenHeight * 0.025,
              itemBuilder: (BuildContext context, int index) {
                return PostExploreWidget();
              },
              staggeredTileBuilder: (index) {
                //return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
              }),
           */
        )
      ],
    );
  }
}
