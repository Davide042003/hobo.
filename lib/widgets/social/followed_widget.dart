import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/social/post_widget.dart';

class FollowedWidget extends StatefulWidget {
  @override
  _FollowedWidgetState createState() => _FollowedWidgetState();
}

class _FollowedWidgetState extends State<FollowedWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          PostWidget()
        ],
      ),
    );
  }
}
