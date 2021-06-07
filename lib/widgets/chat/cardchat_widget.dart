import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class Bubble extends StatelessWidget {
  Bubble({this.message, this.time, this.delivered, this.isMe});

  final String message, time;
  final delivered, isMe;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    final bg = isMe ? Styles.chat_send(themeChange.darkTheme, context) : Styles.chat_receive(themeChange.darkTheme, context);
    final align = isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final icon = delivered ? Icons.done_all : Icons.done;
    final radius = isMe
        ? BorderRadius.only(
            topRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          )
        : BorderRadius.only(
            bottomRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.04),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: radius,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(message,
            style: TextStyle(
              fontFamily: Constants.POPPINS,
              color: Styles.whiteblack(themeChange.darkTheme, context),
              fontSize: 14.0,
            )),
        subtitle: Align(
          alignment: Alignment.bottomRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(time,
                  style: TextStyle(
                    fontFamily: Constants.POPPINS,
                    color: Color.fromRGBO(183, 183, 183, 1),
                    fontSize: 10.0,
                  )),
              SizedBox(width: SizeConfig.screenWidth*0.007),
              Icon(
                icon,
                size: 12.0,
                color: Colors.black38,
              )
            ],
          ),
        ),
      ),
      constraints: BoxConstraints(maxWidth: SizeConfig.screenWidth*0.75),
    );
  }
}