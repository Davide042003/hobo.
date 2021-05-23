import 'package:flutter/material.dart';
import 'constants.dart';

class InputFieldStandard extends StatelessWidget {
  final String _text;
  final int _typeText; //0 = tastiera Text, 1 = tastiera mail
  final Function _onChanged;

  InputFieldStandard(this._text, this._typeText, this._onChanged);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: _text,
          labelStyle: TextStyle(
              fontFamily: Constants.POPPINS,
              fontWeight: FontWeight.bold,
              color: _colorText),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _colorUnderline))),
      keyboardType: checkKeyboardType(),
      validator: validateField,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: _onChanged,
    );
  }

  TextInputType checkKeyboardType() {
    if (_typeText == 0) {
      return TextInputType.text;
    } else if (_typeText == 1) {
      return TextInputType.emailAddress;
    }
    return null;
  }

  String validateField(String value) {
    if (_typeText == 0) {
      if (value.trim().isEmpty) {
        return 'This field is required';
      }
      if (value.trim().length <= 3) {
        return 'This field is required';
      }

    } else if (_typeText == 1) {
      if (value
          .trim()
          .isEmpty) {
        return 'Please enter your email address';
      }
      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
        return 'Please enter a valid email address';
      }
    }
    return null;
  }
}
