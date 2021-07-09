import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hobo_test/methods/firestore_service.dart';
import 'package:hobo_test/views/settings_view.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/profile/gallery_widget.dart';
import 'package:hobo_test/widgets/profile/informationBoxProfile_widget.dart';
import 'package:hobo_test/widgets/profile/profileimage_widget.dart';
import 'package:hobo_test/widgets/profile/reviewcard_widget.dart';
import 'package:hobo_test/widgets/profile/tourlistprofile_widget.dart';
import 'package:hobo_test/widgets/provider/navigationbar_provider.dart';
import 'package:hobo_test/widgets/profile/topBarProfile_widget.dart';
import 'package:hobo_test/widgets/profile/pinnedAppBar_widget.dart';
import 'package:hobo_test/widgets/profile/appBarProfile_widget.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with TickerProviderStateMixin {
  bool isMe = true;

  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final _leftPositionList = [0.0, 0.333, 0.666];
  double _leftPosition = 0;
  final ScrollController _scrollController = ScrollController();
  double animationPos;
  bool visible = false;
  bool pinnedAppBar = false;

  final FirestoreService _repository = FirestoreService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String documentId;
  String userName;

  @override
  void initState() {
    super.initState();
    _scrollController
      ..addListener(() {
        if (_scrollController.offset >= SizeConfig.screenHeight * 0.2) {
          setState(() {
            if (!visible) visible = true;
          });
        } else if (_scrollController.offset <= SizeConfig.screenHeight * 0.18) {
          setState(() {
            if (visible) visible = false;
          });
        }

        if (_scrollController.offset >= SizeConfig.screenHeight * 0.448) {
          setState(() {
            if (!pinnedAppBar) pinnedAppBar = true;
          });
        } else if (_scrollController.offset < SizeConfig.screenHeight * 0.448) {
          setState(() {
            if (pinnedAppBar) pinnedAppBar = false;
          });
        }

        if (_scrollController.offset < SizeConfig.screenHeight * 0.25) {
          if (_scrollController.offset >= SizeConfig.screenHeight * 0.2 &&
              _scrollController.offset <= SizeConfig.screenHeight * 0.24) {
            double pos =
                ((_scrollController.offset - SizeConfig.screenHeight * 0.2) /
                    (SizeConfig.screenHeight * 0.24 -
                        SizeConfig.screenHeight * 0.2));
            animationPos = pos;
          }
        } else {
          animationPos = 1;
        }
      });
    documentId = _auth.currentUser.uid;
    print("Document Id $documentId");
    /*
    _repository.getUserName().then((value) {
      setState(() {
        userName = value;
      });
    });
     */
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
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
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    CollectionReference tours = FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser.uid)
        .collection('tours');
    CollectionReference posts = FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser.uid)
        .collection('posts');
    CollectionReference reviews = FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser.uid)
        .collection('reviews');

    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final downScroll = Provider.of<NavigationBarProvider>(context);

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong"));
        }
        if (snapshot.hasData && !snapshot.data.exists) {
          return Center(child: Text("Document does not exist"));
        }

        if (snapshot.hasData) {
          Map<String, dynamic> data =
              snapshot.data.data() as Map<String, dynamic>;
          //return Text("Full Name: ${data['username']} ${data['email']}");

          return NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification) {
                if (_scrollController.position.userScrollDirection ==
                    ScrollDirection.reverse) {
                  setState(() {
                    downScroll.navigationdown = true;
                  });
                } else if (_scrollController.position.userScrollDirection ==
                    ScrollDirection.forward) {
                  setState(() {
                    downScroll.navigationdown = false;
                  });
                }
              } else if (scrollNotification is ScrollEndNotification) {
                setState(() {
                  downScroll.navigationdown = false;
                });
              }
            },
            child: Stack(
              children: [
                SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  controller: _scrollController,
                  child: Stack(
                    children: [
                      Container(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight * 0.3,
                        child: Image.asset(
                          "assets/images/background-profile.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.815,
                            top: SizeConfig.screenHeight * 0.065),
                        width: SizeConfig.screenWidth * 0.11,
                        height: SizeConfig.screenHeight * 0.055,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(116, 142, 243, 1),
                                  Color.fromRGBO(36, 65, 187, 1)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            shape: BoxShape.circle),
                        child: isMe
                            ? GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(.15),
                                            blurRadius: 2.0,
                                            offset: Offset(0, 1)),
                                      ]),
                                  child: Icon(Ionicons.settings_outline,
                                      color: Colors.white, size: 22),
                                ),
                                onTap: () {
                                  _repository.createPosts(
                                      _auth.currentUser.uid,
                                      'post test',
                                      'Rome',
                                      null,
                                      55,
                                      'This is a caption... ',
                                      10);
                                  _repository.createReviews(
                                      _auth.currentUser.uid,
                                      _auth.currentUser.displayName,
                                      "id del turista",
                                      "usernametourist",
                                      "id tour",
                                      4,
                                      "21-06-2021",
                                      "Descrizione della review");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SettingsView()),
                                  );
                                },
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(.06),
                                          blurRadius: 3.0,
                                          offset: Offset(0, 6)),
                                    ]),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: SizeConfig.screenHeight * 0.005),
                                  child: Icon(CustomIcons.messagge,
                                      color: Colors.white, size: 32),
                                ),
                              ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.screenWidth * 0.08),
                            child: Stack(
                              children: [
                                InformationBoxWidget(
                                    username: data['username'],
                                    ratings: data['ratings'],
                                    totalRatings: data['totalRatings'],
                                    revenue: data['revenue'],
                                    followers: data['followers'],
                                    followed: data['followed'],
                                    referralCode: data['referralCode'],
                                    themeChange: themeChange,
                                    isMe: true),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: SizeConfig.screenHeight * 0.09,
                                      left: SizeConfig.screenWidth * 0.285),
                                  child: ProfileImageWidget(
                                      image: AssetImage(
                                          "assets/images/provaSocial.jpeg"),
                                      initials: "DB"),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.screenHeight * 0.01),
                            width: SizeConfig.screenWidth,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                pinnedAppBar
                                    ? SizedBox(
                                        height: SizeConfig.screenHeight * 0.05,
                                      )
                                    : AppBarWidget(
                                        themeChange: themeChange,
                                        leftPosition: _leftPosition,
                                        currentPage: _currentPage,
                                        pageController: _pageController),
                                ExpandablePageView(
                                  controller: _pageController,
                                  onPageChanged: _onPageChanged,
                                  children: [
                                    TourlistProfileWidget(
                                        userId: _auth.currentUser.uid),
                                    GalleryWidget(
                                        userId: _auth.currentUser.uid),
                                    ReviewCardWidget(
                                        userId: _auth.currentUser.uid),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                visible
                    ? TopBarWidget(
                        animationPos: animationPos, themeChange: themeChange)
                    : SizedBox(),
                pinnedAppBar
                    ? PinnedAppBarWidget(
                        themeChange: themeChange,
                        leftPosition: _leftPosition,
                        currentPage: _currentPage,
                        pageController: _pageController)
                    : SizedBox(),
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.8),
                  child: Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.2,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Styles.social_gradientstart(
                              themeChange.darkTheme, context),
                          Styles.social_gradientend(
                              themeChange.darkTheme, context)
                        ],
                            begin: Alignment(
                                Alignment.topCenter.x,
                                Alignment.topCenter.y +
                                    SizeConfig.screenHeight * 0.0005),
                            end: Alignment(
                                Alignment.bottomCenter.x,
                                Alignment.bottomCenter.y -
                                    SizeConfig.screenHeight * 0.0003))),
                  ),
                )
              ],
            ),
          );
        }

        return Text("loading");
      },
    );
  }
}
