import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hobo_test/models/user_model.dart';
import 'package:hobo_test/models/user_provider.dart';
import 'package:hobo_test/views/hotplaces_view.dart';
import 'package:hobo_test/widgets/home/hotplaceshome_widget.dart';
import 'package:hobo_test/widgets/home/profileimagehome_widget.dart';
import 'package:hobo_test/widgets/home/searchbar_widget.dart';
import 'package:hobo_test/widgets/home/categories_widget.dart';
import 'package:hobo_test/widgets/home/hotplaces_template.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class HomeView extends StatefulWidget {

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    SizeConfig().init(context);

    final themeChange = Provider.of<DarkThemeProvider>(context);

    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.01,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.07),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore",
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Styles.whiteblack(themeChange.darkTheme, context)),
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.26),
                            blurRadius: 7,
                            offset: Offset(0, 6))
                      ],
                    ),
                    child: ProfileImageHomeWidget(
                        image: AssetImage("assets/images/provaSocial.jpeg"),
                        initials: "DB"))
              ],
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.015),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.07),
            child: Container(
              width: double.infinity,
              height: SizeConfig.screenHeight * 0.23,
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(Radius.circular(30)),
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.025),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.07),
              child: SearchBarWidget()),
          SizedBox(height: SizeConfig.screenHeight * 0.032),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.07),
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hot Places",
                      style: TextStyle(
                          fontFamily: Constants.POPPINS,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Styles.whiteblack(
                              themeChange.darkTheme, context)),
                      textAlign: TextAlign.left),
                  GestureDetector(
                    onTap: (){Navigator.of(context).push(_routeToHotPlaces());},
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        width: SizeConfig.screenWidth * 0.2,
                        child: Text(
                          "See all",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: Styles.whiteblack(
                                  themeChange.darkTheme, context)),
                          textAlign: TextAlign.right,
                        ),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.015),
          Container(
            height: SizeConfig.screenHeight * 0.2,
            child:ListView.builder(
                padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.07),
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: hotPlacesArrayList.length,
                itemBuilder: (ctx, i) => HotPlacesHomeWidget(i))
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.035),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.07),
            child: Container(
              width: double.infinity,
              child: Text(
                "Categories",
                style: TextStyle(
                    fontFamily: Constants.POPPINS,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Styles.whiteblack(themeChange.darkTheme, context)),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          Container(
            height: SizeConfig.screenHeight * 0.05,
            child: ListView(
              padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.07),
              primary: false,
              scrollDirection: Axis.horizontal,
              children: [
               CategoriesWidget(Color.fromRGBO(255, 113, 184, .11), Color.fromRGBO(245, 83, 163, 1), 0.31, Ionicons.restaurant, "Restaurants"),
                SizedBox(width: SizeConfig.screenWidth * 0.03),
                CategoriesWidget(Color.fromRGBO(117, 149, 255, .11), Color.fromRGBO(75, 114, 241, 1), 0.22, Ionicons.bed, "Hotels"),
                SizedBox(width: SizeConfig.screenWidth * 0.03),
                CategoriesWidget(Color.fromRGBO(80, 206, 134, .11), Color.fromRGBO(32, 194, 101, 1), 0.2, Ionicons.earth, "Bars"),
                SizedBox(width: SizeConfig.screenWidth * 0.03),
                CategoriesWidget(Color.fromRGBO(255, 113, 184, .11), Color.fromRGBO(245, 83, 163, 1), 0.31, Ionicons.restaurant, "Restaurants"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Route _routeToHotPlaces() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => HotPlacesView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
