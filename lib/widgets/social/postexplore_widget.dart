import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class PostExploreWidget extends StatefulWidget {
  @override
  _PostExploreWidgetState createState() => _PostExploreWidgetState();
}

class _PostExploreWidgetState extends State<PostExploreWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      color: Colors.blue,
    );
  }
}
