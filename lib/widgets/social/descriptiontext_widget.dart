import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({@required this.text});

  @override
  _DescriptionTextWidgetState createState() => new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String firstHalf;
  String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 100) {
      firstHalf = widget.text.substring(0, 100);
      secondHalf = widget.text.substring(100, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: secondHalf.isEmpty
          ? new Text(firstHalf, style:  TextStyle(fontFamily: Constants.POPPINS, fontSize: 10),)
          : new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf), style: TextStyle(fontFamily: Constants.POPPINS, fontSize: 10),),
          flag ? new InkWell(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text(
                  "other",
                  style: new TextStyle(color: Colors.blue),
                ),
              ],
            ),
            onTap: () {
              setState(() {
                flag = !flag;
              });
            },
          ): SizedBox(),
        ],
      ),
    );
  }
}