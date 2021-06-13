import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/social/postexplore_widget.dart';

class ExploreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: Offset(0, 3))
      ]),
      child: Row(
        children: [
          Container(
            width: SizeConfig.screenWidth*0.5,
              child: ListView.separated(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (ctx, i) => PostExploreWidget(),
                separatorBuilder: (ctx, i) => SizedBox(
                  height: SizeConfig.screenHeight * 0.012,
                ),
              )
          ),
          Container(
            width: SizeConfig.screenWidth*0.5,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
