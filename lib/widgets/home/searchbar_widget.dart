import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';


class SearchBarWidget extends StatefulWidget {
  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GestureDetector(
      child: Stack(
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
                        color: Colors.black.withOpacity(.07),
                        blurRadius: 21,
                        offset: Offset(0, 10))
                  ]),
              child: Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.screenWidth * 0.07,
                    right: SizeConfig.screenWidth * 0.07,
                    top: SizeConfig.screenHeight * 0.018),
                child: Text(
                  "Search places",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 16,
                      color:
                          Styles.searchBar_text(themeChange.darkTheme, context)),
                ),
              )),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
                margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.005),
                height: SizeConfig.screenHeight * 0.055,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(116, 142, 243, 1),
                        Color.fromRGBO(36, 65, 187, 1)
                      ]),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(63, 83, 216, .23),
                        blurRadius: 4,
                        offset: Offset(0, 6))
                  ],
                ),
                child: TextButton(
                  onPressed: () async {
                    // todo: delete this function from here
                    try {
                      String userCredentials = FirebaseAuth.instance.currentUser.uid;
                      print(userCredentials);
                      await FirebaseAuth.instance.signOut();
                      print("log out");
                    } catch (e){
                      print("just logout");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.15),
                          blurRadius: 2.0,
                          offset: Offset(0, 1)),
                    ]),
                    child: Icon(CustomIcons.search, color: Colors.white, size: 26),
                  ),
                )),
          ])
        ],
      ),
    );
  }
}
