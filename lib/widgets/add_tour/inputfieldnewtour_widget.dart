import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class InputFieldNewTour extends StatefulWidget {
  final String text;
  final Function onChanged;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final bool isForNumber;

  const InputFieldNewTour(this.text, this.onChanged, this.focusNode, this.nextFocusNode, this.isForNumber);

  @override
  _InputFieldNewTourState createState() => _InputFieldNewTourState();
}

class _InputFieldNewTourState extends State<InputFieldNewTour> {

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
          focusNode: widget.focusNode,
          autocorrect: false,
          enableSuggestions: false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.035),
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
          keyboardType: widget.isForNumber ? TextInputType.number: TextInputType.text,
          validator: validateField,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: widget.onChanged,
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }


  String validateField(String value) {
    if(!widget.isForNumber) {
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
}
