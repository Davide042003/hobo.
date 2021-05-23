import 'package:flutter/material.dart';
import 'constants.dart';

class InputFieldPassword extends StatefulWidget {
  final bool show;
  final VoidCallback callback;
  final Function validator;
  final Function onChanged;

  const InputFieldPassword (this.show,this.callback, this.validator, this.onChanged);

  @override
  _InputFieldPasswordState createState() => _InputFieldPasswordState();
}

class _InputFieldPasswordState extends State<InputFieldPassword> {
  TextStyle _textStyle;

  final TextStyle regularText = TextStyle(
      fontFamily: Constants.POPPINS,
      color: Color.fromRGBO(88, 88, 88, 1),
      fontSize: 17);

  final TextStyle focusText = TextStyle(
      fontFamily: Constants.POPPINS,
      fontWeight: FontWeight.bold,
      height: -1,
      color: Color.fromRGBO(116, 142, 243, 1),
      fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return Focus(
        onFocusChange: (hasFocus) {
          setState(() => _textStyle = hasFocus ? focusText : regularText);},
        child:
        TextFormField(
          obscureText: !widget.show,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.vpn_key_outlined),
              suffixIcon: IconButton(
                icon: Icon(widget.show ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: Color.fromRGBO(193, 193, 193, 1)),
                onPressed: widget.callback,
              ),
              errorStyle: TextStyle(
                  fontFamily: Constants.POPPINS,
                  fontWeight: FontWeight.w300,
                  color: Color.fromRGBO(88, 88, 88, 1),
                  fontSize: 10),
              labelText: "Password",
              labelStyle: _textStyle,
              focusColor: Color.fromRGBO(116, 142, 243, 1),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(116, 142, 243, 1), width: 2))),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          onChanged: widget.onChanged,
        )
    );
  }

  String _validatePassword(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value))
        return 'Enter valid password';
      else
        return null;
    }
  }
}


