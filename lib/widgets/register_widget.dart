import 'package:flutter/cupertino.dart';
import 'size_config.dart';
import 'constants.dart';

class RegisterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.1),
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.07),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Register",
                style: TextStyle(
                    fontFamily: Constants.POPPINS,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
                textAlign: TextAlign.left,
              )),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Enter your login credentials",
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontWeight: FontWeight.w300,
                      fontSize: 17,
                      color: Color.fromRGBO(138, 138, 138, 1)),
                  textAlign: TextAlign.left))
        ],
      ),
    );
  }
}
