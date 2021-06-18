import 'package:flutter/material.dart';
import 'package:hobo_test/models/user_provider.dart';
import 'package:hobo_test/views/choosewho_view.dart';
import 'package:hobo_test/views/loginregister_view.dart';
import 'package:hobo_test/views/managepages_view.dart';
import 'package:hobo_test/views/onboarding_view.dart';
import 'package:hobo_test/widgets/provider/navigationbar_provider.dart';
import 'package:provider/provider.dart';
import 'widgets/provider/dark_theme_provider.dart';
import 'widgets/exports/base_export.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
  NavigationBarProvider scrollDownProvider = new NavigationBarProvider();
  UserProvider userProvider = new UserProvider();

  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initializeFlutterFire();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {

    // Show error message if initialization failed
    if(_error) {
      print(_error);
      return Container();
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Container();
    }


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
        ChangeNotifierProvider<UserProvider>(
            create: (_) {
              return userProvider;
            }
        ),
      ],
      child: Consumer2<DarkThemeProvider, NavigationBarProvider>(
        builder: (BuildContext context, value, value2, Widget child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SliderLayoutView(),
          );
        },
      ),
    );
  }
}
