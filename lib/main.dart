import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hobo_test/methods/firestore_service.dart';
import 'package:hobo_test/models/user_provider.dart';
import 'package:hobo_test/views/managepages_view.dart';
import 'package:hobo_test/views/onboarding_view.dart';
import 'package:hobo_test/widgets/provider/navigationbar_provider.dart';
import 'package:hobo_test/widgets/provider/newtour_provider.dart';
import 'package:hobo_test/widgets/provider/pagecontrol_provider.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
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
  FirestoreService _repository = FirestoreService();

  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
  NavigationBarProvider scrollDownProvider = new NavigationBarProvider();
  NewTourProvider newTourProvider = new NewTourProvider();
  PageControlProvider pageControlProvider = new PageControlProvider();
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

  void getCurrentAppTheme() {
  //  themeChangeProvider.darkTheme =
 //   await themeChangeProvider.darkThemePreference.getTheme();

    var brightness = SchedulerBinding.instance.window.platformBrightness;
    themeChangeProvider.darkTheme = brightness == Brightness.dark;
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
        ChangeNotifierProvider<NewTourProvider>(
            create: (_) {
              return newTourProvider;
            }
        ),
        ChangeNotifierProvider<PageControlProvider>(
            create: (_) {
              return pageControlProvider;
            }
        ),
        ChangeNotifierProvider<UserProvider>(
            create: (_) {
              return userProvider;
            }
        ),
      ],
      child: Consumer4<DarkThemeProvider, NavigationBarProvider, PageControlProvider, NewTourProvider>(
        builder: (BuildContext context, value, value2, value3, value4, Widget child) {

          return MaterialApp(
            debugShowCheckedModeBanner: false,
             home: SplashScreenView(
                navigateRoute: AfterLoad(repository: _repository,),
                duration: 3000,
                imageSize: 140,
                imageSrc: "assets/images/icon.png",
                text: "hobo.",
                pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
                textType: TextType.TyperAnimatedText,
                textStyle: TextStyle(
                  fontSize: 50.0,
                  fontFamily: Constants.POPPINS,
                  fontWeight: FontWeight.bold,
                  color: Styles.hobo_splash(themeChangeProvider.darkTheme, context)
                ),
                backgroundColor: Styles.loginregister_background(themeChangeProvider.darkTheme, context),
              ),
          );
        },
      ),
    );
  }
}

class AfterLoad extends StatelessWidget {
  const AfterLoad({
    Key key,
    @required FirestoreService repository,
  }) : _repository = repository, super(key: key);

  final FirestoreService _repository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _repository.getCurrentUser(),
      builder: (context, AsyncSnapshot<User> snapshot){
        if (snapshot.hasData){
          return ManagePagesView();
        } else {
          Future.wait([
            precachePicture(
              ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/images/Onboarding-1.svg'),
              null,
            ),
            precachePicture(
              ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/images/Onboarding-2.svg'),
              null,
            ),
            precachePicture(
              ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/images/Onboarding-3.svg'),
              null,
            ),
          ]);
          return SliderLayoutView();
        }
      },
    );
  }
}
