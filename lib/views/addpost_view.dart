import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/home/profileimagehome_widget.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class AddPostView extends StatefulWidget {
  @override
  _AddPostViewState createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  final _formKey = GlobalKey<FormState>();

  FocusNode focusNodeDescription;

  @override
  void initState() {
    super.initState();

    focusNodeDescription = FocusNode();
  }

  @override
  void dispose() {
    focusNodeDescription.dispose();

    super.dispose();
  }


  void _trySubmitForm() async {
    final isValid = _formKey.currentState.validate();

    if (isValid) {

    }
  }
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:
          Styles.loginregister_background(themeChange.darkTheme, context),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.screenHeight * 0.02,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(children: [
                TopBar(themeChange: themeChange),
                Container(
                    height: SizeConfig.screenHeight * 0.105,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ListView.separated(
                        padding:
                            EdgeInsets.only(left: SizeConfig.screenWidth * 0.05),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return Container(
                            width: SizeConfig.screenWidth * 0.24,
                            height: SizeConfig.screenHeight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: Colors.grey,
                            ),
                          );
                        },
                        separatorBuilder: (context, i) =>
                            SizedBox(width: SizeConfig.screenWidth * 0.05),
                      ),
                    )),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.05),
                  child: TextFormField(
                    focusNode: focusNodeDescription,
                    keyboardType: TextInputType.text,
                    maxLines: 8,
                    style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 20
                    ),
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        hintText: "Description",
                        hintStyle: TextStyle(
                            fontFamily: Constants.POPPINS,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(158, 158, 158, 1),)),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03,),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.05),
                  child: Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.00125,
                    color: Styles.bar_addpost(themeChange.darkTheme, context),
                  ),
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.07,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.05),
                    child: Row(
                      children: [
                        Icon(CustomIcons.addplace,
                            size: 18, color: Color.fromRGBO(55, 199, 117, 1)),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.025,
                        ),
                        Text(
                          "Tag People",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 15,
                              color: Styles.whiteblack(
                                  themeChange.darkTheme, context)),
                        ),
                        Expanded(
                            child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            child: Container(
                              width: SizeConfig.screenWidth * 0.15,
                              height: SizeConfig.screenHeight,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 14,
                                  color: Color.fromRGBO(112, 112, 112, 1),
                                ),
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.05),
                  child: Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.00125,
                    color: Styles.bar_addpost(themeChange.darkTheme, context),
                  ),
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.07,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.05),
                    child: Row(
                      children: [
                        Icon(CustomIcons.addplace,
                            size: 18, color: Color.fromRGBO(255, 103, 144, 1)),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.025,
                        ),
                        Text(
                          "Add Place",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 15,
                              color: Styles.whiteblack(
                                  themeChange.darkTheme, context)),
                        ),
                        Expanded(
                            child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            child: Container(
                              width: SizeConfig.screenWidth * 0.15,
                              height: SizeConfig.screenHeight,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 14,
                                  color: Color.fromRGBO(112, 112, 112, 1),
                                ),
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.05),
                  child: Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.00125,
                    color: Styles.bar_addpost(themeChange.darkTheme, context),
                  ),
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.07,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.05),
                    child: Row(
                      children: [
                        Icon(CustomIcons.linktour,
                            size: 18, color: Color.fromRGBO(0, 119, 255, 1)),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.025,
                        ),
                        Text(
                          "Link Tour",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 15,
                              color: Styles.whiteblack(
                                  themeChange.darkTheme, context)),
                        ),
                        Expanded(
                            child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            child: Container(
                              width: SizeConfig.screenWidth * 0.15,
                              height: SizeConfig.screenHeight,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 14,
                                  color: Color.fromRGBO(112, 112, 112, 1),
                                ),
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.05),
                  child: Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.00125,
                    color: Styles.bar_addpost(themeChange.darkTheme, context),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.1),
                  child: GestureDetector(
                    onTap: _trySubmitForm,
                    child: Container(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight * 0.065,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromRGBO(116, 142, 243, 1),
                                Color.fromRGBO(36, 65, 187, 1)
                              ]),
                        ),
                        child: TextButton(
                          onPressed: _trySubmitForm,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Publish",
                                  style: TextStyle(
                                    fontFamily: Constants.POPPINS,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  color: Colors.white,
                                  size: 22,
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key key,
    @required this.themeChange,
  }) : super(key: key);

  final DarkThemeProvider themeChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.1,
      child: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.screenWidth * 0.02,
          right: SizeConfig.screenWidth * 0.06,
        ),
        child: Row(
          children: [
            GestureDetector(
              child: Container(
                width: SizeConfig.screenWidth * 0.125,
                height: SizeConfig.screenHeight,
                child: Icon(
                  CustomIcons.backarrow,
                  color: Styles.whiteblack(themeChange.darkTheme, context),
                  size: 16,
                ),
              ),
            ),
            SizedBox(width: SizeConfig.screenWidth * 0.02),
            Text(
              "New Post",
              style: TextStyle(
                  fontFamily: Constants.POPPINS,
                  color: Styles.whiteblack(themeChange.darkTheme, context),
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                    margin:
                        EdgeInsets.only(left: SizeConfig.screenWidth * 0.15),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.26),
                            blurRadius: 7,
                            offset: Offset(0, 4))
                      ],
                    ),
                    child: ProfileImageHomeWidget(
                        image: AssetImage("assets/images/provaSocial.jpeg"),
                        initials: "DB")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
