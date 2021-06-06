import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/chat/gradienticon_widget.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class TypeMessageWidget extends StatefulWidget {
  @override
  _TypeMessageWidgetState createState() => _TypeMessageWidgetState();
}

class _TypeMessageWidgetState extends State<TypeMessageWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: SizeConfig.screenHeight * 0.065,
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(Radius.circular(40)),
                color: Styles.home_navigatorbackground(
                    themeChange.darkTheme, context),
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.06),
                      blurRadius: 15,
                      offset: Offset(0, 0))
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.01,),
              child: Center(
                child: TextField(
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 16,
                      color:
                      Styles.searchBar_text(themeChange.darkTheme, context)),
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.add, color: Color.fromRGBO(151, 151, 151, 1),),
                    suffixIcon: themeChange.darkTheme ? Icon(Icons.send, size: 20,color: Color.fromRGBO(116, 142, 243, 1),): GradientIcon(Icons.send, 20,LinearGradient(
                        colors: [
                          Color.fromRGBO(116, 142, 243, 1),
                          Color.fromRGBO(36, 65, 187, 1)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                    )),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Type your message here",
                    hintStyle: TextStyle(
                        fontFamily: Constants.POPPINS,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Styles.chat_typemessage(
                            themeChange.darkTheme, context)),
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
