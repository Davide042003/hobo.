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
    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.04, vertical: SizeConfig.screenHeight * 0.012),
              decoration: BoxDecoration(
                color: bg,
                borderRadius: radius,
              ),
              child: Text(message,
                  style: TextStyle(
                    fontFamily: Constants.POPPINS,
                    color: Styles.whiteblack(themeChange.darkTheme, context),
                    fontSize: 14.0,
                  )),
              constraints: BoxConstraints(maxWidth: SizeConfig.screenWidth*0.75),
            ),
          ],
        ),
      ],
    );
  }
}