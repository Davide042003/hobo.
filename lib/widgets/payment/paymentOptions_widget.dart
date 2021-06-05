import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class PaymentOptionsWidget extends StatelessWidget {
  IconData icon;
  String cardType;

  PaymentOptionsWidget(this.icon,this.cardType);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.08,
      margin:
      EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.07),
      decoration: BoxDecoration(
          color: Styles.blackwhite(themeChange.darkTheme, context),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.05),
                blurRadius: 29,
                offset: Offset(0, 3))
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.06),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Styles.whiteblack(themeChange.darkTheme, context),
              size: 40,
            ),
            SizedBox(width: SizeConfig.screenWidth * 0.04),
            Text(
              "$cardType",
              style: TextStyle(
                  fontFamily: Constants.POPPINS,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color:
                  Styles.whiteblack(themeChange.darkTheme, context)),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color:
                  Styles.whiteblack(themeChange.darkTheme, context),
                  size: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
