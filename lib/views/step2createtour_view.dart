import 'package:flutter/material.dart';
import 'package:hobo_test/views/step3createtour_view.dart';
import 'package:hobo_test/widgets/add_tour/language.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class Step2CreateTour extends StatefulWidget {
  @override
  _Step2CreateTourState createState() => _Step2CreateTourState();
}

class _Step2CreateTourState extends State<Step2CreateTour> {
  final _formKey = GlobalKey<FormState>();

  FocusNode focusNodeDescription;

  @override
  void initState() {
    super.initState();

    focusNodeDescription = FocusNode();

    focusNodeDescription.addListener(() {
      setState(() {
        if (focusNodeDescription.hasFocus) {
          focusNodeDescription.requestFocus();
        } else {
          focusNodeDescription.unfocus();
        }
      });
    });
  }

  @override
  void dispose() {
    focusNodeDescription.dispose();

    super.dispose();
  }

  void _trySubmitForm() async {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Step3CreateTour()),
      );
    }
  }

  void _changeLanguage(Language language) {
    setState(() {
      _language = language;
      print(_language.flag);
    });
  }

  String _description = '';
  Language _language = null;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final bottom = MediaQuery.of(context).viewInsets.bottom;

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
            padding: EdgeInsets.only(bottom: bottom),
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.02),
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight * 0.07),
                    Padding(
                      padding:
                          EdgeInsets.only(left: SizeConfig.screenWidth * 0.1),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Let's publish a new tour",
                            style: TextStyle(
                                fontFamily: Constants.POPPINS,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Styles.whiteblack(
                                    themeChange.darkTheme, context)),
                            textAlign: TextAlign.left,
                          )),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: SizeConfig.screenWidth * 0.1),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Step 2",
                              style: TextStyle(
                                  fontFamily: Constants.POPPINS,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17,
                                  color: Styles.loginregister_subheadingandform(
                                      themeChange.darkTheme, context)),
                              textAlign: TextAlign.left)),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    Padding(
                      padding:
                          EdgeInsets.only(left: SizeConfig.screenWidth * 0.1),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Images",
                          style: TextStyle(
                              fontFamily: Constants.POPPINS,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Styles.whiteblack(
                                  themeChange.darkTheme, context)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenWidth * 0.03,
                    ),
                    Container(
                      height: SizeConfig.screenHeight * 0.15,
                      child: ListView.separated(
                        padding:
                            EdgeInsets.only(left: SizeConfig.screenWidth * 0.1),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          if (i == 0) {
                            return Container(
                              width: SizeConfig.screenWidth * 0.35,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                      color: Color.fromRGBO(116, 142, 243, 1),
                                      width: 1),
                                  color: Colors.transparent),
                              child: Center(
                                  child: Text(
                                "+",
                                style: TextStyle(
                                    fontFamily: Constants.POPPINS,
                                    fontSize: 35,
                                    color: Color.fromRGBO(116, 142, 243, 1)),
                              )),
                            );
                          } else {
                            return Container(
                              width: SizeConfig.screenWidth * 0.35,
                              height: SizeConfig.screenHeight,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey,
                              ),
                            );
                          }
                        },
                        separatorBuilder: (context, i) => SizedBox(
                          width: SizeConfig.screenWidth * 0.02,
                        ),
                        itemCount: 3,
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.1),
                      child: InputFieldDescription(
                          "Description",
                          0,
                          null,
                          (value) => _description = value,
                          false,
                          focusNodeDescription,
                          null,
                          18,
                          5),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.1),
                      child: Row(children: [
                        DropdownButton(
                          onChanged: (Language language) {
                            _changeLanguage(language);
                          },
                          underline: SizedBox(),
                          hint: Text("Select Language ", style:
                              TextStyle(fontFamily: Constants.POPPINS,
                                  color: Styles.loginregister_subheadingandform(themeChange.darkTheme, context),
                                  fontSize: 17)),
                          icon: Icon(
                            Icons.language,
                              color: Styles.loginregister_subheadingandform(themeChange.darkTheme, context)
                          ),
                          items: Language.languageList()
                              .map<DropdownMenuItem<Language>>(
                                  (lang) => DropdownMenuItem(
                                      value: lang,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            lang.name,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(lang.flag,
                                              style:
                                              TextStyle(fontFamily:Constants.POPPINS))
                                        ],
                                      )))
                              .toList(),
                        ),
                      ]),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.05),
                    GestureDetector(
                      onTap: _trySubmitForm,
                      child: Container(
                          margin: EdgeInsets.only(
                              right: SizeConfig.screenWidth * 0.1,
                              left: SizeConfig.screenWidth * 0.1),
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight * 0.065,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                            boxShadow: [
                              themeChange.darkTheme
                                  ? BoxShadow()
                                  : BoxShadow(
                                      color: Color.fromRGBO(62, 109, 255, 0.39),
                                      offset: Offset(0, 9),
                                      blurRadius: 15)
                            ],
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(116, 142, 243, 1),
                                  Color.fromRGBO(36, 65, 187, 1)
                                ]),
                          ),
                          child: TextButton(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Continue",
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
                                  )
                                ],
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InputFieldDescription extends StatefulWidget {
  final String text;
  final int typeText; //0 = tastiera Text, 1 = tastiera mail
  final IconData iconPrefix;
  final Function onChanged;
  final bool isRegistration;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final double sizeIcon;
  final int maxLines;

  const InputFieldDescription(
      this.text,
      this.typeText,
      this.iconPrefix,
      this.onChanged,
      this.isRegistration,
      this.focusNode,
      this.nextFocusNode,
      this.sizeIcon,
      this.maxLines);

  @override
  _InputFieldDescriptionState createState() => _InputFieldDescriptionState();
}

