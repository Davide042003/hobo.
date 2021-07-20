import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class DescriptionNewTour extends StatefulWidget {
  final String text;
  final Function onChanged;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final TextEditingController textEditingController;

  const DescriptionNewTour(this.text, this.onChanged, this.focusNode, this.nextFocusNode, this.textEditingController);

  @override
  _DescriptionNewTourState createState() => _DescriptionNewTourState();
}

class _DescriptionNewTourState extends State<DescriptionNewTour> {

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Theme(
      data: new ThemeData(
        primaryColor: Color.fromRGBO(116, 142, 243, 1),
        hintColor: Styles.loginregister_subheadingandform(
            themeChange.darkTheme, context),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Styles.publishtour_backgroundinputfield(themeChange.darkTheme, context),
        ),
        child: TextFormField(
          controller: widget.textEditingController,
          minLines: 4,
          maxLines: 4,
          focusNode: widget.focusNode,
          autocorrect: false,
          enableSuggestions: false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.035, vertical: SizeConfig.screenHeight * 0.01),
            hintText: widget.text,
            hintStyle: TextStyle(fontFamily: Constants.POPPINS, fontSize: 15, color: Styles.publishtour_hintText(themeChange.darkTheme, context)),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorStyle: TextStyle(
                fontFamily: Constants.POPPINS,
                fontWeight: FontWeight.w300,
                color: Color.fromRGBO(88, 88, 88, 1),
                fontSize: 10),
          ),
          style: TextStyle(fontFamily: Constants.POPPINS,
              fontSize: 15,
              color: Styles.whiteblack(themeChange.darkTheme, context)),
          keyboardType: TextInputType.text,
          validator: validateField,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: widget.onChanged,
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }


  String validateField(String value) {
    if (value
        .trim()
        .isEmpty) {
      return 'This field is required';
    }
    if (value
        .trim()
        .length <= 3) {
      return 'This field is required';
    }
  }
}
