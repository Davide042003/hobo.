import 'package:flutter/material.dart';
import 'package:hobo_test/views/addcard_view.dart';
import 'package:hobo_test/views/chat_view.dart';
import 'package:hobo_test/views/home_view.dart';
import 'package:hobo_test/views/loginregister_view.dart';
import 'package:hobo_test/views/managepages_view.dart';
import 'package:hobo_test/views/onboarding_view.dart';
import 'package:hobo_test/views/paymentdetails_view.dart';
import 'package:hobo_test/views/toursummary_view.dart';
import 'package:hobo_test/widgets/onBoarding/onboarding_template.dart';
import 'package:hobo_test/widgets/provider/navigationbar_provider.dart';
import 'package:provider/provider.dart';
import 'widgets/provider/dark_theme_provider.dart';
import 'widgets/styles/dark_theme_styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
  NavigationBarProvider scrollDownProvider = new NavigationBarProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkThemeProvider>(
            create: (_) {
              return themeChangeProvider;
            }
        ),
        ChangeNotifierProvider<NavigationBarProvider>(
            create: (_) {
              return scrollDownProvider;
            }
        ),
      ],
      child: Consumer2<DarkThemeProvider, NavigationBarProvider>(
        builder: (BuildContext context, value, value2, Widget child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: ManagePagesView(),
          );
        },
      ),
    );
  }
}