class _InputFieldDescriptionState extends State<InputFieldDescription> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    final TextStyle focusText = TextStyle(
        fontFamily: Constants.POPPINS,
        fontWeight: FontWeight.bold,
        height: -1,
        color: widget.isRegistration
            ? Color.fromRGBO(36, 65, 187, 1)
            : Color.fromRGBO(116, 142, 243, 1),
        fontSize: 15);

    final TextStyle regularText = TextStyle(
        fontFamily: Constants.POPPINS,
        color: Styles.loginregister_subheadingandform(
            themeChange.darkTheme, context),
        fontSize: 17);

    TextStyle _textStyle() {
      return widget.focusNode.hasFocus ? focusText : regularText;
    }

    Color _iconColor() {
      return widget.focusNode.hasFocus
          ? widget.isRegistration
              ? Color.fromRGBO(36, 65, 187, 1)
              : Color.fromRGBO(116, 142, 243, 1)
          : Styles.loginregister_subheadingandform(
              themeChange.darkTheme, context);
    }

    return Theme(
      data: new ThemeData(
        primaryColor: widget.isRegistration
            ? Color.fromRGBO(36, 65, 187, 1)
            : Color.fromRGBO(116, 142, 243, 1),
        hintColor: Styles.loginregister_subheadingandform(
            themeChange.darkTheme, context),
      ),
      child: TextFormField(
        maxLines: widget.maxLines,
        minLines: 1,
        focusNode: widget.focusNode,
        autocorrect: false,
        enableSuggestions: false,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          prefixIcon: widget.iconPrefix != null
              ? Icon(
                  widget.iconPrefix,
                  color: _iconColor(),
                  size: widget.sizeIcon,
                )
              : null,
          labelText: widget.text,
          labelStyle: _textStyle(),
          focusColor: widget.isRegistration
              ? Color.fromRGBO(36, 65, 187, 1)
              : Color.fromRGBO(116, 142, 243, 1),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: widget.isRegistration
                      ? Color.fromRGBO(36, 65, 187, 1)
                      : Color.fromRGBO(116, 142, 243, 1),
                  width: 2)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Styles.loginregister_subheadingandform(
                      themeChange.darkTheme, context),
                  width: 1)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Styles.loginregister_subheadingandform(
                      themeChange.darkTheme, context),
                  width: 1)),
          errorStyle: TextStyle(
              fontFamily: Constants.POPPINS,
              fontWeight: FontWeight.w300,
              color: Color.fromRGBO(88, 88, 88, 1),
              fontSize: 10),
        ),
        style: TextStyle(
            fontFamily: Constants.POPPINS,
            fontSize: 17,
            color: Styles.whiteblack(themeChange.darkTheme, context)),
        keyboardType: checkKeyboardType(),
        validator: validateField,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: widget.onChanged,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  TextInputType checkKeyboardType() {
    if (widget.typeText == 0) {
      return TextInputType.text;
    } else if (widget.typeText == 1) {
      return TextInputType.emailAddress;
    } else if (widget.typeText == 2) {
      return TextInputType.number;
    }
    return null;
  }

  String validateField(String value) {
    if (widget.typeText == 0) {
      if (value.trim().isEmpty) {
        return 'This field is required';
      }
      if (value.trim().length <= 3) {
        return 'This field is required';
      }
    } else if (widget.typeText == 1) {
      if (value.trim().isEmpty) {
        return 'Please enter your email address';
      }
      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
        return 'Please enter a valid email address';
      }
    }
    return null;
  }
}
