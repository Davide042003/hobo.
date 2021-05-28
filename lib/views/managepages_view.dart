import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/styles/dark_theme_styles.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'package:hobo_test/widgets/styles/constants.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/provider/dark_theme_provider.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'home_view.dart';
import 'package:hobo_test/widgets/home/navigationbar_widget.dart';
import 'map_view.dart';

class ManagePagesView extends StatefulWidget {
  @override
  _ManagePagesViewState createState() => _ManagePagesViewState();
}

class _ManagePagesViewState extends State<ManagePagesView> {

  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final _leftPositionList = [0.091, 0.252, 0.411, 0.573, 0.732];
  double _leftPosition = 0.091;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
      _leftPosition = _leftPositionList[_currentPage];
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor:  Styles.loginregister_background(themeChange.darkTheme, context),
        body: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: _onPageChanged,
          children: [
            HomeView(),
            MapView(),
            HomeView(),
            HomeView(),
            HomeView()
          ],
        ),
        bottomNavigationBar:NavigationBarWidget(pageController: _pageController, currentPage: _currentPage, leftPosition: _leftPosition,));
  }
}
