import 'package:flutter/material.dart';
import 'constants.dart';

class InputFieldStandard extends StatefulWidget {
  final String text;
  final int typeText; //0 = tastiera Text, 1 = tastiera mail
  final IconData iconPrefix;
  final Function onChanged;
  final bool isRegistration;

  const InputFieldStandard(this.text, this.typeText, this.iconPrefix,
      this.onChanged, this.isRegistration);

  @override
  _InputFieldStandardState createState() => _InputFieldStandardState();
}

class _InputFieldStandardState extends State<InputFieldStandard> {
  TextStyle _textStyle;

  final TextStyle regularText = TextStyle(
      fontFamily: Constants.POPPINS,
      color: Color.fromRGBO(88, 88, 88, 1),
      height: -0.01,
      fontSize: 17);

  @override
  Widget build(BuildContext context) {

    final TextStyle focusText = TextStyle(
        fontFamily: Constants.POPPINS,
        fontWeight: FontWeight.bold,
        height: -1,
        color: widget.isRegistration
            ? Color.fromRGBO(36, 65, 187, 1)
            : Color.fromRGBO(116, 142, 243, 1),
        fontSize: 15);

    return Focus(
        onFocusChange: (hasFocus) {
          setState(() => _textStyle = hasFocus ? focusText : regularText);
        },
        child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                widget.iconPrefix,
              ),
              labelText: widget.text,
              labelStyle: _textStyle,
              focusColor: widget.isRegistration
                  ? Color.fromRGBO(36, 65, 187, 1)
                  : Color.fromRGBO(116, 142, 243, 1),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: widget.isRegistration
                          ? Color.fromRGBO(36, 65, 187, 1)
                          : Color.fromRGBO(116, 142, 243, 1),
                      width: 2)),
              errorStyle: TextStyle(
                  fontFamily: Constants.POPPINS,
                  fontWeight: FontWeight.w300,
                  color: Color.fromRGBO(88, 88, 88, 1),
                  fontSize: 10),
            ),
            keyboardType: checkKeyboardType(),
            validator: validateField,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: widget.onChanged));
  }

  TextInputType checkKeyboardType() {
    if (widget.typeText == 0) {
      return TextInputType.text;
    } else if (widget.typeText == 1) {
      return TextInputType.emailAddress;
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
